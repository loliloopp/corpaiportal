import { Select } from 'antd';

interface ModelSelectorProps {
  value: string;
  onChange: (value: string) => void;
}

export const ModelSelector: React.FC<ModelSelectorProps> = ({ value, onChange }) => {
  const models = [
    { value: 'deepseek-chat', label: 'DeepSeek Chat' },
    { value: 'deepseek-coder', label: 'DeepSeek Coder' },
  ];

  return (
    <Select
      value={value}
      onChange={onChange}
      options={models}
      style={{ minWidth: 180 }}
    />
  );
};

