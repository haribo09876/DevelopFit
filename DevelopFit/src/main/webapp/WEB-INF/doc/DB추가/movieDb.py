import requests
from bs4 import BeautifulSoup
import sys

sys.stdout = open('movieDbTest1.json', 'w', encoding='utf-8')
for i in range(1, 50):
    url = "http://kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieList.json?key=679d8f7bb58d31fe492bcfe10a954aca&itemPerPage=100&prdtStartYear=2020&prdtEndYear=2023&curPage=" + \
        str(i)
    headers = {
        "User_Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36 Edg/117.0.2045.36"}
    res = requests.get(url, headers=headers, timeout=10)
    res.raise_for_status
    soup = BeautifulSoup(res.text, "lxml")
    print(res.text)

sys.stdout.close()
