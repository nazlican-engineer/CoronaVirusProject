# Veri Denetimi ve Temizlik

- Veri setindeki konumlar; ana analiz ülkeleri, bölgeler/özel statülü konumlar, kıtalar, gelir grupları ile Dünya ve Avrupa Birliği toplamları olarak ayrıldı.
- Western Sahara, Faroe Islands ve Birleşik Krallık alt bölgeleri gibi ülke olarak değerlendirilmemesi gereken konumlar `df_regions` içinde tutuldu.
- `location` ve `date` sütunlarına göre tekrar eden kayıtlar bütün veri gruplarında kontrol edildi.
- East Timor, Faroe Islands, gelir grupları ve Avrupa Birliği toplamlarında tekrar eden tarihli kayıtlar bulundu.
- Tekrar eden kayıtların aynı tarih ve sütunda çelişkili dolu değerler içerip içermediği kontrol edildi.
- Çelişkili değer bulunmadığı için tekrar eden kayıtlar, her sütundaki boş olmayan değer korunarak tekilleştirildi.
- Tekilleştirme sonrasında tüm veri gruplarında kalan `location + date` tekrarı kontrol edildi.
- Her konumun ilk ve son kayıt tarihi, kayıtlı gün sayısı ve bu aralıktaki eksik gün sayısı hesaplandı.
- Northern Cyprus için 5 Aralık 2022 tarihinde bir günlük kayıt eksikliği tespit edildi.
- Eksik tarih, sıfır vaka veya sıfır ölüm olarak yorumlanmadı; veri kalitesi notu olarak korundu.
- Temizlenmiş veri dosyaları kaydedildi.

Bu veri denetimi aşamasında yalnızca yapısal sorunlar incelendi. Sütun bazındaki eksik değerler, ilgili analiz notebook'larında değişkenin anlamına göre ayrıca değerlendirilecektir.
