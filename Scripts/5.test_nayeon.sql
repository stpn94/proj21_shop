-- nayeon test script
-- 회원가입
insert into member(m_id, m_passwd, m_name, m_phone, m_birthday, m_gender, m_question_num, m_answer, m_email, m_addr, m_addr_de)
values ('skdus2421', 'skdus6559', '이나연', '010-5505-6559', '1997-09-12', 1, 1, '삿포로', 'skdus2421@naver.com', '대구광역시 북구 침산남로 19길 8', '202동 1301호');

-- 로그인
select m_passwd 
  from member
 where m_id = 'skdus2421';

-- 후기 내용 클릭
select re_num, pro_num, re_member, re_content, re_image, re_image2, re_date, re_stars
  from review;

-- 후기 작성(제품부터 입력 후 후기 입력)
insert into product
values (1, 1, 1, '블라우스', 10000, 10, '2020-05-26', '판매중', 1, 1, 1, 1, 1);

insert into review
values (1, 1, '이나연', '옷이 너무 맘에 드네요', 'insert1.jpg', 'insert2.jpg', '2021-5-26', 5);

-- 후기 내역
select pro_num, re_member, re_content, re_image, re_date
  from review;

-- 후기 수정
update review
   set re_content = '옷에 실밥이 너무 많아요', re_image = 'update1.jpg', re_image2 = 'update2.jpg', re_stars = 4
 where re_num = 1;


-- Q&A 내역(주문 입력 후 내역 조회) 
insert into `order` 
values ('skdus2421', 1, 1, '이나연', 1, 10000, 100, '이나연', '010-5505-6559', '053-523-6559', '대구광역시 북구 침산남로 19길 8', '202동 1301호', '배송중', '문앞에 나둬주세요', '2021-05-28', '이나연', '농협', 3021058);

select o.or_num, o.receiver_tel1, q.q_file, q.q_title, q.q_member, q.q_date
  from `order` o 
  join qna q
    on o.order_member_name = q.q_member;


-- Q&A 수정(Q&A 입력 후 수정)
insert into qna(q_pro_num, q_title, q_option, q_member, q_content, q_file, q_date, q_hits, q_group, q_indent, q_step)
values (1, '불량제품 교환', '교환문의', '이나연', '옷이 찢어져서 왔어요', 'q&a.jpg', '2021-05-26', 1, 1, 1, 1);

update qna
   set q_title = '불량제품 반품', q_option = '반품문의', q_content = '찢어져서 온 옷을 반품하고 싶어요', q_date = '2021-05-27'
 where q_index = 1;

-- 회원 정보 수정(본인확인질문과 답변 일치 확인 후 수정)
select m_question_num
  from member
 where m_id = 'skdus2421';

update member
   set m_phone = '010-3432-6559', m_email = 'skdus2421@hanmail.net', m_addr = '대구광역시 북구 침산남로 14길 5', m_addr_de = '505동 1005호'
 where m_id = 'skdus2421';

-- 주문 내역(입력 후 검색)
select * from `order`;

select o.or_num, o.pro_num, o.order_date, o.order_pro_quantity, o.order_price, o.delivery_status, p.pro_name, r.re_date 
  from `order` o
  join product p
    on o.pro_num = p.pro_num
  join review r 
    on p.pro_num = r.pro_num;
    
-- 회원 탈퇴(비밀번호 검색 후 일치하면 탈퇴)
select m_passwd
  from member
 where m_id = 'skdus2421';

update member
   set m_exit = 0
 where m_id = 'skdus2421';

-- 주문 상세 내역 페이지 //상품정보에 사진을 어떻게 넣는지 모르겠어서 번호로 우선 넣어놓기로 함, 적립금 어떻게 해야할지 모르겠음
select or_num, pro_num, order_price, order_pro_quantity, delivery_status, order_date 
  from `order`
 where order_member_id = 'skdus2421';
 
-- 배송지 정보
select order_member_name, receiver_tel1, receiver_tel2, delivery_addr, delivery_addr_de 
  from `order`
 where order_member_id = 'skdus2421';
 
-- 최종 결제 정보
select order_price, order_discount
  from `order`
 where order_member_id = 'skdus2421';
