import axios from 'axios';

interface TokenCache {
  token: string;
  expiresAt: number; // timestamp in milliseconds
}

interface CloudRuTokenResponse {
  access_token: string;
  expires_in: number; // seconds
}

class CloudRuTokenService {
  private static instance: CloudRuTokenService;
  private tokenCache: TokenCache | null = null;
  private readonly IAM_TOKEN_URL = 'https://iam.api.cloud.ru/api/v1/auth/token';
  private readonly TOKEN_REFRESH_BUFFER_MS = 5 * 60 * 1000; // 5 minutes

  private constructor() {}

  static getInstance(): CloudRuTokenService {
    if (!CloudRuTokenService.instance) {
      CloudRuTokenService.instance = new CloudRuTokenService();
    }
    return CloudRuTokenService.instance;
  }

  /**
   * Get access token. Returns cached token if valid, otherwise fetches a new one.
   */
  async getAccessToken(): Promise<string> {
    // Check if cached token is still valid
    if (this.tokenCache && Date.now() < this.tokenCache.expiresAt - this.TOKEN_REFRESH_BUFFER_MS) {
      console.log('[CloudRu] Using cached access token');
      return this.tokenCache.token;
    }

    // Token expired or doesn't exist, fetch new one
    console.log('[CloudRu] Fetching new access token');
    return await this.refreshToken();
  }

  /**
   * Fetch a new access token from Cloud.ru IAM
   */
  async refreshToken(): Promise<string> {
    const keyId = process.env.CLOUD_RU_KEY_ID;
    const keySecret = process.env.CLOUD_RU_KEY_SECRET;

    if (!keyId || !keySecret) {
      throw new Error('CLOUD_RU_KEY_ID and CLOUD_RU_KEY_SECRET must be set in environment variables');
    }

    try {
      const response = await axios.post<CloudRuTokenResponse>(
        this.IAM_TOKEN_URL,
        {
          keyId,
          secret: keySecret
        },
        {
          headers: {
            'Content-Type': 'application/json'
          },
          timeout: 10000 // 10 seconds
        }
      );

      const { access_token, expires_in } = response.data;

      // Cache the token
      this.tokenCache = {
        token: access_token,
        expiresAt: Date.now() + expires_in * 1000 // Convert seconds to milliseconds
      };

      console.log(`[CloudRu] New access token obtained, expires in ${expires_in} seconds`);

      return access_token;
    } catch (error: any) {
      console.error('[CloudRu] Failed to obtain access token:', error.message);
      if (error.response) {
        console.error('[CloudRu] IAM API error:', {
          status: error.response.status,
          data: error.response.data
        });
      }
      throw new Error(`Failed to obtain Cloud.ru access token: ${error.message}`);
    }
  }

  /**
   * Clear cached token (useful when receiving 401 errors)
   */
  clearCache(): void {
    console.log('[CloudRu] Clearing token cache');
    this.tokenCache = null;
  }
}

export default CloudRuTokenService;

