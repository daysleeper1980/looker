view: users {
  sql_table_name: PUBLIC.USERS ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."ID" ;;
  }

  dimension: age {
    type: number
    sql: ${TABLE}."AGE" ;;
  }

dimension: age_tier{
  type: tier
  tiers: [10,20,30,40,50,60]
}


  dimension: city {
    type: string
    sql: ${TABLE}."CITY" ;;
  }



  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}."COUNTRY" ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."CREATED_AT" ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}."EMAIL" ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}."FIRST_NAME" ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}."GENDER" ;;
  }

dimension: kontrol {
  type: yesno
  sql: ${age}<50 ;;
}
  dimension: last_name {
    type: string
    sql: ${TABLE}."LAST_NAME" ;;
  }

  dimension: latitude {
    type: number
    sql: ${TABLE}."LATITUDE" ;;
  }

  dimension: longitude {
    type: number
    sql: ${TABLE}."LONGITUDE" ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}."STATE" ;;
  }

  dimension: traffic_source {
    type: string
    sql: ${TABLE}."TRAFFIC_SOURCE" ;;
  }

  dimension: zip {
    type: zipcode
    sql: ${TABLE}."ZIP" ;;
  }

  dimension: event_user_name {
    type: string
    sql: ${TABLE}.event_user_name ;;
    suggest_explore: user
    suggest_dimension: user.name
  }

  measure: count {
    type: count
    filters: {
      field: kontrol
      value: "yes"
    }
    drill_fields: [id, first_name, last_name, events.count, order_items.count]
  }

  measure: average_yas {
    type: average
    drill_fields: [first_name,age]
  }
}
