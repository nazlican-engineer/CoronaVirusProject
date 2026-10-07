# Veri klasörü

Bu depo ham veya işlenmiş büyük CSV dosyalarını içermez. Böylece depo küçük kalır ve veri yeniden üretilebilir olur.

## Kaynak

COVID-19 verisi [Our World in Data COVID-19 veri sayfasından](https://ourworldindata.org/coronavirus) indirilir. OWID'nin kendi ürettiği görselleştirme ve veriler, kaynak ve yazarlar belirtilmek şartıyla CC BY lisansı altında yeniden kullanılabilir. Bazı alanlar üçüncü taraf kaynaklardan geldiği için yeniden dağıtımdan önce ilgili kaynak lisansı kontrol edilmelidir.

## Yerel klasörler

```text
data/
├── raw/          # indirilen kaynak CSV dosyası
└── processed/    # notebook üretimi countries_clean.csv
```

## Çalıştırma sırası

1. Kaynak veriyi `data/raw/` içine indirin.
2. `notebooks/data_audit_cleaning.ipynb` dosyasını çalıştırın.
3. Oluşan `countries_clean.csv` dosyasını `data/processed/` altında yerel olarak tutun.
4. Analiz notebook'larını ve Power BI raporunu bu temiz veriyle çalıştırın.

`data/raw/` ve `data/processed/` içeriği Git tarafından takip edilmez.
