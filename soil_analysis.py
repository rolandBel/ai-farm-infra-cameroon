# soil_analysis.py
import json
import random

def simulate_soil_analysis():
    return {
        "pH": round(random.uniform(5.0, 7.5), 2),
        "moisture_percent": random.randint(20, 80),
        "fertility": random.choice(["low", "medium", "high"])
    }

if __name__ == "__main__":
    result = simulate_soil_analysis()
    print(json.dumps(result, indent=2))
