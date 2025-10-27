import React from 'react';
import { Select } from 'antd';
import { MODELS, Model } from '@/shared/config/models.config';

interface ModelSelectorProps {
  value: string;
  onChange: (value: string) => void;
  availableModels: Model[];
}

export const ModelSelector: React.FC<ModelSelectorProps> = ({ value, onChange, availableModels }) => {
  const groupedModels = availableModels.reduce((acc, model) => {
    if (!acc[model.provider]) {
      acc[model.provider] = [];
    }
    acc[model.provider].push(model);
    return acc;
  }, {} as Record<string, Model[]>);

  return (
    <Select value={value} onChange={onChange} style={{ width: '100%' }}>
      {Object.entries(groupedModels).map(([provider, models]) => (
        <Select.OptGroup label={provider.toUpperCase()} key={provider}>
          {models.map((model) => (
            <Select.Option key={model.id} value={model.id}>
              {model.name}
            </Select.Option>
          ))}
        </Select.OptGroup>
      ))}
    </Select>
  );
};

