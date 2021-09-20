with first_mqi as (
    select
      sm.email
      , sm.mqi_date
    from
       {{ ref('tier2_sorted_mqi') }} sm
    where sm.rn = 1
  )
  , second_mqi as (
    select
      sm.email
      , sm.mqi_date
    from
       {{ ref('tier2_sorted_mqi') }} sm
    where sm.rn = 2
      and (sm.user_rn != 2 or sm.user_rn is null)
  )
  , first_mql as (
    select
      sm.email
      , min(sm.mqlDateEST) as mqlDate
    from
       {{ ref('tier2_sorted_mqi') }} sm
    where
      sm.mql = 'true'
    group by
      1
  )
  , first_sal as (
    select
      sm.email
      , min(sm.salDateEST) as saldate
    from
      {{ ref('tier2_sorted_mqi') }} sm
    where
      sm.sal = 'true'
    group by
      1
  )
  , first_sql as (
    select
      sm.email
      , min(sm.sqlDateEST) as sqlDate
    from
      {{ ref('tier2_sorted_mqi') }} sm
    where
      sm.sql = 'true'
    group by
      1
  )
  , first_sqo as (
    select
      sm.email
      , min(sm.sqoDate) as sqoDate
    from
      {{ ref('tier2_sorted_mqi') }} sm
    where
      sm.sqo = 'true'
    group by
      1
  )
  , first_won as (
    select
      sm.email
      , min(sm.opportunityClosedWonDate) as wonDate
    from
      {{ ref('tier2_sorted_mqi') }} sm
    where
      sm.won = 'true'
    group by
      1
  )
select
    sm.*,
    fm.mqi_date as firstMQIdate,
    rm.mqi_date as secondMQIdate,
    fmql.mqldate,
    fsal.saldate,
    fsql.sqldate,
    fsqo.sqodate,
    fwon.wondate
from {{ ref('tier2_sorted_mqi') }} sm
left join first_mqi fm on sm.email = fm.email
left join second_mqi rm on sm.email = rm.email
left join first_mql fmql on sm.email = fmql.email
left join first_sal fsal on sm.email = fsal.email
left join first_sql fsql on sm.email = fsql.email
left join first_sqo fsqo on sm.email = fsqo.email
left join first_won fwon on sm.email = fwon.email