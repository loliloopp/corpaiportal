import { Select } from 'antd';
import { MODELS } from '@/shared/config/models.config';

interface ModelSelectorProps {
  value: string;
  onChange: (value: string) => void;
}

export const ModelSelector: React.FC<ModelSelectorProps> = ({ value, onChange }) => {
  const modelOptions = MODELS.map(model => ({
    value: model.id,
    label: model.name,
  }));

  return (
    <Select
      value={value}
      onChange={onChange}
      options={modelOptions}
      style={{ minWidth: 180 }}
    />
  );
};

