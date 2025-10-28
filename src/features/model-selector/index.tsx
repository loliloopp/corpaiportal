import React from 'react';
import { Select } from 'antd';
import { MODELS, Model } from '@/shared/config/models.config';

const { OptGroup } = Select;

interface ModelSelectorProps {
  value: string;
  onChange: (value: string) => void;
  availableModels: Model[];
}

export const ModelSelector: React.FC<ModelSelectorProps> = ({ value, onChange, availableModels }) => {
  // Group models by provider
  const groupedModels = availableModels.reduce((acc, model) => {
    const provider = model.provider;
    if (!acc[provider]) {
      acc[provider] = [];
    }
    acc[provider].push(model);
    return acc;
  }, {} as Record<string, Model[]>);

  // Provider display names
  const providerNames: Record<string, string> = {
    openai: 'OpenAI',
    deepseek: 'DeepSeek',
    gemini: 'Google Gemini',
    grok: 'Grok',
    openrouter: 'OpenRouter',
  };

  return (
    <Select 
      value={value} 
      onChange={onChange} 
      style={{ width: '100%' }}
      showSearch
      filterOption={(input, option) =>
        (option?.children as string)?.toLowerCase().includes(input.toLowerCase())
      }
    >
      {Object.entries(groupedModels).map(([provider, models]) => (
        <OptGroup key={provider} label={providerNames[provider] || provider}>
          {models.map((model) => (
            <Select.Option key={model.id} value={model.id}>
              {model.name}
            </Select.Option>
          ))}
        </OptGroup>
      ))}
    </Select>
  );
};

