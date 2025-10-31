import React, { useMemo, useState, useEffect } from 'react';
import { Select } from 'antd';
import { MODELS, Model } from '@/shared/config/models.config';
import { getModelDescriptions, getModelCosts, getSetting } from '@/entities/models/api/models-api';

interface ModelSelectorProps {
  value: string;
  onChange: (value: string) => void;
  availableModels: Model[];
}

const modelRecommendations: Record<string, string> = {
  'gpt-5': 'Для сложных задач и генерации высококачественного текста',
  'gpt-5-mini': 'Быстрые ответы и общие консультации для всех пользователей',
  'grok-4-fast': 'Для быстрого анализа технических задач и поиска в интернете',
  'gemini-2.5-pro': 'Для финансового и управленческого анализа',
  'gemini-2.5-flash': 'Для мониторинга процессов и оперативной поддержки задач',
  'deepseek-chat': 'Для анализа больших данных и прогнозирования ресурсов',
  'claude-haiku': 'Для глубокого юридического анализа и стратегического планирования',
};

export const ModelSelector: React.FC<ModelSelectorProps> = ({ value, onChange, availableModels }) => {
  const [descriptions, setDescriptions] = useState<Map<string, string | null>>(new Map());
  const [costs, setCosts] = useState<Map<string, string | null>>(new Map());
  const [showCost, setShowCost] = useState(false);

  // Load descriptions and costs from cache on mount
  useEffect(() => {
    const loadData = async () => {
      const descMap = await getModelDescriptions();
      setDescriptions(descMap);
      
      const costMap = await getModelCosts();
      setCosts(costMap);
      
      const showCostSetting = await getSetting('show_cost_in_selector');
      setShowCost(showCostSetting);
    };
    loadData();
  }, []);

  const sortedModels = useMemo(() => {
    return [...availableModels].sort((a, b) => a.name.localeCompare(b.name));
  }, [availableModels]);

  // Get tooltip/description for a model from DB, fallback to hardcoded
  const getModelDescription = (model: Model): string | undefined => {
    // First check if description is in cache from DB
    const dbDescription = descriptions.get(model.id);
    if (dbDescription) {
      return dbDescription;
    }
    // Then check if model has description field (from availableModels)
    if (model.description) {
      return model.description;
    }
    // Fallback to hardcoded recommendations for built-in models
    return modelRecommendations[model.id];
  };

  // Get display label for model (with optional cost)
  const getModelLabel = (model: Model): string => {
    if (!showCost) {
      return model.name;
    }
    
    const cost = costs.get(model.id);
    if (cost) {
      return `${model.name} - ${cost}`;
    }
    
    return model.name;
  };

  return (
    <Select 
      value={value} 
      onChange={onChange} 
      style={{ width: '100%' }}
      showSearch
      filterOption={(input, option) =>
        (option?.children as unknown as string)?.toLowerCase().includes(input.toLowerCase())
      }
    >
      {sortedModels.map((model) => (
        <Select.Option 
          key={model.id} 
          value={model.id}
          title={getModelDescription(model)}
        >
          {getModelLabel(model)}
        </Select.Option>
      ))}
    </Select>
  );
};

