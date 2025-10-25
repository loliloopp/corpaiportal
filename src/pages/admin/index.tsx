import React, { useState } from 'react';
import { Typography, Table, Select, InputNumber, Button, message, Form } from 'antd';
import { useQuery, useMutation, useQueryClient } from '@tanstack/react-query';
import { getAllUsers, updateUserProfile, UserProfile } from '@/entities/users/api/users-api';

const { Title } = Typography;
const { Option } = Select;

interface EditableCellProps extends React.HTMLAttributes<HTMLElement> {
  editing: boolean;
  dataIndex: keyof UserProfile;
  title: any;
  inputType: 'number' | 'select';
  record: UserProfile;
  index: number;
}

const EditableCell: React.FC<React.PropsWithChildren<EditableCellProps>> = ({
  editing,
  dataIndex,
  title,
  inputType,
  children,
  ...restProps
}) => {
  const inputNode =
    inputType === 'number' ? (
      <InputNumber />
    ) : (
      <Select style={{ width: 120 }}>
        <Option value="admin">Admin</Option>
        <Option value="user">User</Option>
      </Select>
    );

  return (
    <td {...restProps}>
      {editing ? (
        <Form.Item
          name={dataIndex}
          style={{ margin: 0 }}
          rules={[{ required: true, message: `Please Input ${title}!` }]}
        >
          {inputNode}
        </Form.Item>
      ) : (
        children
      )}
    </td>
  );
};

const AdminPage: React.FC = () => {
  const [form] = Form.useForm();
  const queryClient = useQueryClient();
  const [editingKey, setEditingKey] = useState('');

  const { data: users, isLoading } = useQuery({ queryKey: ['users'], queryFn: getAllUsers });

  const mutation = useMutation({
    mutationFn: (variables: { userId: string; updates: Partial<UserProfile> }) =>
      updateUserProfile(variables.userId, variables.updates),
    onSuccess: () => {
      message.success('Профиль пользователя обновлен');
      queryClient.invalidateQueries({ queryKey: ['users'] });
      setEditingKey('');
    },
    onError: (error) => {
      message.error(`Ошибка при обновлении профиля: ${error.message}`);
    },
  });

  const isEditing = (record: UserProfile) => record.id === editingKey;

  const edit = (record: Partial<UserProfile> & { id: React.Key }) => {
    form.setFieldsValue({ ...record });
    setEditingKey(record.id);
  };

  const cancel = () => {
    setEditingKey('');
  };

  const save = async (key: React.Key) => {
    try {
      const row = (await form.validateFields()) as Partial<UserProfile>;
      mutation.mutate({ userId: key as string, updates: row });
    } catch (errInfo) {
      console.log('Validate Failed:', errInfo);
    }
  };

  const columns = [
    { title: 'Email', dataIndex: 'email', key: 'email', editable: false },
    {
      title: 'Роль',
      dataIndex: 'role',
      key: 'role',
      editable: true,
      inputType: 'select',
    },
    {
      title: 'Дневной лимит',
      dataIndex: 'daily_request_limit',
      key: 'daily_request_limit',
      editable: true,
      inputType: 'number',
    },
    {
      title: 'Действия',
      dataIndex: 'action',
      render: (_: any, record: UserProfile) => {
        const editable = isEditing(record);
        return editable ? (
          <span>
            <Button onClick={() => save(record.id)} type="primary" style={{ marginRight: 8 }}>
              Сохранить
            </Button>
            <Button onClick={cancel}>Отмена</Button>
          </span>
        ) : (
          <Button disabled={editingKey !== ''} onClick={() => edit(record)}>
            Редактировать
          </Button>
        );
      },
    },
  ];

  const mergedColumns = columns.map((col) => {
    if (!col.editable) {
      return col;
    }
    return {
      ...col,
      onCell: (record: UserProfile) => ({
        record,
        inputType: col.inputType,
        dataIndex: col.dataIndex,
        title: col.title,
        editing: isEditing(record),
      }),
    };
  });

  return (
    <div>
      <Title level={2}>Управление пользователями</Title>
      <Form form={form} component={false}>
        <Table
          components={{
            body: {
              cell: EditableCell,
            },
          }}
          dataSource={users}
          columns={mergedColumns}
          rowKey="id"
          loading={isLoading}
          bordered
        />
      </Form>
    </div>
  );
};

export default AdminPage;
