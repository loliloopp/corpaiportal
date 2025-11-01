import { SupabaseClient } from "@supabase/supabase-js";

interface CostRecord {
    timestamp: number;
    cost: number;
}

class CostLimiterService {
    private costHistory: CostRecord[] = [];
    private hourlyLimit: number; // in USD
    private windowMs: number = 3600 * 1000; // 1 hour

    constructor(supabase: SupabaseClient, hourlyLimit: number = parseFloat(process.env.HOURLY_COST_LIMIT || '50')) {
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
        this.cleanup();
        return this.costHistory.reduce((acc, record) => acc + record.cost, 0);
    }

    public isLimitExceeded(): boolean {
        this.cleanup();
        return this.getCurrentCost() > this.hourlyLimit;
    }

    public getHourlyLimit(): number {
        return this.hourlyLimit;
    }

    private cleanup() {
        const now = Date.now();
        this.costHistory = this.costHistory.filter(record => (now - record.timestamp) < this.windowMs);
    }
}

export default CostLimiterService;
