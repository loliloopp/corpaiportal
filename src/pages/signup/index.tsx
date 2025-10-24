import { SignUpForm } from '@/features/auth';
import { Card, Col, Row } from 'antd';

const SignUpPage = () => {
  return (
    <Row justify="center" align="middle" style={{ minHeight: '100vh' }}>
      <Col xs={22} sm={16} md={12} lg={8} xl={6}>
        <Card title="Регистрация в AI-портале">
          <SignUpForm />
        </Card>
      </Col>
    </Row>
  );
};

export default SignUpPage;
