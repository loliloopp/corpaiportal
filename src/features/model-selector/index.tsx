import React from 'react';
import { Select } from 'antd';
import { MODELS, Model } from '@/shared/config/models.config';

interface ModelSelectorProps {
  value: string;
  onChange: (value: string) => void;
  availableModels: Model[];
}

export const ModelSelector: React.FC<ModelSelectorProps> = ({ value, onChange, availableModels }) => {
  return (
    <Select value={value} onChange={onChange} style={{ width: '100%' }}>
      {availableModels.map((model) => (
        <Select.Option key={model.id} value={model.id}>
          {model.name}
        </Select.Option>
      ))}
    </Select>
  );
};

