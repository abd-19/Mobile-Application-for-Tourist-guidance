// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:translator/translator.dart';

class TranslatorPage extends StatefulWidget {
  @override
  _TranslatorPageState createState() => _TranslatorPageState();
}

class _TranslatorPageState extends State<TranslatorPage> {
  String _inputText = '';
  String _translatedText = '';
  String _selectedFromLanguage = 'en';
  String _selectedToLanguage = 'ar';
  final GoogleTranslator _translator = GoogleTranslator();

  Map<String, String> languageNames = {
    'en': 'English',
    'es': 'Spanish',
    'fr': 'French',
    'de': 'German',
    'ja': 'Japanese',
    'ko': 'Korean',
    'ar': 'Arabic',
    'it': 'Italian',
    'pt': 'Portuguese',
  };

  List<String> iraqiWords = [
    'شلونك؟ (shlonak/shlonik?) - How are you?',
    'وين رايح؟ (wein rayeh?) - Where are you going?',
    'ماشي (mashi) - Okay',
    'تفتكر؟ (tiftekir?) - Do you think?',
    'متفائل (mutafa\'il) - Optimistic',
    'كارثة (kartha) - Disaster',
    'مكتئب (makta\'ib) - Depressed',
    'معليش (maalesh) - It\'s okay',
    'هلا (hala) - Hello',
    'ليش؟ (leysh?) - Why?',
    'صار (saar) - Happened',
    'حتى (hata) - Even',
    'كلشي (kullshi) - Everything',
    'مشغول (mashghool) - Busy',
    'شكراً (shukran) - Thank you',
    'مبين (mubin) - Clear',
    'أكيد (akid) - Sure',
    'نفسيات (nafsyaat) - Psychology',
    'حلوة (helwa) - Sweet',
    'ركز (rakaz) - Focus',
    'ماشي حاله (mashi halla) - Doing well',
    'كيفك (keefak/keefik?) - How are you?',
    'ناوي (nawi) - Planning',
    'صاير (saa\'er) - Happening',
    'نتعشى (nit\'asha) - Let\'s have dinner',
    'مافي مشكلة (mafi mushkila) - No problem',
    'بالهناء والشفاء (bilhanaa washshifaa) - Bon appétit',
    'طيب (tayyib) - Fine',
    'جميل (jameel) - Beautiful',
    'ميت (meet) - Dead',
    'موجود (mawjood) - Available',
    'معلش (ma3lesh) - Sorry',
    'طالعة (taale\'a) - Going out',
    'طالع (taale\') - Going up',
    'يلا (yalla) - Let\'s go',
    'تعال (ta3al) - Come',
    'صحة (saha) - Health',
    'حمدلله (hamdullah) - Thanks to God',
    'قصدي (qasdi) - Intention',
    'بالراحة (bilraha) - Comfortably',
    'مبسوط (mabsut) - Happy',
    'معقول (maqool) - Believable',
    'مبتسم (mubtasim) - Smiling',
    'طيّب (tayyib) - Good',
    'بكرة (bukra) - Tomorrow',
    'ماكو (makoo) - None',
    'كل الحب (kul ilhubb) - All the love',
    'مستحيل (mustahil) - Impossible',
    'بايخ (bayyikh) - Nonsense',
    'تقدر (tigdar) - Can',
    'حبيبي/حبيبتي (habeibi/habeibti) - My dear',
    'واو (waw) - Wow',
    'فهمت (fahimt) - Understood',
    'على راسي (ala raasi) - On my head',
    'عالفاضي (ala fadee) - In vain',
    'ما عندي خلق (ma andi khilq) - I don\'t have the energy',
    'والله (wallah) - By God',
    'عندك (3andak/3andik?) - Do you have?',
    'في الخير (fi ilkhair) - In goodness',
    'نوم (nawm) - Sleep',
    'كدة (keda) - Like this',
    'يتمم على خير (yitamm \'ala khair) - May it be well',
    'بالصحة والعافية (bilsaha wal-afiya) - For health and wellness',
    'تمام (tamam) - Fine',
    'حبة (hba) - Pill',
    'ما يكون (ma ykoon) - It won\'t happen',
    'تفاصيل (tafasil) - Details',
    'طمن (tammen) - Inform',
    'ما بيها كلام (ma biha kalam) - No problem',
    'شنو هذا؟ (shno haadha?) - What is this?',
    'مالت عليك (malt \'alayk) - He leaned on you',
    'بصحة وعافية (biseha w\'afiya) - With health and wellness',
    'وايد (waayid) - A lot',
    'ما تستاهل (ma tastahil) - Not worth it',
    'على العكس (ala al\'aks) - On the contrary',
    'فيني (feeni) - In me',
    'ما يهمك (ma yhimmak) - It doesn\'t matter',
    'بكم (bikam) - How much?',
    'عند الله (3ind Allah) - With God',
    'مشيت (mashayt) - I walked',
    'شو حكيت؟ (shu hakeet?) - What did you say?',
    'كل واحد (kul waahid) - Each one',
    'يا حلو (ya heloo) - Oh sweet one',
    'كلو بخير (kullu bikhair) - All is well',
    'ما بعرف (ma ba\'rif) - I don\'t know',
    'ما بتحبني (ma btehibbni) - You don\'t love me',
    'شفته (shiftu) - I saw it',
    'نحنا (n7na) - We',
    'شفتك (shiftak/shiftik?) - I saw you',
    'مافي (mafi) - None',
    'شلونكم؟ (shlonkum?) - How are you all?',
    'بدي (bidi) - I want',
    'إيه (eeh) - Yes',
    'جدع (jiddan) - Brave',
    'يا ريت (ya reet) - I wish',
    'معك حق (maak haqq) - You\'re right',
    'همسة (hamsa) - Whisper',
    'فينك (feenk/feenik?) - Where are you?',
    'حبي (hobi) - My love',
    'عمري (omri) - My life',
    'خلاص (khallas) - Done',
    'بالعكس (bilaaks) - On the contrary',
    'إن شاء الله (inshallah) - If God wills',
    'يلا بينا (yalla beina) - Let\'s go',
    'توكل على الله (tawakkal ala Allah) - Trust in God',
    'اهون عليك (ahwan aleik) - It\'s easier for you',
    'سهلة (sahla) - Easy',
    'الله يكون في عونك (Allah yekoon fi aounak) - May God assist you',
    'صح لسانك (sahh lesanak) - Speak clearly',
    'فرصة سعيدة (forsa sa\'ida) - Happy opportunity',
    'قد الأمور (quad il omor) - All matters are possible',
    'كل عام وأنتم بخير (kul aam wa antum bikhair) - Every year and you are well',
    'يعطيك العافية (ya\'teek ilaafiyah) - May you be rewarded with good health',
    'صار الوقت (saar ilwaqt) - It\'s time',
    'الله يحميك (Allah yehmik) - May God protect you',
    'بالشفاء (bil shifaa) - Get well',
    'ما عندك (ma3andak/ma3andik?) - Don\'t have',
    'انشالله (inshallah) - God willing',
    'بأيدك (biyedak/biyedik?) - In your hands',
    'هات (haat) - Give',
    'كفاية (kifaya) - Enough',
    'حظ سعيد (haz sa\'eed) - Good luck',
    'بتمون (bitmoon) - I\'m fine',
    'أي والله (ay wallah) - Yes indeed',
    'في أي مكان (fe ayyi makaan) - Anywhere',
    'شو في؟ (shu feeh?) - What\'s up?',
    'هيا (haya) - Come on',
    'خلص (khalas) - Finished',
    'يعني (ya3ni) - I mean',
    'خير (khair) - Good',
    'لو سمحت (law samaht) - Please',
    'ما عاد في (ma aad fe) - No more',
    'بعدين (ba3deen) - Later',
    'بالتوفيق (bil tawfiq) - Good luck',
    'حبيبي (habeibi) - My dear',
    'بنص الليل (bunus il layl) - At midnight',
    'على الهوا (ala il hawa) - On the air',
    'أحلى (ahla) - The best',
    'مو معقول (mu maqool) - Unbelievable',
    'بتحبني (btehibbni) - Do you love me?',
  ];

  bool showSuggestions = false;

  void _translateText() async {
    if (_inputText.isNotEmpty) {
      setState(() {
        showSuggestions = false;
      });

      Translation translation = await _translator.translate(
        _inputText,
        from: _selectedFromLanguage,
        to: _selectedToLanguage,
      );
      setState(() {
        _translatedText = translation.text;
      });
    }
  }

  void _onChanged(String value) {
    setState(() {
      _inputText = value;
      showSuggestions = _inputText.isEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: Center(
          child: Text(
            'Translator',
            style: TextStyle(
              fontSize: 30,
              color: const Color.fromARGB(255, 241, 240, 240),
              fontWeight: FontWeight.bold,
              fontFamily: 'PT Sans',
            ),
          ),
        ),
        backgroundColor: Color(0xff008fa0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          height: double.infinity,
          width: 500,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(30, 5, 0, 0),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xffd8d8d8),
                    ),
                    borderRadius: BorderRadius.circular(50.0),
                    color: Color(0xffd8d8d8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            DropdownButton<String>(
                              style: TextStyle(
                                fontSize: 20,
                                color: Color(0xff3b3b3b),
                                fontWeight: FontWeight.bold,
                              ),
                              value: _selectedFromLanguage,
                              items: languageNames.keys
                                  .map<DropdownMenuItem<String>>((String code) {
                                return DropdownMenuItem<String>(
                                  value: code,
                                  child: Text(
                                    languageNames[code]!,
                                    textDirection: TextDirection.ltr,
                                  ),
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  _selectedFromLanguage = value!;
                                });
                              },
                              underline: Container(),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 16.0),
                      InkWell(
                        onTap: () {
                          setState(() {
                            String temp = _selectedFromLanguage;
                            _selectedFromLanguage = _selectedToLanguage;
                            _selectedToLanguage = temp;
                          });
                        },
                        child: Icon(
                          Icons.compare_arrows,
                        ),
                      ),
                      SizedBox(width: 50.0),
                      Expanded(
                        child: Row(
                          children: [
                            DropdownButton<String>(
                              style: TextStyle(
                                fontSize: 20,
                                color: Color(0xff3b3b3b),
                                fontWeight: FontWeight.bold,
                              ),
                              value: _selectedToLanguage,
                              items: languageNames.keys
                                  .map<DropdownMenuItem<String>>((String code) {
                                return DropdownMenuItem<String>(
                                  value: code,
                                  child: Text(
                                    languageNames[code]!,
                                    textDirection: TextDirection.ltr,
                                  ),
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  _selectedToLanguage = value!;
                                });
                              },
                              underline: Container(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16.0),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xffd8d8d8),
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                    color: Color(0xffd8d8d8),
                  ),
                  child: TextField(
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xff3b3b3b),
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 5,
                    onChanged: _onChanged,
                    decoration: InputDecoration(
                      hintText: 'Enter text for translation',
                      contentPadding: EdgeInsets.all(8.0),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
                Stack(
                  children: [
                    Positioned(
                      child: Container(
                        child: ElevatedButton(
                          onPressed: _translateText,
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              Color(0xff008fa0),
                            ),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            ),
                          ),
                          child: Text(
                            'Translate',
                            style: TextStyle(
                              fontSize: 25,
                              color: Color.fromARGB(255, 245, 240, 240),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 16.0),
                Text(
                  'Translated text',
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xff3b3b3b),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Container(
                  height: 250,
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xffd8d8d8),
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                    color: Color(0xffd8d8d8),
                  ),
                  child: SingleChildScrollView(
                    child: Center(
                      child: Text(
                        _translatedText,
                        style: TextStyle(fontSize: 25),
                        textDirection: TextDirection.ltr,
                      ),
                    ),
                  ),
                ),
                if (showSuggestions) SizedBox(height: 16.0),
                Container(
                  height: 400,
                  child: ListView.builder(
                    itemCount: iraqiWords.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          iraqiWords[index],
                          style: TextStyle(
                            fontSize: 18,
                            color: Color(0xff3b3b3b),
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            _inputText = iraqiWords[index];
                            showSuggestions = false;
                          });
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
