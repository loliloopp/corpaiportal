import React, { useEffect, useState } from 'react';
import { Button, Space, Spin } from 'antd';
import { useQuery } from '@tanstack/react-query';
import { getAllPrompts } from '@/entities/prompts';
import { usePromptsStore } from '@/entities/prompts/model/prompts-store';
import { getSetting } from '@/entities/models/api/models-api';

export const PromptSelector: React.FC = () => {
  const [enablePreprocessing, setEnablePreprocessing] = useState(false);
  const { selectedPrompt, setSelectedPrompt } = usePromptsStore();

  const { data: prompts = [], isLoading } = useQuery({
    queryKey: ['allPrompts'],
    queryFn: getAllPrompts,
  });

  // Load preprocessing setting and sync with store
  useEffect(() => {
    const loadSetting = async () => {
      const enabled = await getSetting('enable_prompt_preprocessing');
      setEnablePreprocessing(enabled);
      
      // If preprocessing is disabled, clear selected prompt
      if (!enabled) {
        setSelectedPrompt(null);
      }
    };
    loadSetting();
  }, [setSelectedPrompt]);

  // Auto-select default prompt only if none is selected (first time user)
  useEffect(() => {
    if (prompts.length > 0 && selectedPrompt === null && enablePreprocessing) {
      // Find the default prompt and select it (only on first load)
      const defaultPrompt = prompts.find(p => p.by_default);
      if (defaultPrompt) {
        setSelectedPrompt(defaultPrompt);
      }
    }
  }, [prompts.length, enablePreprocessing]); // Only run when prompts load or preprocessing changes

  if (!enablePreprocessing || prompts.length === 0) {
    return null;
  }

  // Show up to 10 prompts from database
  const filteredPrompts = prompts.slice(0, 10);

  return (
    <Spin spinning={isLoading}>
      <div style={{ marginBottom: 12 }}>
        <Space wrap size="small">
          {filteredPrompts.map((prompt) => (
            <Button
              key={prompt.id}
              onClick={() => {
                // Toggle: if already selected, deselect; otherwise select
                if (selectedPrompt?.id === prompt.id) {
                  setSelectedPrompt(null); // Deselect all
                } else {
                  setSelectedPrompt(prompt); // Select this prompt
                }
              }}
              type={selectedPrompt?.id === prompt.id ? 'primary' : 'default'}
              size="small"
            >
              {prompt.role_name}
            </Button>
          ))}
        </Space>
      </div>
    </Spin>
  );
};
