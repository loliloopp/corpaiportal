import React from 'react';
import { Form, Input, Button, notification } from 'antd';
import { supabase } from '@/shared/lib/supabase';
import { Link } from 'react-router-dom';

export const SignUpForm = () => {
  const [loading, setLoading] = React.useState(false);

  const onFinish = async (values: any) => {
    setLoading(true);
    const { error } = await supabase.auth.signUp({
      email: values.email,
      password: values.password,
    });

    if (error) {
      notification.error({
        message: 'Ошибка регистрации',
        description: error.message,
      });
    } else {
      notification.success({
        message: 'Регистрация успешна',
        description: 'Пожалуйста, проверьте свою почту для подтверждения.',
      });
    }
    setLoading(false);
  };

  return (
    <Form name="signup" onFinish={onFinish} layout="vertical" requiredMark={false}>
      <Form.Item
        name="email"
        label="Email"
        rules={[{ required: true, type: 'email', message: 'Пожалуйста, введите корректный email!' }]}
      >
        <Input />
      </Form.Item>

      <Form.Item
        name="password"
        label="Пароль"
        rules={[{ required: true, min: 6, message: 'Пароль должен быть не менее 6 символов!' }]}
      >
        <Input.Password />
      </Form.Item>

      <Form.Item
        name="confirm"
        label="Подтвердите пароль"
        dependencies={['password']}
        hasFeedback
        rules={[
          { required: true, message: 'Пожалуйста, подтвердите пароль!' },
          ({ getFieldValue }) => ({
            validator(_, value) {
              if (!value || getFieldValue('password') === value) {
                return Promise.resolve();
              }
              return Promise.reject(new Error('Пароли не совпадают!'));
            },
          }),
        ]}
      >
        <Input.Password />
      </Form.Item>

      <Form.Item>
        <Button type="primary" htmlType="submit" loading={loading} block>
          Зарегистрироваться
        </Button>
      </Form.Item>
      <Form.Item style={{ textAlign: 'center' }}>
        Уже есть аккаунт? <Link to="/login">Войти</Link>
      </Form.Item>
    </Form>
  );
};
