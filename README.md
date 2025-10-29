# AI Farm Infra – Cameroun 🌱

Stack légère pour analyse agricole basée sur l'IA, déployable sur VM locale.

## 🚀 Démarrage
```
docker build -t soil-analyzer .
docker run soil-analyzer
```

## 📦 Contenu
- `soil_analysis.py` : simulation de pH et humidité du sol
- `Dockerfile` : pour conteneurisation

Conçu pour fonctionner sur Debian avec 4 Go RAM.
