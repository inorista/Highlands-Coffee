import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seemon/constants/padding_constants.dart';
import 'package:seemon/constants/style_constants..dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(
            children: [
              Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  "assets/images/about_hc.jpg",
                  fit: BoxFit.fitWidth,
                ),
              ),
              Positioned(
                top: 30,
                left: 12,
                child: GestureDetector(
                  onTap: () => Get.back(),
                  child: const Icon(
                    EvaIcons.arrowIosBack,
                    size: 25,
                    color: Colors.white,
                  ),
                ),
              ),
              Positioned(
                bottom: 25,
                left: 12,
                child: Text(
                  "Khởi nguồn đam mê",
                  style: kStyleAboutTitleHeader,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: kPaddingDefault * 2,
              horizontal: kPaddingDefault,
            ),
            child: Text(
              "Thương hiệu bắt nguồn từ cà phê Việt Nam",
              style: kStyleAboutTitle,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: kPaddingDefault,
            ),
            child: Text(
              "Từ tình yêu với Việt Nam và niềm đam mê cà phê, năm 1999, thương hiệu Highlands Coffee® ra đời với khát vọng nâng tầm di sản cà phê lâu đời của Việt Nam và lan rộng tinh thần tự hào, kết nối hài hoà giữa truyền thống với hiện đại.\n\nBắt đầu với sản phẩm cà phê đóng gói tại Hà Nội vào năm 2000, chúng tôi đã nhanh chóng phát triển và mở rộng thành thương hiệu quán cà phê nổi tiếng và không ngừng mở rộng hoạt động trong và ngoài nước từ năm 2002.\n\nQua một chặng đường dài, chúng tôi đã không ngừng mang đến những sản phẩm cà phê thơm ngon, sánh đượm trong không gian thoải mái và lịch sự. Những ly cà phê của chúng tôi không chỉ đơn thuần là thức uống quen thuộc mà còn mang trên mình một sứ mệnh văn hóa phản ánh một phần nếp sống hiện đại của người Việt Nam.\n\nĐến nay, Highlands Coffee® vẫn duy trì khâu phân loại cà phê bằng tay để chọn ra từng hạt cà phê chất lượng nhất, rang mới mỗi ngày và phục vụ quý khách với nụ cười rạng rỡ trên môi. Bí quyết thành công của chúng tôi là đây: không gian quán tuyệt vời, sản phẩm tuyệt hảo và dịch vụ chu đáo với mức giá phù hợp.",
              style: kStyleAboutText,
            ),
          ),
        ],
      ),
    );
  }
}
