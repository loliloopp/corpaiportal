interface CostRecord {
    timestamp: number;
    cost: number;
}

class CostLimiterService {
    private costHistory: CostRecord[] = [];
    private hourlyLimit: number; // in USD
    private windowMs: number = 3600 * 1000; // 1 hour

    constructor(hourlyLimit: number) {
        this.hourlyLimit = hourlyLimit;
    }

    public addCost(cost: number) {
        this.costHistory.push({ timestamp: Date.now(), cost });
        this.cleanup();
    }

    public canProceed(estimatedCost: number): boolean {
        this.cleanup();
        const currentCost = this.getCurrentCost();
        return (currentCost + estimatedCost) <= this.hourlyLimit;
    }

    public getCurrentCost(): number {
        return this.costHistory.reduce((acc, record) => acc + record.cost, 0);
    }
    
    private cleanup() {
        const now = Date.now();
        this.costHistory = this.costHistory.filter(record => (now - record.timestamp) < this.windowMs);
    }
}

// Singleton instance
export const costLimiterService = new CostLimiterService(parseFloat(process.env.HOURLY_COST_LIMIT || '50'));
