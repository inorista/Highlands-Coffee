import 'package:flutter/material.dart';
import 'dart:math';

class khuyenmai {
  final String id_khuyenmai;
  final String anh_khuyenmai;
  final String tieude_khuyenmai;
  final String mota_khuyenmai;
  final List<dynamic> dieukien_khuyenmai;

  khuyenmai({
    required this.id_khuyenmai,
    required this.anh_khuyenmai,
    required this.tieude_khuyenmai,
    required this.mota_khuyenmai,
    required this.dieukien_khuyenmai,
  });
}

var rng = Random();
khuyenmai combo_thang_6 = new khuyenmai(
  id_khuyenmai: "promo${rng.nextInt(100000).toString()}",
  anh_khuyenmai:
      "https://firebasestorage.googleapis.com/v0/b/seemon-83eb8.appspot.com/o/promo%2FStandard.png?alt=media&token=45c45efe-c9f6-4e4d-a0ed-8a29eacee2a3",
  tieude_khuyenmai: "COMBO ƯU ĐÃI THÁNG 6 ĐẬM CHUYỆN CÙNG NGƯỜI THƯƠNG",
  mota_khuyenmai:
      """Ngày Gia Đình Việt Nam 28/6 sắp đến. Thật là một cái "cớ" tuyệt vời để bạn có dịp kết nối, chia sẻ với những người mình yêu thương và hãy để thật nhiều câu chuyện đậm đà của bạn được lưu lại tại không gian của Highlands Coffee bạn nhé!""",
  dieukien_khuyenmai: [
    "Áp dụng cho tất cả các sản phẩm Cà phê truyền thống, Trà và Freeze của Highlands Coffee",
    "Ưu đãi: Khi mua nhiều sản phẩm, khách hàng nhận ưu đãi trực tiếp trên tổng giá combo, chi tiết theo từng combo khách hàng nhận được trên hình ảnh tại quầy order hoặc vui lòng liên hệ nhân viên để có thông tin chi tiết",
    "Ưu đãi áp dụng đến 3/7",
  ],
);

khuyenmai tranh_thu_upsize = new khuyenmai(
  id_khuyenmai: "promo${rng.nextInt(100000).toString()}",
  anh_khuyenmai:
      "https://firebasestorage.googleapis.com/v0/b/seemon-83eb8.appspot.com/o/promo%2FStandard.png?alt=media&token=45c45efe-c9f6-4e4d-a0ed-8a29eacee2a3",
  tieude_khuyenmai: "COMBO ƯU ĐÃI THÁNG 6 ĐẬM CHUYỆN CÙNG NGƯỜI THƯƠNG",
  mota_khuyenmai:
      """🔥 Mang ngay chiếc hóa đơn cũ đến quán Highlands Coffee yêu thích để được miễn phí upsize (nâng cỡ ly lớn) nha fans ơi!\n\n🔥 “Cao thủ không bằng tranh thủ”; khi mà chỉ cần có chiếc hóa đơn từ lần mua trước là được ưu đãi free upsize (M lên L) thì tội gì không dùng ngay chứ! Chiếc ưu đãi này đặc biệt có lợi cho các fans “cắm trụ” ở Highlands Coffee hằng ngày đó.\n\n🔥 Đây là một món quà Highlands Coffee muốn gửi đến quý khách hàng yêu thương và hy vọng rằng các bạn sẽ cứ tới ủng hộ quán hoài hoài! 😘""",
  dieukien_khuyenmai: [
    "Khách hàng giữ hóa đơn & quay lại trong vòng 03 ngày từ ngày xuất hóa đơn sẽ được ưu đãi free upsize từ cỡ vừa (M) lên cỡ lớn (L) cho 01 sản phẩm thức uống",
    "Chỉ áp dụng cho 01 sản phẩm trên 01 hóa đơn và 01 lần duy nhất",
    "Không có giá trị quy đổi thành tiền mặt",
    "Không áp dụng với các chương trình ưu đãi khác",
    "Thời gian diễn ra chương trình: 08/06 – 03/07/2022",
    "Không áp dụng tại các quán ở Sân bay, VinWonders Phú Quốc và Dinh Độc Lập 2 (bên trong)",
  ],
);

khuyenmai momo = new khuyenmai(
  id_khuyenmai: "promo${rng.nextInt(100000).toString()}",
  anh_khuyenmai:
      "https://firebasestorage.googleapis.com/v0/b/seemon-83eb8.appspot.com/o/promo%2FStandard.png?alt=media&token=45c45efe-c9f6-4e4d-a0ed-8a29eacee2a3",
  tieude_khuyenmai: "🙆 PHIÊU CÙNG BẠN MỚI - HIGHLANDS TUNG CHIÊU",
  mota_khuyenmai:
      """🔥 Bạn mới tới chơi, đồ ngon cứ để Highlands mời. Chỉ cần nhập mã MMCAFE25K, bạn được giảm ngay 25% tối đa 25.000đ cho hóa đơn từ 80.000đ khi đặt món trên Mini App Highlands Coffee.""",
  dieukien_khuyenmai: [
    "Không có giá trị quy đổi thành tiền mặt",
    "Không áp dụng với các chương trình ưu đãi khác",
    "🕣 Chương trình diễn ra từ 05/08 - 31/08 với số lượng có hạn, có thể kết thúc sớm.",
  ],
);
