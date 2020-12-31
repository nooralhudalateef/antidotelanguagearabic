import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'dart:math' as math;
import 'package:antidotelanguagearabic/utilities/Constants.dart';
class AboutCodeForIraq extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new AboutCodeForIraqState();
  }
}

class AboutCodeForIraqState extends State<AboutCodeForIraq> {
  @override

  final _random = math.Random();
  SystemUiOverlayStyle _currentStyle = SystemUiOverlayStyle.light;
  bool _rememberMe = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Color(0xff92D0FF),
        backgroundColor: Colors.deepPurpleAccent,
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.menu,
              color: Colors.white,
            ),
            onPressed: () { aboutAppAlertDialog(context); },
          )
        ],
        title: const Text(
          'عن المُبادرة',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'El_Messiri',
            fontSize: 20.0,
          ),
          textAlign: TextAlign.center,
          //textDirection: TextDirection.rtl,
        ),
      ),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                color: Colors.white,
              ),
              Container(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 14.0,
                    vertical: 2.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: 13.0),
                      new Container(
                        padding: EdgeInsets.fromLTRB(10, 40.0, 10, 0.0),
                        child: Column(
                          children: <Widget>[
                            new Container(
                              height: 100.0,
                              width: 160.0,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      'assets/logo/Code for iraq logo PNG.png'),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            SizedBox(height: 20.0),
                            new Text('وهي مبادرة إنسانية غير ربحية تهدف إلى خدمة المجتمع عن طريق البرمجة، تعتبر هذه المبادرة مبادرة '
                                'تعليمية حقيقية ترعى المهتمين بتعلم تصميم وبرمجة  تطبيقات الهاتف الجوال، ومواقع الانترنت،  وبرامج '
                                'الحاسوب، والشبكات والاتصالات،  ونظم تشغيل الحاسوب، باستخدام التقنيات  مفتوحة المصدر كما، توفر لهم'
                                'جميع الدروس التعليمية الازمة وبشكل مجاني  تمامًا بل الأهم من ذلك تعتمد على مبدأ المواطنة والمشاركة '
                                'الفاعلة  في تأسيس وبناء المجتمع. تدعو هذه المبادرة جميع الطلبة والخريجين والهواة  والأساتذة الجامعيين '
                                'والمهتمين مجال البرمجة وتقنيات المعلومات وكذلك الاختصاصات الأخرى إلى التطوع والمشاركة '
                                'الفعلية لأجل الارتقاء بواقع البلد، حيث تعتبر فرصة عظيمة لاكتساب الخبرة والمهارة عن طريق تصميم وتنفيذ '
                                'برامج وتطبيقات خدمية  من شأنها خدمة المواطن؛ وذلك ضمن مجاميع  عمل نشطة وفعالة يتعاون فيها'
                                ' الافراد كفريق واحد يتبادل الآراء والخبرات ويطرح الافكار ليتم مناقشتها وتطبيقها على أرض الواقع،'
                                'كما تفتح المجال لجميع المواطنين العراقيين  ومن جميع الاختصاصات إلى المشاركة الفاعلة في هذه '
                                'المشاريع لرفد الفريق بالخبرات والأفكار والآراء والمقترحات التي من شأنها خدمة المجتمع بأفضل ما يمكن.',
                              textDirection: TextDirection.rtl,
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                color: Colors.black87,
                                fontFamily: 'El_Messiri',
                                fontSize: 18.0,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

    );
  }
}
