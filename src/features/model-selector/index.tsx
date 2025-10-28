import React, { useMemo } from 'react';
import { Select } from 'antd';
import { MODELS, Model } from '@/shared/config/models.config';

interface ModelSelectorProps {
  value: string;
  onChange: (value: string) => void;
  availableModels: Model[];
}

export const ModelSelector: React.FC<ModelSelectorProps> = ({ value, onChange, availableModels }) => {
  // Sort models by name alphabetically
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
        (option?.children as string)?.toLowerCase().includes(input.toLowerCase())
      }
    >
      {sortedModels.map((model) => (
        <Select.Option key={model.id} value={model.id}>
          {model.name}
        </Select.Option>
      ))}
    </Select>
  );
};

