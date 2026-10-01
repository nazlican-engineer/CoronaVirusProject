# Haftalık tarih modeli

`Takvim` tablosu, `countries_clean[date]` alanına etkin bire-çok ilişki ile bağlanır.

- `Date`: günlük tarih anahtarı
- `Hafta Başlangıcı`: pazartesi tarihi
- `Hafta Etiketi`: pazartesi–pazar aralığı
- `Gün Sırası`: pazartesi 1, pazar 7
- `Haftanın Günü`: Türkçe gün adı

`Hafta Etiketi`, `Hafta Başlangıcı` ile; `Haftanın Günü`, `Gün Sırası` ile sıralanır. Böylece hafta seçici kronolojik çalışır.
