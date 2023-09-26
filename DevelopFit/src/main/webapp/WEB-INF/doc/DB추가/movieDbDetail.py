from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.chrome.options import Options
import time
import sys

# 브라우저 자동 꺼짐 방지시 사용
# chrome_options = Options()
# chrome_options.add_experimental_option("detach", True)
# chrome_options.add_experimental_option("excludeSwitches", ["enable-logging"])
# browser = webdriver.Chrome(options=chrome_options)
browser = webdriver.Chrome()

# 영화 검색 페이지로 이동
browser.get(
    "https://www.kobis.or.kr/kobis/business/mast/mvie/searchUserMovCdList.do")


# 영화 코드로 검색
inoutObj = browser.find_element(By.NAME, "movieCd")
inoutObj.send_keys("20226431")

searchButtonObj = browser.find_element(
    By.XPATH, "//*[@id='searchForm']/div[1]/div[7]/button")
searchButtonObj.click()


# 영화 제목
titleObj = browser.find_element(
    By.XPATH, "//*[@id='content']/div[4]/table/tbody/tr[1]/td[1]/a")
title = titleObj.text


# 영화 상세 페이지로 이동
toDatailObj = browser.find_element(
    By.XPATH, "//*[@id='content']/div[4]/table/tbody/tr[1]/td[1]/a")
toDatailObj.click()


# 메인포스터
mainPosterObj = browser.find_element(
    By.XPATH, "//*[@id='ui-id-1']/div/div[1]/div[2]/a")

mainPoster = mainPosterObj.get_attribute("href")


# 시놉시스
synopsisObj = browser.find_element(
    By.XPATH, "//*[@id='ui-id-1']/div/div[1]/div[5]/p")
synopsis = synopsisObj.text


# 감독
directorObj = browser.find_element(
    By.XPATH, "//*[@id='20226431_director']/dd/a")
director = directorObj.text


# 관람등급
spectatorRatingObj = browser.find_element(
    By.XPATH, "//*[@id='ui-id-1']/div/div[1]/div[8]/div/dl/dd")
spectatorRating = spectatorRatingObj.text.split('[관람등급] ')


# 요약정보
summaryInfoObj = browser.find_element(
    By.XPATH, "//*[@id='ui-id-1']/div/div[1]/div[2]/dl/dd[4]")
summaryInfo = summaryInfoObj.text


# <영화 정보>
sys.stdout = open('movieDbDetailInfo.json', 'w', encoding='utf-8')
# 영화코드
print("20226431")
# 영화제목
print(title)
# 메인포스터
print(mainPoster)
# 시놉시스
print(synopsis)
# 감독
print(director)
# 관람등급
print(spectatorRating[1])
# 요약정보
print(summaryInfo)

# 상영시간

time.sleep(1)
sys.stdout.close()


# <영화 예고편>
sys.stdout = open('movieDbDetailTrailer.json', 'w', encoding='utf-8')
# 영화코드
print("20226431")
# 영화제목
print(title)

# 영화예고편(카카오)

time.sleep(1)
sys.stdout.close()


# <영화 사이드포스터>
sys.stdout = open('movieDbDetailSidePoster.json', 'w', encoding='utf-8')
# 영화코드
print("20226431")
# 영화제목
print(title)
# 사이드포스터
try:
    for n in range(1, 11):
        sidePosterObj = browser.find_element(
            By.XPATH, "//*[@id='ui-id-1']/div/div[1]/div[3]/div[1]/div/div/div/div[" + str(n) + "]/a/img")
        sidePoster = sidePosterObj.get_attribute("src")
        print(sidePoster)
except:
    pass
time.sleep(1)
sys.stdout.close()


# <영화 스틸컷>
sys.stdout = open('movieDbDetailStillImage.json', 'w', encoding='utf-8')
# 영화코드
print("20226431")
# 영화제목
print(title)
# 영화스틸컷
# 스틸이미지
try:
    for n in range(1, 31):
        stillImageObj = browser.find_element(
            By.XPATH, "//*[@id='ui-id-1']/div/div[1]/div[4]/div[1]/div/div[1]/div/div[" + str(n) + "]/a/img")
        stillImage = stillImageObj.get_attribute("src")
        print(stillImage)
except:
    pass
time.sleep(1)
sys.stdout.close()


# <영화 주연배우>
sys.stdout = open('movieDbDetailCast.json', 'w', encoding='utf-8')
# 영화코드
print("20226431")
# 영화제목
print(title)
# 주연배우
try:
    for n in range(1, 15):
        castObj = browser.find_element(
            By.XPATH, "//*[@id='20226431_staff']/dl/div[2]/dd/table/tbody/tr/td/a[" + str(n) + "]")
        cast = castObj.text
        print(cast)
except:
    pass
time.sleep(1)
sys.stdout.close()
