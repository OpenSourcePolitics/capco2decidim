
/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/

{{ config(materialized='table') }}

with fos_users as (
    select *
    from "capco"."fos_user"
),
user_following as (
    select *
    from "capco"."user_following"
),
user_connection as (
    select *
    from "capco"."user_connection"
)


select 
    abs(('x'||lpad(encode(digest(fos_users.id, 'sha1'),'hex'),16,'0'))::bit(64)::bigint) as id,
    fos_users.email as email,
    fos_users.password as encrypted_password,
    fos_users.reset_password_token, -- to convert to hex
    null as reset_password_token_sent_at,
    null as remember_created_at,
    0 as sign_in_count,
    null as current_sign_in_at,
    null as last_sign_in_at,
    '' as current_sign_in_ip,
    '' as last_sign_in_ip,
    null as created_at,
    null as updated_at,
    null as invitation_token,
    null as invitation_created_at,
    null as invitation_sent_at,
    null as invitation_accepted_at,
    null as invitation_limit,
    null as invited_by_type,
    null as invited_by_id,
    0 as invitations_count,
    null as decidim_organization_id,
    null as confirmation_token,
    null as confirmed_at,
    null as confirmation_sent_at,
    null as unconfirmed_email,
    '' as name,
    '' as locale,
    '' as avatar,
    null as delete_reason,
    null as deleted_at,
    false as admin,
    false as managed,
    '{}'::jsonb as roles,
    false as email_on_notifications,
    '' as nickname,
    '' as personal_url,
    '' as about,
    null as accepted_tos_version,
    null as officialized_at,
    null as officialized_as,
    null as newsletter_token,
    null as newsletter_notifications_at,
    null as type,
    '{}'::jsonb as extented_data,
    0 as following_count,
    0 as followers_count,
    null as notification_types,
    0 as failed_attemps,
    null as unlock_token,
    null as locked_at,
    null as admin_terms_accepted_at,
    null as session_token,
    null as direct_message_types,
    false as blocked,
    null as blocked_at,
    null as block_id,
    false as email_on_moderations,
    0 as follows_count
from fos_users