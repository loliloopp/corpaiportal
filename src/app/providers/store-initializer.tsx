import { useEffect, useRef } from 'react';
import { useAuthStore } from '@/features/auth';
import { useLimitsStore, getUserProfile, createUserProfile } from '@/entities/limits';

export const StoreInitializer = () => {
    const user = useAuthStore((state) => state.user);
    const { fetchUserProfile, fetchUsage } = useLimitsStore();
    const isProcessing = useRef(false);

    useEffect(() => {
        const handleAuthChange = async () => {
            if (user) {
                if (isProcessing.current) return;
                isProcessing.current = true;

                try {
                    let profile = await getUserProfile(user.id);
                    if (!profile) {
                        try {
                            profile = await createUserProfile(user.id, user.email!);
                        } catch (error: any) {
                            if (error.code === '23505') { // Handle race condition
                                profile = await getUserProfile(user.id);
                            } else {
                                console.error("Failed to create user profile", error);
                            }
                        }
                    }
                    
                    if (profile) {
                        fetchUserProfile(user.id);
                        fetchUsage(user.id);
                    }
                } finally {
                    isProcessing.current = false;
                }

            } else {
                useLimitsStore.setState({
                    profile: null,
                    dailyUsage: { requests: 0, tokens: 0 },
                    monthlyUsage: { requests: 0, tokens: 0 },
                    loading: false
                });
            }
        };
        handleAuthChange();
    }, [user, fetchUserProfile, fetchUsage]);

    return null;
};
