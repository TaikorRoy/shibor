import requests
import json

url = "http://taomandev.piaojiaowang.com/PJWServices/shibor/checkShiborDate"


def check_remote(n):
    json_obj = {
        "sign": "6cd7a0cec3ba9bbab2f95a4570aa54a5",
        "args": {"limit": str(n)},
        "head": {"comeFrom": "1"}
    }

    headers = {'Content-type': 'application/json', 'Accept': 'application/json'}
    json_str = json.dumps(json_obj)
    r = requests.post(url, data=json_str, headers=headers)
    content = json.loads(r.text)

    try:
        issueTimes = content["data"]
        urls = [item["issuetime"][:-5] for item in issueTimes]   # correct the time format
    except:
        urls = None
    return urls


if __name__ == "__main__":
    urls = check_remote(30)
    print(urls)
