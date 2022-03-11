import 'package:flutter/material.dart';
import 'package:seo_renderer/renderers/text_renderer/text_renderer_vm.dart';

class Warning extends StatelessWidget {
  const Warning({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 700,
      child: Center(
        child: TextRenderer(
          child: Text(
            "Bu sitede yer alan içeriğin doğru ve/veya güncel olduğu hiçbir şekilde iddia veya garanti edilmemekte, hiçbir veri ve/veya paylaşım, yatırım danışmanlığı kapsamına girmemektedir. Sitenin içeriği referans alınarak yapılacak hiçbir işlemin doğuracağı maddi ve/veya manevi herhangi bir kayıptan bu site sorumlu değildir. Detaylı bilgiler banka şubelerinden alınabilmektedir.",
          ),
        ),
      ),
    );
  }
}
