import React from 'react';
import { Form, Input, Button, notification } from 'antd';
import { useAuthStore } from '../model/auth-store'; // Import the store
import { Link, useNavigate } from 'react-router-dom'; // Import useNavigate

export const SignUpForm = () => {
  const [loading, setLoading] = React.useState(false);
  const signUp = useAuthStore((state) => state.signUp); // Get the signUp function
  const navigate = useNavigate(); // Hook for navigation

  const onFinish = async (values: any) => {
    setLoading(true);
    const error = await signUp({
      email: values.email,
      password: values.password,
      lastName: values.lastName,
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
      navigate('/login'); // Redirect to login page
    }
    setLoading(false);
  };

  return (
    <Form name="signup" onFinish={onFinish} layout="vertical" requiredMark={false}>
      <Form.Item
        name="lastName"
        label="Фамилия"
        rules={[{ required: true, message: 'Пожалуйста, введите вашу фамилию!' }]}
      >
        <Input />
      </Form.Item>

      <Form.Item
        name="email"
        label="Рабочий Email"
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
