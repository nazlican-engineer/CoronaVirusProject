"""Temizlenmiş proje verisini yüklemek için ortak fonksiyonlar."""

from pathlib import Path

import pandas as pd


def project_root() -> Path:
    """Çalışma dizininden proje kök klasörünü bulur."""
    current = Path.cwd().resolve()

    for candidate in (current, *current.parents):
        if (candidate / "data").is_dir() and (candidate / "notebooks").is_dir():
            return candidate

    raise FileNotFoundError("Proje kök klasörü bulunamadı.")


def load_countries() -> pd.DataFrame:
    """Temizlenmiş ülke verisini tarih sütununu dönüştürerek yükler."""
    data_path = project_root() / "data" / "processed" / "countries_clean.csv"
    return pd.read_csv(data_path, parse_dates=["date"])


def print_country_data_overview(dataframe: pd.DataFrame) -> None:
    """Temiz ülke verisinin temel yapısını yazdırır."""
    print("Satır-sütun sayısı:", dataframe.shape)
    print("Ülke sayısı:", dataframe["location"].nunique())
    print("İlk tarih:", dataframe["date"].min())
    print("Son tarih:", dataframe["date"].max())
    print(
        "Tekrarlayan ülke-tarih kaydı:",
        dataframe.duplicated(subset=["location", "date"]).sum(),
    )
