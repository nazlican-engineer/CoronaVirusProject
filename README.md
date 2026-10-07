# COVID-19 Analysis Dashboard

SQL, Python ve Power BI kullanılarak hazırlanmış; ülkeler arasındaki COVID-19 vaka, ölüm, hastane, test, aşılama ve demografik göstergeleri inceleyen uçtan uca veri analizi projesi.

## Notebook Bulguları

Notebook'lar, dashboard'da özetlenen ölçülerin veri kalitesi kontrollerini ve ülke karşılaştırmalarını ayrıntılandırır. Aşağıdaki görseller bu analizlerden seçilmiştir.

### Vaka ve ölüm yükü: mutlak değer ile nüfusa göre ölçü farklıdır

![Vaka karşılaştırması](docs/figures/01-vaka-karsilastirma.png)

> **Yöntem notu:** Analiz yalnızca ülke kayıtlarıyla yapıldı; yinelenen ülke-tarih gözlemleri tekilleştirildi. Haftalık toplamlar mevcut günlük değerlerin toplamıdır; ülkeler arası haftalık karşılaştırmalarda yalnızca yedi günü dolu haftalar kullanıldı.

4 Ağustos 2024 itibarıyla bildirilen toplam vaka sayısında Amerika Birleşik Devletleri, Çin ve Hindistan öne çıkar. Milyon kişi başına hesaplama ise nüfus büyüklüğünün etkisini azaltır ve sıralamayı değiştirebilir. Bu nedenle dashboard'da mutlak değerler ile kişi başına ölçüler birlikte sunulur.

![Ölüm karşılaştırması](docs/figures/02-olum-karsilastirma.png)

> **Yöntem notu:** Eksik günlük ölüm kayıtları sıfırla doldurulmadı. Kümülatif serilerde görülen kaynak düzeltmeleri korunurken, haftalık değişim yalnızca ardışık iki tam hafta arasında hesaplandı.

Aynı ayrım ölüm verisinde de görülür. Mutlak bildirilen ölüm sayısında büyük nüfuslu ülkeler öne çıkarken, milyon kişi başına ölüm sıralaması Peru, Bulgaristan ve Kuzey Makedonya gibi farklı ülkeleri öne taşır. Bu görseller bildirilen sonuçları gösterir; veri kapsamı ve raporlama farklılıkları nedeniyle tek başına salgın yönetiminin başarısını ölçmez.

### Yayılım ve hastane yükü

![İtalya'da hastane ve yoğun bakım yükü](docs/figures/03-italya-hastane-yogun-bakim.png)

> **Yöntem notu:** Hastane ve YBÜ yükü milyon kişi başına gösterilir. Veri yalnızca bildirim yapan ülkeleri kapsar; boş gözlemler sıfır kabul edilmez. R değeri kaynağı 02.01.2023 sonrasında sona erer.

Hastanede ve yoğun bakımda bulunan hasta serileri, belirli bir gündeki yükü gösterir. İtalya örneğinde iki yük göstergesi birlikte dalgalanır; yoğun bakım eğrisi daha düşük düzeyde fakat benzer salgın dalgalarıyla hareket eder. Bu veri yalnızca hastane verisi paylaşan ülkeler için mevcuttur; boş günler sıfır kabul edilmemiştir.

### Test verisinin yorumu

![Birleşik Arap Emirlikleri test ve pozitiflik serisi](docs/figures/04-bae-test-pozitiflik.png)

> **Yöntem notu:** Ülkeler arası test sıralamalarında yalnızca tests performed birimi kullanılır. Eksik günler doldurulmaz; tam haftalık test toplamı için yedi günün de kayıtlı olması gerekir.

Test yoğunluğu ve pozitiflik oranı her ülkede aynı sıklıkta bildirilmez. Bu örnek, test serisindeki değişimleri ve pozitiflik bildirimindeki kesintileri görünür kılar. Ülkeler arası test karşılaştırmalarında yalnızca `tests performed` birimi kullanan ülkeler değerlendirilir; kişi ya da örnek sayısı olarak bildiren veriler aynı ölçeği temsil etmez.

### Aşılama, vaka ve ölüm eğrileri

![Türkiye'de aşılama, vaka ve ölüm eğilimleri](docs/figures/05-turkiye-asi-vaka-olum.png)

> **Yöntem notu:** Her ülke için haftadaki son geçerli ilk doz ve tam aşılama gözlemi kullanılır. Oranı olmayan hafta boş kalır; eksik kayıt sıfır aşılama olarak yorumlanmaz.

Türkiye'de en az bir doz ve tam aşılama oranı 2021 boyunca yükselmiş, daha sonra yataylaşmıştır. Vaka ve ölüm eğrileriyle aynı zaman ekseninde gösterim, dönemlerin birlikte nasıl değiştiğini açıklar. Bu görsel nedensel bir aşı etkisi kanıtı değildir; varyantlar, test düzeyi, yaş yapısı ve raporlama gibi etkenler ayrıca rol oynar.

### Demografik ve ekonomik ilişkiler

![Demografik, ekonomik ve COVID-19 korelasyonları](docs/figures/06-demografik-korelasyon.png)

> **Yöntem notu:** Her ülke için tek satırlı bir ülke profili kullanılır. Bir göstergesi eksik olan ülke yalnızca o ilişkinin hesabından çıkarılır; korelasyonlar ülke düzeyindedir ve nedensellik göstermez.

Ülke düzeyindeki korelasyon analizinde log kişi başı GSYH ile milyon kişi başına ölüm arasında orta düzeyde pozitif ilişki görüldü (`r = 0.498`, 186 ülke). 65 yaş üstü nüfus oranı ile milyon kişi başına ölüm ilişkisi daha güçlüydü (`r = 0.683`, 182 ülke). HDI ile tam aşılama oranı arasında da güçlü pozitif ilişki vardı (`r = 0.741`, 105 ülke). Bu ilişkiler nedensellik göstermez; birlikte değişen sosyal, demografik ve raporlama faktörleri sonuçları etkileyebilir.

## Dashboard Görselleri

### Vaka Analizi

![Vaka Analizi](dashboard/screenshots/01-vaka-analizi.png)

### Ölüm Analizi

![Ölüm Analizi](dashboard/screenshots/02-olum-analizi.png)

### Yayılım ve Hastane

![Yayılım ve Hastane](dashboard/screenshots/03-yayilim-hastane.png)

### Test Analizi

![Test Analizi](dashboard/screenshots/04-test-analizi.png)

### Aşı Analizi

![Aşı Analizi](dashboard/screenshots/05-asi-analizi.png)

### Demografik ve Ekonomik Analiz

![Demografik ve Ekonomik Analiz](dashboard/screenshots/06-demografik-ekonomik.png)

## Veri Kaynağı

Veri, [Our World in Data COVID-19 veri sayfasından](https://ourworldindata.org/coronavirus) alınır. Our World in Data tarafından üretilen veri ve görselleştirmeler, atıf koşuluyla CC BY lisansındadır; üçüncü taraf kaynaklı alanların kendi lisansları ayrıca kontrol edilmelidir.

## Proje Akışı

```text
Ham veri → veri denetimi ve temizleme → haftalık / analiz tabloları
        → PostgreSQL sorguları → Power BI dashboard
```

## Teknolojiler

- **Python:** veri inceleme, temizlik ve analiz notebook'ları
- **PostgreSQL / SQL:** şema, tablo tanımları ve analiz sorguları
- **Power BI:** etkileşimli rapor, DAX ölçüleri ve filtreler

## Klasör Yapısı

```text
covid-analysis/
├── README.md
├── .gitignore
├── pyproject.toml
├── src/              # data_loader.py
├── notebooks/        # denetim, temizlik ve analiz notebook'ları
├── sql/              # şema ve analiz sorguları
├── dashboard/        # .pbix, tema ve ekran görüntüleri
├── docs/             # ölçüler, doğrulamalar ve metodoloji notları
├── data/             # yalnızca README.md sürüm kontrolünde
└── outputs/          # yerel üretilen tablolar ve görseller
```

## Kurulum ve Çalıştırma

1. Depoyu klonlayın ve Python ortamını oluşturun.
2. Bağımlılıkları `pyproject.toml` üzerinden kurun.
3. Kaynak veriyi `data/raw/` altına yerel olarak indirin.
4. Önce `notebooks/data_audit_cleaning.ipynb` notebook'unu çalıştırın.
5. Diğer notebook'ları analiz sırasına göre çalıştırın.
6. Power BI içinde `dashboard/covid19_dashboard.pbix` dosyasını açın; veri kaynağı yolunu kendi yerel `data/processed/` klasörünüze göre güncelleyin.

Ayrıntılı veri yerleşimi için [data/README.md](data/README.md) dosyasına bakın.

## Önemli Hesaplama Kararları

- Tayvan, Kosova, Hong Kong ve Filistin analizde ayrı ülke birimleri olarak ele alınır. Ülke olarak veri kaynağının ülke olarak listelediği konumlar alınır.
- Eksik gözlemler sıfır kabul edilmez; kartlarda ve grafiklerde boş kalır.
- Haftalık analizlerde tam hafta kuralı uygulanır.
- Kümülatif değerler, ülkeler için son geçerli değerin alınmasıyla hesaplanır; günlük satırlar toplanmaz.
- Oranlar ve kişi başına değerler ülkeler arasında doğrudan toplanmaz; ölçüye uygun ağırlıklı ya da ülke ortalaması yaklaşımı kullanılır.
- Demografik grafikler ülke düzeyindedir; ilişkiler nedensellik kanıtı değildir.

## Sınırlamalar

- R değeri kaynağı 02.01.2023 tarihinde sona erer.
- Hastane ve YBÜ göstergeleri yalnızca veri paylaşan birkaç düzine ülkeyi kapsar.
- Test ve aşı serilerinde bildirim farkları, eksik günler ve geriye dönük düzeltmeler bulunabilir.
- Ülkeler arası karşılaştırmalarda veri kalitesi ile raporlama kapsamı sonuçları etkileyebilir.
