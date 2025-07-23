USE blog_db;

-- 요일별 방문 횟수   
SELECT
	요일,
    SUM(방문횟수) AS `요일별 방문 횟수`
FROM daily_visit_count
WHERE 날짜 != '2025-06-13'
GROUP BY 요일
ORDER BY SUM(방문횟수) DESC;

-- 시간대별 조회수
SELECT
    시간대,
    SUM(`시간대 조회수`) AS 총_조회수
FROM all_time
GROUP BY 시간대
ORDER BY 시간대;

-- 월별 유입경로
SELECT * FROM monthly_entry;
SELECT
	유입경로,
    ROUND(SUM(비율), 2) AS ratio_sum
FROM monthly_entry
WHERE 월 = 4 -- 4월
GROUP BY 유입경로;

SELECT
	유입경로,
    ROUND(SUM(비율), 2) AS ratio_sum
FROM monthly_entry
WHERE 월 = 5 -- 5월
GROUP BY 유입경로;

SELECT
	유입경로,
    ROUND(SUM(비율), 2) AS ratio_sum
FROM monthly_entry
WHERE 월 = 6 -- 6월
GROUP BY 유입경로;

-- 전체, 남/여 비율
SELECT
	성별,
    SUM(조회수)
FROM gender_age_456
WHERE 연령별 = '전체' 
GROUP BY 성별;

-- 월, 성별별 비율
SELECT
	월,
    연령별,
    성별,
    SUM(`비율(%)`) AS ratio_sum
FROM gender_age_456
GROUP BY 월, 연령별, 성별;

-- 기기별 
SELECT * FROM device_distribution;
SELECT
	월,
    구분,
    SUM(`비율(%)`) ratio_sum,
    SUM(`기기별 분포`) num_sum
FROM device_distribution
GROUP BY 월, 구분;

-- 나이대별
SELECT * FROM gender_age_456;
SELECT
	연령별,
    ROUND(SUM(`비율(%)`), 2) ratio_sum,
    SUM(조회수) 조회수_합
FROM gender_age_456
WHERE 연령별 != '전체'
GROUP BY 연령별;






