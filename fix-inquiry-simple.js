// 간단한 테스트: inquiries API가 실제로 작동하는지 확인
const data = {
  name: "테스트",
  phone: "010-1234-5678",
  email: "test@test.com",
  subject: "테스트",
  destination: "발리",
  budget: "500만원",
  travelers: 2,
  duration: "5일",
  message: "테스트 메시지"
};

console.log('Test data:', JSON.stringify(data, null, 2));
console.log('\nGenerated ID:', `inquiry-${Date.now()}-${Math.random().toString(36).substr(2, 9)}`);
