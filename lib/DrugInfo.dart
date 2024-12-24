import 'dart:convert';

/// Drug : "panadol "
/// Nutrition : "ADDITIONAL INFO: \n1) Drink More Water\n2)Choose Nutritious Foods\nSome studies suggest certain foods prevent and reduce headache pain. Omega-3 fatty acids, which are found in fish, act as an anti-inflammatory and can reduce headache pain. Potassium, found in potatoes and bananas, also has properties that can relieve headaches.\n\nCAUTION: \nDon't ignore these signs and symptoms when they accompany a headache. Call your doctor immediately if you experience any of the following:\n\n#A headache that comes on without notice or suddenly becomes severe.\n#A fever or tightness in your neck.\n#Experiencing a seizure, changes in behavior, confusion or loss of consciousness.\n#A headache that started right after an injury or exercise.\n#If you experience weakness, numbness or trouble seeing along with the headache.\n#If your headaches are frequent or severe."
/// PT : "first of all we have to take a look at life style: 1)get enough rest time and sleep   2) improve your diet  3) improve body posture during the day and also while sleeping 4) get sometime for exercises to reduce your headache "
/// Side effect and allergy : "nausea, vomiting, constipation"
/// exercise and link : "exercises to reduce stress headache:  1) CHIN TUCK INS = Purpose:  neck mobility for all of the neck, including upper thoracic spine reversal from the forward head position  (THIS LINK DEMONSTRATES THIS EX https://www.youtube.com/watch?v=u8C5LgpK3r4)      2) Shoulder blade (scapular) retraction => Purpose:  activate shoulder blade muscles bring awareness to posture reset posture (LINK VID TO DEMONSTRATE =>https://www.youtube.com/watch?v=QN1oZVMMRjE)  3)CERVICAL ROTATION=> Purpose:  neck mobility for healthy neck joints and muscles. (LINK TO DEMONSTRATE => https://www.youtube.com/watch?v=hYTTU958DJY)  4) THORACIC EXTENSION=> Purpose:  flexibility of the thoracic spine is needed for neck and shoulder movement and range of movement thoracic mobility is important for headache management (LINK TO DEMONSTRATE => https://www.youtube.com/watch?v=Iy14A2VPoP4)"

DrugInfo drugInfoFromJson(String str) => DrugInfo.fromJson(json.decode(str));
String drugInfoToJson(DrugInfo data) => json.encode(data.toJson());
class DrugInfo {
  DrugInfo({
      String? drug, 
      String? nutrition, 
      String? pt, 
      String? sideeffectandallergy, 
      String? exerciseandlink,}){
    _drug = drug;
    _nutrition = nutrition;
    _pt = pt;
    _sideeffectandallergy = sideeffectandallergy;
    _exerciseandlink = exerciseandlink;
}

  DrugInfo.fromJson(dynamic json) {
    _drug = json['Drug'];
    _nutrition = json['Nutrition'];
    _pt = json['PT'];
    _sideeffectandallergy = json['Side effect and allergy'];
    _exerciseandlink = json['exercise and link'];
  }
  String? _drug;
  String? _nutrition;
  String? _pt;
  String? _sideeffectandallergy;
  String? _exerciseandlink;
DrugInfo copyWith({  String? drug,
  String? nutrition,
  String? pt,
  String? sideeffectandallergy,
  String? exerciseandlink,
}) => DrugInfo(  drug: drug ?? _drug,
  nutrition: nutrition ?? _nutrition,
  pt: pt ?? _pt,
  sideeffectandallergy: sideeffectandallergy ?? _sideeffectandallergy,
  exerciseandlink: exerciseandlink ?? _exerciseandlink,
);
  String? get drug => _drug;
  String? get nutrition => _nutrition;
  String? get pt => _pt;
  String? get sideeffectandallergy => _sideeffectandallergy;
  String? get exerciseandlink => _exerciseandlink;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Drug'] = _drug;
    map['Nutrition'] = _nutrition;
    map['PT'] = _pt;
    map['Side effect and allergy'] = _sideeffectandallergy;
    map['exercise and link'] = _exerciseandlink;
    return map;
  }

}