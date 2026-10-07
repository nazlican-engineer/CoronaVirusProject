# Yayılım ve Hastane Yükü
## Bulgular ve Kararlar

### R Değeri ve Önlem Sıkılığı

- `reproduction_rate`, salgının yayılma hızını gösterir. `R > 1` yayılımın artma, `R < 1` ise yavaşlama eğiliminde olduğunu ifade eder.
- R değeri 191 ülkede bulunmuştur. Her ülkenin R verisinin aktif kayıt aralığında aradaki günler eksiksizdir.
- R verisi kaynakta çoğunlukla 2 Ocak 2023 sonrasında bulunmadığı için R grafikleri bu tarih sonrasını kapsamamaktadır.
- 2 Ocak 2023 tarihinde 191 ülkenin R değeri birlikte bulunduğundan, ülkeler arası R karşılaştırması bu tarih üzerinden yapılmıştır.
- `stringency_index`, hükümetlerin okul/iş yeri kapanmaları, seyahat kısıtları ve benzeri önlemlerinin sıkılığını 0–100 aralığında gösterir.
- İtalya örneğinde R değeri ve önlem sıkılığı 24 Şubat 2020–31 Aralık 2022 arasında birlikte incelenmiştir.
- Bazı dönemlerde daha yüksek önlem sıkılığı ile daha düşük R değeri birlikte gözlense de bu durum nedensellik kanıtlamaz. Aşılama, varyantlar, test kapasitesi, davranış değişiklikleri ve önlemlerin gecikmeli etkisi de salgının yayılımını etkiler.

## Hastane ve Yoğun Bakım Yükü

- `hosp_patients` ve `icu_patients`, belirli bir tarihte hastanede ve yoğun bakımda bulunan COVID-19 hasta sayılarını gösterir.
- Hastane hasta verisi 36 ülkede, yoğun bakım hasta verisi 38 ülkede bulunmuştur. Her iki göstergeyi birlikte paylaşan ülke sayısı 32’dir.
- Bazı ülkelerde hastane veya yoğun bakım verisinin aktif tarih aralığında boş günler bulunmaktadır. Bu boşluklar sıfır ile doldurulmamıştır.
- Hastane ve yoğun bakım verisi aktif döneminde kesintisiz olan 16 ülke belirlenmiştir. Uzun dönem zaman grafikleri için bu ülkeler tercih edilmelidir.
- İtalya; hastane ve yoğun bakım verisinin aynı tarih aralığında, 24 Şubat 2020–7 Ağustos 2024 arasında kesintisiz olması nedeniyle örnek zaman grafiği için kullanılmıştır.
- Ülkeler arası karşılaştırmada ham hasta sayısı yerine `hosp_patients_per_million` ve `icu_patients_per_million` kullanılmıştır. Böylece nüfus büyüklüğünün karşılaştırmayı yanıltması önlenmiştir.
- Milyon kişi başına değerler, ham hasta sayısı ve nüfus üzerinden yapılan hesaplamalarla tutarlıdır.
- 13 Şubat 2022 tarihinde 30 ülkenin hem hastane hem yoğun bakım verisi birlikte bulunmuştur. Bu tarihte Bulgaristan, milyon kişi başına hastane ve yoğun bakım hasta yükünde en yüksek ülkeler arasında yer almıştır.
- Bulgaristan’daki yüksek hastane yükü, Ocak sonu ve Şubat 2022’deki yüksek vaka ve ölüm yüküyle aynı döneme denk gelmektedir. Ancak bu durum tek başına sağlık sistemi kapasitesi veya tek bir faktörle açıklanamaz.

### Haftalık Yatış ve Yatak Kapasitesi Göstergeleri

- `weekly_hosp_admissions` ve `weekly_icu_admissions`, kaynak tarafından bildirilen haftalık hastane ve yoğun bakım yatış göstergeleridir.
- Bu göstergeler yalnızca sınırlı sayıda ülkede bulunur ve ülkeler arasında günlük veya haftalık farklı kayıt sıklıklarıyla paylaşılmıştır.
- Bu nedenle haftalık yatış göstergeleri yeniden toplanmamış, ana ülkeler arası karşılaştırmada kullanılmamıştır. Gerekirse seçili ülke detayında kaynak tarafından bildirilen değer olarak gösterilebilir.
- `hospital_beds_per_thousand`, bin kişi başına hastane yatağı kapasitesini gösteren sabit bir ülke bilgisidir. Günlük zaman serisi olarak değil, ülke bağlam göstergesi olarak kullanılacaktır.

### Dashboard Kararları

- R değeri için ülke karşılaştırması ve seçili ülke zaman grafiği sunulabilir; veri kapsamının 2023 başında bittiği belirtilmelidir.
- Hastane ve yoğun bakım zaman grafikleri yalnızca yeterli ve kesintisiz veri bulunan ülkeler için gösterilmelidir.
- Ülke karşılaştırmalarında milyon kişi başına hastane ve yoğun bakım göstergeleri kullanılmalıdır.
- Veri bulunmayan günler sıfır kabul edilmeyecek, grafiklerde boşluk olarak korunacaktır.
- Bu bölüm için ayrı bir işlenmiş CSV oluşturulmasına gerek yoktur; dashboard günlük göstergeleri `countries_clean.csv` dosyasından kullanabilir.

![İtalya'da hastane ve yoğun bakım yükü](../figures/03-italya-hastane-yogun-bakim.png)
## Yayılım ve Hastane İçin Ek Görseller

![İtalya R değeri ve önlem sıkılığı](../figures/03b-italya-r-ve-onlem.png)

İtalya örneğinde R değeri ile önlem sıkılığı aynı zaman ekseninde görülür. R değerinin 1 çizgisinin üstünde olması yayılımın artma eğiliminde olduğunu gösterir; bu grafik tek başına önlemlerin etkisini kanıtlamaz.

![Ülkelere göre R değeri](../figures/03c-r-degeri-ulke-karsilastirma.png)

2 Ocak 2023 tarihinde Kosova, Bolivya ve Lübnan en yüksek R değerleri arasındadır. Kesikli çizgi R = 1 eşiğini gösterir.

![Hastane ve yoğun bakım yükü](../figures/03d-hastane-ybu-karsilastirma.png)

13 Şubat 2022'de Bulgaristan, Sırbistan ve Romanya hastanede yatan kişi sayısında öne çıkar. Hastane ve yoğun bakım yükleri milyon kişi başına gösterildiği için ülkeler karşılaştırılabilir.


> **Hesaplama yaklaşımı:** Hasta sayıları ülkelerin nüfusuna göre karşılaştırılır. Veri vermeyen ülkeler ve boş günler sıfır kabul edilmez. R değeri verisi 02.01.2023'te biter.

Hastanede ve yoğun bakımda bulunan hasta serileri, belirli bir gündeki yükü gösterir. İtalya örneğinde iki yük göstergesi birlikte dalgalanır; yoğun bakım eğrisi daha düşük düzeyde fakat benzer salgın dalgalarıyla hareket eder. Bu veri yalnızca hastane verisi paylaşan ülkeler için mevcuttur; boş günler sıfır kabul edilmemiştir.
