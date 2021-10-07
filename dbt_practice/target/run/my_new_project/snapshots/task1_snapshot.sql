
      update "dellstore"."public"."task1_snapshot"
    set dbt_valid_to = DBT_INTERNAL_SOURCE.dbt_valid_to
    from "task1_snapshot__dbt_tmp215613094552" as DBT_INTERNAL_SOURCE
    where DBT_INTERNAL_SOURCE.dbt_scd_id::text = "dellstore"."public"."task1_snapshot".dbt_scd_id::text
      and DBT_INTERNAL_SOURCE.dbt_change_type::text in ('update'::text, 'delete'::text)
      and "dellstore"."public"."task1_snapshot".dbt_valid_to is null;

    insert into "dellstore"."public"."task1_snapshot" ("prod_id", "category", "title", "actor", "price", "special", "common_prod_id", "dbt_updated_at", "dbt_valid_from", "dbt_valid_to", "dbt_scd_id")
    select DBT_INTERNAL_SOURCE."prod_id",DBT_INTERNAL_SOURCE."category",DBT_INTERNAL_SOURCE."title",DBT_INTERNAL_SOURCE."actor",DBT_INTERNAL_SOURCE."price",DBT_INTERNAL_SOURCE."special",DBT_INTERNAL_SOURCE."common_prod_id",DBT_INTERNAL_SOURCE."dbt_updated_at",DBT_INTERNAL_SOURCE."dbt_valid_from",DBT_INTERNAL_SOURCE."dbt_valid_to",DBT_INTERNAL_SOURCE."dbt_scd_id"
    from "task1_snapshot__dbt_tmp215613094552" as DBT_INTERNAL_SOURCE
    where DBT_INTERNAL_SOURCE.dbt_change_type::text = 'insert'::text;

  