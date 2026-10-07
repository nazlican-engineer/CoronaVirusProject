# Demografik ve Ekonomik İlişkiler
## Bulgular ve Kararlar

### Veri Kalitesi ve Ülke Profili

- Demografik, ekonomik, sağlık riski ve altyapı göstergeleri ülke bazında sabit bilgiler olarak incelenmiştir.
- Sabit göstergelerde zaman içinde birden fazla farklı değer ve tanımlanan mantıksal sınırların dışında anormal kayıt bulunmamıştır.
- Her ülke için tek satırlık `country_profile` tablosu oluşturulmuştur.
- Bir ülkenin bir göstergesi eksikse, ülke yalnızca o göstergenin kullanıldığı analizden çıkarılmıştır. Tüm göstergeleri eksik olmadığı sürece ülke analizden tamamen çıkarılmamıştır.

### Ölüm ve Aşılanma Karşılaştırmaları

- Milyon kişi başına toplam COVID-19 ölümü için en geniş ortak kapsam, 4 Ağustos 2024 tarihinde 194 ülkede bulunmuştur.
- Tam aşılama oranı için en geniş ortak kapsam, 16 Ağustos 2021 tarihinde 106 ülkede bulunmuştur.
- Ölüm ve aşılama göstergeleri için farklı tarihler kullanılmıştır; her gösterge kendi en geniş ülke kapsamına sahip tarihte değerlendirilmiştir.

### Ana İlişkiler

- Logaritmik kişi başına GDP ile milyon kişi başına toplam COVID-19 ölümü arasında orta düzeyde pozitif ilişki görülmüştür (`r = 0.498`, 186 ülke).
- 65 yaş üstü nüfus oranı ile milyon kişi başına toplam COVID-19 ölümü arasında güçlü pozitif ilişki görülmüştür (`r = 0.683`, 182 ülke).
- HDI ile tam aşılama oranı arasında güçlü pozitif ilişki görülmüştür (`r = 0.741`, 105 ülke).
- HDI düzeyi yüksek ülkelerde tam aşılama oranları genel olarak daha yüksektir. Bu ilişki; sağlık altyapısı, gelir, lojistik kapasite ve aşı erişimi gibi birlikte değişen faktörleri yansıtabilir.

### Yardımcı Göstergeler

- Ortanca yaş ve 70 yaş üstü nüfus oranı da milyon kişi başına toplam ölümle güçlü pozitif ilişki göstermiştir.
- Kadın sigara oranı, el yıkama imkânı ve yaşam beklentisi bazı ülkelerde ölüm göstergesiyle pozitif ilişki göstermiştir. Bu sonuçlar doğrudan nedensel etki olarak yorumlanmamalıdır.
- Aşırı yoksulluk oranı ile bildirilen COVID-19 ölümü arasında negatif ilişki görülmüştür. Ülkeler arası raporlama farkı, yaş yapısı, sağlık hizmetine erişim ve gelişmişlik düzeyi bu ilişkiyi etkileyebilir.
- Diyabet yaygınlığı ve logaritmik nüfus yoğunluğu ile milyon kişi başına toplam ölüm arasında çok zayıf ilişki görülmüştür.

### Korelasyon Isı Haritası

- Korelasyon ısı haritasında GDP, HDI, yaşlı nüfus oranı ve yaşam beklentisinin birbiriyle güçlü ilişkiler taşıdığı görülmüştür.
- Isı haritasında tüm seçili göstergeleri eksiksiz bulunan 69 ülke kullanılmıştır.
- Korelasyonlar ülke düzeyindeki birliktelikleri gösterir; bireysel risk, nedensel etki veya politika başarısı olarak yorumlanmamalıdır.

### Dashboard Kararları

- Dashboard’da GDP–ölüm, 65 yaş üstü nüfus–ölüm ve HDI–tam aşılama için üç dağılım grafiği kullanılacaktır.
- Korelasyon ısı haritası, seçili demografik ve ekonomik göstergelerin birlikte incelenmesi için kullanılacaktır.
- Grafiklerde her nokta bir ülkeyi temsil eder.
- Regression veya tahmin modeli bu projenin kapsamına alınmamıştır.

![Demografik, ekonomik ve COVID-19 korelasyonları](../figures/06-demografik-korelasyon.png)
## Demografik Dağılım Grafikleri

![Demografik ve ekonomik göstergeler](../figures/06a-demografik-dagilim.png)

Bu üç dağılım grafiği kişi başı GSYH, 65 yaş üstü nüfus ve HDI ile milyon kişi başına ölüm arasındaki ilişkiyi gösterir. Her nokta bir ülkedir; noktaların yoğunlaşması benzer değerlere sahip daha fazla ülke olduğunu anlatır.


> **Hesaplama yaklaşımı:** Her ülke tek bir profil ile karşılaştırılır. Bir bilgi eksikse ülke yalnızca ilgili grafikten çıkarılır. Grafikler ilişkiyi gösterir, neden-sonuç göstermez.

Ülke düzeyindeki korelasyon analizinde log kişi başı GSYH ile milyon kişi başına ölüm arasında orta düzeyde pozitif ilişki görüldü (`r = 0.498`, 186 ülke). 65 yaş üstü nüfus oranı ile milyon kişi başına ölüm ilişkisi daha güçlüydü (`r = 0.683`, 182 ülke). HDI ile tam aşılama oranı arasında da güçlü pozitif ilişki vardı (`r = 0.741`, 105 ülke). Bu ilişkiler nedensellik göstermez; birlikte değişen sosyal, demografik ve raporlama faktörleri sonuçları etkileyebilir.

---
