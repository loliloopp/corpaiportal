import React, { useMemo } from 'react';
import { Select } from 'antd';
import { MODELS, Model } from '@/shared/config/models.config';

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
  const sortedModels = useMemo(() => {
    return [...availableModels].sort((a, b) => a.name.localeCompare(b.name));
  }, [availableModels]);

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
          title={modelRecommendations[model.id]}
        >
          {model.name}
        </Select.Option>
      ))}
    </Select>
  );
};

