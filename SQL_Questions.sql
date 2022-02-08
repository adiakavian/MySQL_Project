use smc;

-- Q1 COACH
select a.id , a.name, timestampdiff(year, a.DOB, CURDATE()) age , r.DATE_OF_TREATMENT
from athlete a ,coach c, recieving r ,treatment t
where a.id_coach=c.id 
and a.id=r.id_athlete
and t.SERIAL_num = r.SERIAL_num
and c.department like 'tennis'
and t.name like 'phisiotherapy';

-- Q2 COACH
select a.id ,a.name , c.department 
from athlete a, coach c ,measurements_session m
where a.ID_COACH=c.id
and a.id =m.id_athlete
and m.RTPCR ='Positive'
and m.date_of_test >= ('2021-11-21');

-- Q3 COACH 391694964
select distinct pd.id ,pd.name ,pd.HMO
from personal_doctor pd, athlete a
where  a.ID_PERSONAL_DOC=pd.id
and a.id_coach=391694964;
                
-- Q4 COACH
select avg(m.HIGHT) average
from athlete a ,coach c, measurements_session m
where a.ID_COACH =c.id and a.id =m.ID_ATHLETE
and department ='basketball';

-- Q5 COACH
select distinct a.id ,a. name ,ap.PHONE_num
from athlete a ,measurements_session m ,athlete_phone ap
where a.id=m.ID_ATHLETE
and a.id =ap.ID_ATHLETE
and m.DATE_OF_TEST not between DATE_SUB(curdate(),INTERVAL 7 day) and CURDATE()
and m.ID_ATHLETE not in(
						select a.id 
						from athlete a ,measurements_session m
						where a.id=m.ID_ATHLETE
						and a.id =ap.ID_ATHLETE
						and m.DATE_OF_TEST between DATE_SUB(curdate(),INTERVAL 7 day) and CURDATE());

-- Q6 COACH
select a.ID ,a.NAME, Count(r.SERIAL_NUM) number_of_appointments
from recieving r,athlete a
where a.ID=r.ID_ATHLETE
and DATEDIFF(r.DATE_OF_TREATMENT,CURDATE()) <7
group by a.ID
HAVING Count(r.SERIAL_NUM)>1;  

-- Q7 ATHLETE
select ID ,NAME ,SPACIALIZATION ,ENTRY_DATE
from spacialist_doctor
where SPACIALIZATION = 'phisiotherapist'
or SPACIALIZATION = 'cardiolog'
order by SPACIALIZATION;

-- Q8 Athlete
select ID,NAME,PESONAL_DOC_NUM,ENTRY_DATE
from personal_doctor,personal_doc_phone
where personal_doctor.ID=personal_doc_phone.ID_PERSONAL_DOC
and HMO like 'Maccabi'
GROUP BY personal_doctor.ID
having TIMESTAMPDIFF(YEAR,ENTRY_DATE, CURDATE()) between 10 and 15
ORDER BY TIMESTAMPDIFF(YEAR,ENTRY_DATE, CURDATE()) DESC;

-- Q9 Athlete
select pd.ID ,pd.NAME ,pd.HMO, pdf.PESONAL_DOC_num ,count(a.ID) as num_patient
from personal_doctor pd ,athlete a , personal_doc_phone pdf
where pd.ID=a.ID_PERSONAL_DOC
and pd.id = pdf.ID_PERSONAL_DOC
Group by pd.id;


-- Q10 PERSONAL DOC
select m.session_num, a.id athlete_id, a.name athlete_name, n.id nurse_id,
n.name nurse_name, HEART_RATE, BLOOD_WORK, URINE, RTPCR, BODY_TEMP
from athlete a, measurements_session m ,nurse n
where a.id=m.ID_ATHLETE
and m.ID_APPLYING_NURSE=n.id
and (HEART_RATE='not in order'
or BLOOD_WORK='not in order'
or URINE='not in order'
or RTPCR='Positive'
or BODY_TEMP not between 36 and 37.5);

-- Q11 PERSONAL DOC
select n.id ,n.name ,m.SESSION_num ,m.ID_ATHLETE 
from nurse n, measurements_session m
where n.id = m. ID_APPLYING_NURSE
AND DATE_OF_TEST='2021-12-15';

-- Q12 personal doctor
select treatment.NAME,Count(performing.ID_PERFORMING_DOC) as num_of_docs
from performing,treatment
where treatment.SERIAL_NUM=performing.SERIAL_NUM
group by treatment.SERIAL_NUM;



INSERT INTO `smc`.`measurements_session`
(`SESSION_num`,`ID_ATHLETE`,`HEART_RATE`,`BLOOD_WORK`,`URINE`,`HIGHT`,`WEIGHT`,
`RTPCR`,`BODY_TEMP`,`ID_APPLYING_NURSE`,`ID_REFFERING_DOC`,`DATE_OF_TEST`)
VALUES(1,351922184,'in order','not in order','in order',190,90,'positive',36.6,342341037,391694964,'2021-12-24');

INSERT INTO `smc`.`measurements_session`
(`SESSION_num`,`ID_ATHLETE`,`HEART_RATE`,`BLOOD_WORK`,`URINE`,`HIGHT`,`WEIGHT`,
`RTPCR`,`BODY_TEMP`,`ID_APPLYING_NURSE`,`ID_REFFERING_DOC`,`DATE_OF_TEST`)
VALUES(1,359830893,'not in order','not in order','not in order',180,85,'positive',37,342341037,321054282,'2021-12-24');

INSERT INTO `smc`.`coach`
(`ID`,`NAME`,`ENTRY_DATE`,`department`)
VALUES(391694969, 'Matan Natan the 2nd' ,'2021-12-12', 'basketball');

UPDATE `smc`.`athlete`
SET`ID_COACH` = 391694969
WHERE ID_coach = 391694964;

DELETE FROM `smc`.`coach`
WHERE ID = 391694964;
