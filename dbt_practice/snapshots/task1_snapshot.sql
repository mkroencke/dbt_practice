{% snapshot task1_snapshot %}

{{
    config(
        target_database="dellstore",
        target_schema="public",
        strategy="check",
        unique_key="prod_id",
        check_cols=["price", "special"],
    )
}}

SELECT * FROM {{source("dellstore_dataset", "products")}}

{% endsnapshot %}