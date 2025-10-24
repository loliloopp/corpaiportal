import { Card, Col, Row } from 'antd';
import { LoginForm } from '@/features/auth';

const LoginPage = () => {
  return (
    <Row justify="center" align="middle" style={{ minHeight: '100vh' }}>
      <Col xs={22} sm={16} md={12} lg={8} xl={6}>
        <Card title="Вход в AI-портал">
          <LoginForm />
        </Card>
      </Col>
    </Row>
  );
};

export default LoginPage;
