--
-- PostgreSQL database dump
--

\restrict w119JqsYRBhNFZ7fgAQp89lxfmljQr4HhfoceEP7nnExFnFNMMzQfjzbJNaZCnH

-- Dumped from database version 17.6
-- Dumped by pg_dump version 17.6

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: auth; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA auth;


ALTER SCHEMA auth OWNER TO supabase_admin;

--
-- Name: extensions; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA extensions;


ALTER SCHEMA extensions OWNER TO postgres;

--
-- Name: graphql; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA graphql;


ALTER SCHEMA graphql OWNER TO supabase_admin;

--
-- Name: graphql_public; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA graphql_public;


ALTER SCHEMA graphql_public OWNER TO supabase_admin;

--
-- Name: pg_net; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_net WITH SCHEMA extensions;


--
-- Name: EXTENSION pg_net; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pg_net IS 'Async HTTP';


--
-- Name: pgbouncer; Type: SCHEMA; Schema: -; Owner: pgbouncer
--

CREATE SCHEMA pgbouncer;


ALTER SCHEMA pgbouncer OWNER TO pgbouncer;

--
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO postgres;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS '';


--
-- Name: realtime; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA realtime;


ALTER SCHEMA realtime OWNER TO supabase_admin;

--
-- Name: storage; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA storage;


ALTER SCHEMA storage OWNER TO supabase_admin;

--
-- Name: supabase_functions; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA supabase_functions;


ALTER SCHEMA supabase_functions OWNER TO supabase_admin;

--
-- Name: vault; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA vault;


ALTER SCHEMA vault OWNER TO supabase_admin;

--
-- Name: pg_graphql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_graphql WITH SCHEMA graphql;


--
-- Name: EXTENSION pg_graphql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pg_graphql IS 'pg_graphql: GraphQL support';


--
-- Name: pg_stat_statements; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_stat_statements WITH SCHEMA extensions;


--
-- Name: EXTENSION pg_stat_statements; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pg_stat_statements IS 'track planning and execution statistics of all SQL statements executed';


--
-- Name: pgcrypto; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA extensions;


--
-- Name: EXTENSION pgcrypto; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';


--
-- Name: supabase_vault; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS supabase_vault WITH SCHEMA vault;


--
-- Name: EXTENSION supabase_vault; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION supabase_vault IS 'Supabase Vault Extension';


--
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA extensions;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


--
-- Name: aal_level; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.aal_level AS ENUM (
    'aal1',
    'aal2',
    'aal3'
);


ALTER TYPE auth.aal_level OWNER TO supabase_auth_admin;

--
-- Name: code_challenge_method; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.code_challenge_method AS ENUM (
    's256',
    'plain'
);


ALTER TYPE auth.code_challenge_method OWNER TO supabase_auth_admin;

--
-- Name: factor_status; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.factor_status AS ENUM (
    'unverified',
    'verified'
);


ALTER TYPE auth.factor_status OWNER TO supabase_auth_admin;

--
-- Name: factor_type; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.factor_type AS ENUM (
    'totp',
    'webauthn',
    'phone'
);


ALTER TYPE auth.factor_type OWNER TO supabase_auth_admin;

--
-- Name: oauth_authorization_status; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.oauth_authorization_status AS ENUM (
    'pending',
    'approved',
    'denied',
    'expired'
);


ALTER TYPE auth.oauth_authorization_status OWNER TO supabase_auth_admin;

--
-- Name: oauth_client_type; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.oauth_client_type AS ENUM (
    'public',
    'confidential'
);


ALTER TYPE auth.oauth_client_type OWNER TO supabase_auth_admin;

--
-- Name: oauth_registration_type; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.oauth_registration_type AS ENUM (
    'dynamic',
    'manual'
);


ALTER TYPE auth.oauth_registration_type OWNER TO supabase_auth_admin;

--
-- Name: oauth_response_type; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.oauth_response_type AS ENUM (
    'code'
);


ALTER TYPE auth.oauth_response_type OWNER TO supabase_auth_admin;

--
-- Name: one_time_token_type; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.one_time_token_type AS ENUM (
    'confirmation_token',
    'reauthentication_token',
    'recovery_token',
    'email_change_token_new',
    'email_change_token_current',
    'phone_change_token'
);


ALTER TYPE auth.one_time_token_type OWNER TO supabase_auth_admin;

--
-- Name: chat_role; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.chat_role AS ENUM (
    'user',
    'assistant'
);


ALTER TYPE public.chat_role OWNER TO postgres;

--
-- Name: user_role; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.user_role AS ENUM (
    'admin',
    'user'
);


ALTER TYPE public.user_role OWNER TO postgres;

--
-- Name: action; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.action AS ENUM (
    'INSERT',
    'UPDATE',
    'DELETE',
    'TRUNCATE',
    'ERROR'
);


ALTER TYPE realtime.action OWNER TO supabase_admin;

--
-- Name: equality_op; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.equality_op AS ENUM (
    'eq',
    'neq',
    'lt',
    'lte',
    'gt',
    'gte',
    'in'
);


ALTER TYPE realtime.equality_op OWNER TO supabase_admin;

--
-- Name: user_defined_filter; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.user_defined_filter AS (
	column_name text,
	op realtime.equality_op,
	value text
);


ALTER TYPE realtime.user_defined_filter OWNER TO supabase_admin;

--
-- Name: wal_column; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.wal_column AS (
	name text,
	type_name text,
	type_oid oid,
	value jsonb,
	is_pkey boolean,
	is_selectable boolean
);


ALTER TYPE realtime.wal_column OWNER TO supabase_admin;

--
-- Name: wal_rls; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.wal_rls AS (
	wal jsonb,
	is_rls_enabled boolean,
	subscription_ids uuid[],
	errors text[]
);


ALTER TYPE realtime.wal_rls OWNER TO supabase_admin;

--
-- Name: buckettype; Type: TYPE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TYPE storage.buckettype AS ENUM (
    'STANDARD',
    'ANALYTICS'
);


ALTER TYPE storage.buckettype OWNER TO supabase_storage_admin;

--
-- Name: email(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.email() RETURNS text
    LANGUAGE sql STABLE
    AS $$
  select 
  coalesce(
    nullif(current_setting('request.jwt.claim.email', true), ''),
    (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'email')
  )::text
$$;


ALTER FUNCTION auth.email() OWNER TO supabase_auth_admin;

--
-- Name: FUNCTION email(); Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON FUNCTION auth.email() IS 'Deprecated. Use auth.jwt() -> ''email'' instead.';


--
-- Name: jwt(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.jwt() RETURNS jsonb
    LANGUAGE sql STABLE
    AS $$
  select 
    coalesce(
        nullif(current_setting('request.jwt.claim', true), ''),
        nullif(current_setting('request.jwt.claims', true), '')
    )::jsonb
$$;


ALTER FUNCTION auth.jwt() OWNER TO supabase_auth_admin;

--
-- Name: role(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.role() RETURNS text
    LANGUAGE sql STABLE
    AS $$
  select 
  coalesce(
    nullif(current_setting('request.jwt.claim.role', true), ''),
    (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'role')
  )::text
$$;


ALTER FUNCTION auth.role() OWNER TO supabase_auth_admin;

--
-- Name: FUNCTION role(); Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON FUNCTION auth.role() IS 'Deprecated. Use auth.jwt() -> ''role'' instead.';


--
-- Name: uid(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.uid() RETURNS uuid
    LANGUAGE sql STABLE
    AS $$
  select 
  coalesce(
    nullif(current_setting('request.jwt.claim.sub', true), ''),
    (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'sub')
  )::uuid
$$;


ALTER FUNCTION auth.uid() OWNER TO supabase_auth_admin;

--
-- Name: FUNCTION uid(); Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON FUNCTION auth.uid() IS 'Deprecated. Use auth.jwt() -> ''sub'' instead.';


--
-- Name: grant_pg_cron_access(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.grant_pg_cron_access() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  IF EXISTS (
    SELECT
    FROM pg_event_trigger_ddl_commands() AS ev
    JOIN pg_extension AS ext
    ON ev.objid = ext.oid
    WHERE ext.extname = 'pg_cron'
  )
  THEN
    grant usage on schema cron to postgres with grant option;

    alter default privileges in schema cron grant all on tables to postgres with grant option;
    alter default privileges in schema cron grant all on functions to postgres with grant option;
    alter default privileges in schema cron grant all on sequences to postgres with grant option;

    alter default privileges for user supabase_admin in schema cron grant all
        on sequences to postgres with grant option;
    alter default privileges for user supabase_admin in schema cron grant all
        on tables to postgres with grant option;
    alter default privileges for user supabase_admin in schema cron grant all
        on functions to postgres with grant option;

    grant all privileges on all tables in schema cron to postgres with grant option;
    revoke all on table cron.job from postgres;
    grant select on table cron.job to postgres with grant option;
  END IF;
END;
$$;


ALTER FUNCTION extensions.grant_pg_cron_access() OWNER TO supabase_admin;

--
-- Name: FUNCTION grant_pg_cron_access(); Type: COMMENT; Schema: extensions; Owner: supabase_admin
--

COMMENT ON FUNCTION extensions.grant_pg_cron_access() IS 'Grants access to pg_cron';


--
-- Name: grant_pg_graphql_access(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.grant_pg_graphql_access() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $_$
DECLARE
    func_is_graphql_resolve bool;
BEGIN
    func_is_graphql_resolve = (
        SELECT n.proname = 'resolve'
        FROM pg_event_trigger_ddl_commands() AS ev
        LEFT JOIN pg_catalog.pg_proc AS n
        ON ev.objid = n.oid
    );

    IF func_is_graphql_resolve
    THEN
        -- Update public wrapper to pass all arguments through to the pg_graphql resolve func
        DROP FUNCTION IF EXISTS graphql_public.graphql;
        create or replace function graphql_public.graphql(
            "operationName" text default null,
            query text default null,
            variables jsonb default null,
            extensions jsonb default null
        )
            returns jsonb
            language sql
        as $$
            select graphql.resolve(
                query := query,
                variables := coalesce(variables, '{}'),
                "operationName" := "operationName",
                extensions := extensions
            );
        $$;

        -- This hook executes when `graphql.resolve` is created. That is not necessarily the last
        -- function in the extension so we need to grant permissions on existing entities AND
        -- update default permissions to any others that are created after `graphql.resolve`
        grant usage on schema graphql to postgres, anon, authenticated, service_role;
        grant select on all tables in schema graphql to postgres, anon, authenticated, service_role;
        grant execute on all functions in schema graphql to postgres, anon, authenticated, service_role;
        grant all on all sequences in schema graphql to postgres, anon, authenticated, service_role;
        alter default privileges in schema graphql grant all on tables to postgres, anon, authenticated, service_role;
        alter default privileges in schema graphql grant all on functions to postgres, anon, authenticated, service_role;
        alter default privileges in schema graphql grant all on sequences to postgres, anon, authenticated, service_role;

        -- Allow postgres role to allow granting usage on graphql and graphql_public schemas to custom roles
        grant usage on schema graphql_public to postgres with grant option;
        grant usage on schema graphql to postgres with grant option;
    END IF;

END;
$_$;


ALTER FUNCTION extensions.grant_pg_graphql_access() OWNER TO supabase_admin;

--
-- Name: FUNCTION grant_pg_graphql_access(); Type: COMMENT; Schema: extensions; Owner: supabase_admin
--

COMMENT ON FUNCTION extensions.grant_pg_graphql_access() IS 'Grants access to pg_graphql';


--
-- Name: grant_pg_net_access(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.grant_pg_net_access() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
  BEGIN
    IF EXISTS (
      SELECT 1
      FROM pg_event_trigger_ddl_commands() AS ev
      JOIN pg_extension AS ext
      ON ev.objid = ext.oid
      WHERE ext.extname = 'pg_net'
    )
    THEN
      GRANT USAGE ON SCHEMA net TO supabase_functions_admin, postgres, anon, authenticated, service_role;

      IF EXISTS (
        SELECT FROM pg_extension
        WHERE extname = 'pg_net'
        -- all versions in use on existing projects as of 2025-02-20
        -- version 0.12.0 onwards don't need these applied
        AND extversion IN ('0.2', '0.6', '0.7', '0.7.1', '0.8', '0.10.0', '0.11.0')
      ) THEN
        ALTER function net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) SECURITY DEFINER;
        ALTER function net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) SECURITY DEFINER;

        ALTER function net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) SET search_path = net;
        ALTER function net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) SET search_path = net;

        REVOKE ALL ON FUNCTION net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) FROM PUBLIC;
        REVOKE ALL ON FUNCTION net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) FROM PUBLIC;

        GRANT EXECUTE ON FUNCTION net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) TO supabase_functions_admin, postgres, anon, authenticated, service_role;
        GRANT EXECUTE ON FUNCTION net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) TO supabase_functions_admin, postgres, anon, authenticated, service_role;
      END IF;
    END IF;
  END;
  $$;


ALTER FUNCTION extensions.grant_pg_net_access() OWNER TO supabase_admin;

--
-- Name: FUNCTION grant_pg_net_access(); Type: COMMENT; Schema: extensions; Owner: supabase_admin
--

COMMENT ON FUNCTION extensions.grant_pg_net_access() IS 'Grants access to pg_net';


--
-- Name: pgrst_ddl_watch(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.pgrst_ddl_watch() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  cmd record;
BEGIN
  FOR cmd IN SELECT * FROM pg_event_trigger_ddl_commands()
  LOOP
    IF cmd.command_tag IN (
      'CREATE SCHEMA', 'ALTER SCHEMA'
    , 'CREATE TABLE', 'CREATE TABLE AS', 'SELECT INTO', 'ALTER TABLE'
    , 'CREATE FOREIGN TABLE', 'ALTER FOREIGN TABLE'
    , 'CREATE VIEW', 'ALTER VIEW'
    , 'CREATE MATERIALIZED VIEW', 'ALTER MATERIALIZED VIEW'
    , 'CREATE FUNCTION', 'ALTER FUNCTION'
    , 'CREATE TRIGGER'
    , 'CREATE TYPE', 'ALTER TYPE'
    , 'CREATE RULE'
    , 'COMMENT'
    )
    -- don't notify in case of CREATE TEMP table or other objects created on pg_temp
    AND cmd.schema_name is distinct from 'pg_temp'
    THEN
      NOTIFY pgrst, 'reload schema';
    END IF;
  END LOOP;
END; $$;


ALTER FUNCTION extensions.pgrst_ddl_watch() OWNER TO supabase_admin;

--
-- Name: pgrst_drop_watch(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.pgrst_drop_watch() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  obj record;
BEGIN
  FOR obj IN SELECT * FROM pg_event_trigger_dropped_objects()
  LOOP
    IF obj.object_type IN (
      'schema'
    , 'table'
    , 'foreign table'
    , 'view'
    , 'materialized view'
    , 'function'
    , 'trigger'
    , 'type'
    , 'rule'
    )
    AND obj.is_temporary IS false -- no pg_temp objects
    THEN
      NOTIFY pgrst, 'reload schema';
    END IF;
  END LOOP;
END; $$;


ALTER FUNCTION extensions.pgrst_drop_watch() OWNER TO supabase_admin;

--
-- Name: set_graphql_placeholder(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.set_graphql_placeholder() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $_$
    DECLARE
    graphql_is_dropped bool;
    BEGIN
    graphql_is_dropped = (
        SELECT ev.schema_name = 'graphql_public'
        FROM pg_event_trigger_dropped_objects() AS ev
        WHERE ev.schema_name = 'graphql_public'
    );

    IF graphql_is_dropped
    THEN
        create or replace function graphql_public.graphql(
            "operationName" text default null,
            query text default null,
            variables jsonb default null,
            extensions jsonb default null
        )
            returns jsonb
            language plpgsql
        as $$
            DECLARE
                server_version float;
            BEGIN
                server_version = (SELECT (SPLIT_PART((select version()), ' ', 2))::float);

                IF server_version >= 14 THEN
                    RETURN jsonb_build_object(
                        'errors', jsonb_build_array(
                            jsonb_build_object(
                                'message', 'pg_graphql extension is not enabled.'
                            )
                        )
                    );
                ELSE
                    RETURN jsonb_build_object(
                        'errors', jsonb_build_array(
                            jsonb_build_object(
                                'message', 'pg_graphql is only available on projects running Postgres 14 onwards.'
                            )
                        )
                    );
                END IF;
            END;
        $$;
    END IF;

    END;
$_$;


ALTER FUNCTION extensions.set_graphql_placeholder() OWNER TO supabase_admin;

--
-- Name: FUNCTION set_graphql_placeholder(); Type: COMMENT; Schema: extensions; Owner: supabase_admin
--

COMMENT ON FUNCTION extensions.set_graphql_placeholder() IS 'Reintroduces placeholder function for graphql_public.graphql';


--
-- Name: get_auth(text); Type: FUNCTION; Schema: pgbouncer; Owner: supabase_admin
--

CREATE FUNCTION pgbouncer.get_auth(p_usename text) RETURNS TABLE(username text, password text)
    LANGUAGE plpgsql SECURITY DEFINER
    AS $_$
begin
    raise debug 'PgBouncer auth request: %', p_usename;

    return query
    select 
        rolname::text, 
        case when rolvaliduntil < now() 
            then null 
            else rolpassword::text 
        end 
    from pg_authid 
    where rolname=$1 and rolcanlogin;
end;
$_$;


ALTER FUNCTION pgbouncer.get_auth(p_usename text) OWNER TO supabase_admin;

--
-- Name: check_model_access(uuid, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.check_model_access(p_user_id uuid, p_model_id text) RETURNS boolean
    LANGUAGE sql STABLE
    AS $$
    SELECT EXISTS (
        SELECT 1
        FROM public.user_model_access uma
        JOIN public.models m ON uma.model_id = m.id
        WHERE uma.user_id = p_user_id AND m.model_id = p_model_id
    );
$$;


ALTER FUNCTION public.check_model_access(p_user_id uuid, p_model_id text) OWNER TO postgres;

--
-- Name: FUNCTION check_model_access(p_user_id uuid, p_model_id text); Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON FUNCTION public.check_model_access(p_user_id uuid, p_model_id text) IS 'Checks if a user has access to a model by its text ID. Returns true if access is granted, false otherwise.';


--
-- Name: get_available_models_for_user(uuid); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.get_available_models_for_user(p_user_id uuid) RETURNS TABLE(id uuid, model_id text, display_name text, provider text, temperature real, has_access boolean)
    LANGUAGE sql STABLE
    AS $$
    SELECT
        m.id,
        m.model_id,
        m.display_name,
        m.provider,
        m.temperature,
        EXISTS (
            SELECT 1
            FROM public.user_model_access uma
            WHERE uma.user_id = p_user_id AND uma.model_id = m.id
        ) as has_access
    FROM
        public.models m
    ORDER BY
        m.provider, m.display_name;
$$;


ALTER FUNCTION public.get_available_models_for_user(p_user_id uuid) OWNER TO postgres;

--
-- Name: FUNCTION get_available_models_for_user(p_user_id uuid); Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON FUNCTION public.get_available_models_for_user(p_user_id uuid) IS 'Returns all models, indicating whether the specified user has access to each.';


--
-- Name: get_current_user_simple_stats(uuid); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.get_current_user_simple_stats(p_user_id uuid) RETURNS json
    LANGUAGE plpgsql
    AS $$
DECLARE
    result json;
    total_requests BIGINT;
    weekly_requests BIGINT;
BEGIN
    -- Get total successful requests
    SELECT count(*)
    INTO total_requests
    FROM public.usage_logs
    WHERE user_id = p_user_id AND status = 'success';

    -- Get weekly successful requests
    SELECT count(*)
    INTO weekly_requests
    FROM public.usage_logs
    WHERE user_id = p_user_id 
      AND status = 'success'
      AND created_at >= date_trunc('week', now() at time zone 'utc');

    SELECT json_build_object(
        'total', total_requests,
        'weekly', weekly_requests
    )
    INTO result;
    RETURN result;
END;
$$;


ALTER FUNCTION public.get_current_user_simple_stats(p_user_id uuid) OWNER TO postgres;

--
-- Name: get_general_stats(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.get_general_stats(period text) RETURNS json
    LANGUAGE plpgsql
    AS $$
DECLARE
    result json;
BEGIN
    IF period = 'day' THEN
        SELECT json_agg(t) INTO result FROM (
            SELECT to_char(h, 'HH24') || ':00' AS date_trunc, COALESCE(stats.total_requests, 0) AS total_requests, COALESCE(stats.total_tokens, 0) AS total_tokens
            FROM generate_series(date_trunc('day', now()), date_trunc('day', now()) + interval '23 hours', interval '1 hour') h
            LEFT JOIN (
                SELECT date_trunc('hour', created_at) as hour, count(id) as total_requests, sum(total_tokens) as total_tokens
                FROM public.usage_logs
                WHERE status = 'success' AND created_at >= date_trunc('day', now())
                GROUP BY 1
            ) stats ON stats.hour = h
            ORDER BY h
        ) t;
    ELSIF period = 'week' THEN
         SELECT json_agg(t) INTO result FROM (
            SELECT to_char(d, 'Day') AS date_trunc, COALESCE(stats.total_requests, 0) AS total_requests, COALESCE(stats.total_tokens, 0) AS total_tokens
            FROM generate_series(now() - interval '6 days', now(), interval '1 day') d
            LEFT JOIN (
                SELECT date_trunc('day', created_at) as day, count(id) as total_requests, sum(total_tokens) as total_tokens
                FROM public.usage_logs
                WHERE status = 'success' AND created_at >= date_trunc('day', now() - interval '6 days')
                GROUP BY 1
            ) stats ON stats.day = date_trunc('day', d::timestamp)
            ORDER BY d
        ) t;
    ELSE -- month
         SELECT json_agg(t) INTO result FROM (
            SELECT to_char(d, 'MM-DD') AS date_trunc, COALESCE(stats.total_requests, 0) AS total_requests, COALESCE(stats.total_tokens, 0) AS total_tokens
            FROM generate_series(now() - interval '29 days', now(), interval '1 day') d
            LEFT JOIN (
                SELECT date_trunc('day', created_at) as day, count(id) as total_requests, sum(total_tokens) as total_tokens
                FROM public.usage_logs
                WHERE status = 'success' AND created_at >= date_trunc('day', now() - interval '29 days')
                GROUP BY 1
            ) stats ON stats.day = date_trunc('day', d::timestamp)
            ORDER BY d
        ) t;
    END IF;
    RETURN result;
END;
$$;


ALTER FUNCTION public.get_general_stats(period text) OWNER TO postgres;

--
-- Name: get_model_usage_stats(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.get_model_usage_stats(period text) RETURNS json
    LANGUAGE plpgsql STABLE
    AS $$
DECLARE
    result json;
BEGIN
    SELECT json_agg(t) INTO result FROM (
        SELECT
            model,
            COALESCE(COUNT(*), 0) AS total_requests,
            COALESCE(SUM(total_tokens), 0) AS total_tokens
        FROM public.usage_logs
        WHERE status = 'success'
          AND created_at >= (
            CASE
              WHEN period = 'day' THEN date_trunc('day', now() at time zone 'utc')
              WHEN period = 'week' THEN now() at time zone 'utc' - interval '6 days' -- Changed
              WHEN period = 'month' THEN now() at time zone 'utc' - interval '29 days'
              ELSE date_trunc('day', now() at time zone 'utc')
            END
          )
        GROUP BY model
        ORDER BY total_requests DESC
    ) t;
    RETURN result;
END;
$$;


ALTER FUNCTION public.get_model_usage_stats(period text) OWNER TO postgres;

--
-- Name: get_user_message_history(uuid, text, integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.get_user_message_history(p_user_id uuid, period text, p_page_size integer, p_page_number integer) RETURNS json
    LANGUAGE plpgsql
    AS $$
DECLARE
    result json;
    v_total_count INTEGER;
BEGIN
    -- Calculate total count
    SELECT COUNT(*)
    INTO v_total_count
    FROM public.usage_logs
    WHERE user_id = p_user_id
      AND status = 'success'
      AND created_at >= (
        CASE 
          WHEN period = 'day' THEN date_trunc('day', now() at time zone 'utc')
          WHEN period = 'week' THEN date_trunc('week', now() at time zone 'utc')
          WHEN period = 'month' THEN now() at time zone 'utc' - interval '29 days'
          ELSE date_trunc('day', now() at time zone 'utc')
        END
      );
    
    -- Get paginated data
    SELECT json_build_object(
        'data', COALESCE(json_agg(row_to_json(t)), '[]'::json),
        'total', v_total_count
    ) INTO result
    FROM (
        SELECT 
            ul.created_at,
            m.content,
            ul.model,
            ul.total_tokens
        FROM public.usage_logs ul
        JOIN public.messages m ON ul.message_id = m.id
        WHERE ul.user_id = p_user_id
          AND ul.status = 'success'
          AND ul.created_at >= (
            CASE 
              WHEN period = 'day' THEN date_trunc('day', now() at time zone 'utc')
              WHEN period = 'week' THEN date_trunc('week', now() at time zone 'utc')
              WHEN period = 'month' THEN now() at time zone 'utc' - interval '29 days'
              ELSE date_trunc('day', now() at time zone 'utc')
            END
          )
        ORDER BY ul.created_at DESC
        LIMIT p_page_size OFFSET (p_page_number - 1) * p_page_size
    ) t;
    
    RETURN result;
END;
$$;


ALTER FUNCTION public.get_user_message_history(p_user_id uuid, period text, p_page_size integer, p_page_number integer) OWNER TO postgres;

--
-- Name: get_user_model_usage_stats(uuid, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.get_user_model_usage_stats(p_user_id uuid, period text) RETURNS json
    LANGUAGE plpgsql STABLE
    AS $$
DECLARE
    result json;
BEGIN
    SELECT json_agg(t) INTO result FROM (
        SELECT
            model,
            COALESCE(COUNT(*), 0) AS total_requests,
            COALESCE(SUM(total_tokens), 0) AS total_tokens
        FROM public.usage_logs
        WHERE user_id = p_user_id
          AND status = 'success'
          AND created_at >= (
            CASE
              WHEN period = 'day' THEN date_trunc('day', now() at time zone 'utc')
              WHEN period = 'week' THEN now() at time zone 'utc' - interval '6 days' -- Changed
              WHEN period = 'month' THEN now() at time zone 'utc' - interval '29 days'
              ELSE date_trunc('day', now() at time zone 'utc')
            END
          )
        GROUP BY model
        ORDER BY total_requests DESC
    ) t;
    RETURN result;
END;
$$;


ALTER FUNCTION public.get_user_model_usage_stats(p_user_id uuid, period text) OWNER TO postgres;

--
-- Name: get_user_stats(uuid, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.get_user_stats(p_user_id uuid, period text) RETURNS json
    LANGUAGE plpgsql
    AS $$
DECLARE
    result json;
BEGIN
    IF period = 'day' THEN
        SELECT json_agg(t) INTO result FROM (
            SELECT to_char(h, 'HH24') || ':00' AS date_trunc,
                   COALESCE(stats.total_requests, 0) AS total_requests,
                   COALESCE(stats.total_tokens, 0) AS total_tokens
            FROM generate_series(date_trunc('day', now()), date_trunc('day', now()) + interval '23 hours', interval '1 hour') h
            LEFT JOIN (
                SELECT date_trunc('hour', created_at) as hour, count(id) as total_requests, sum(total_tokens) as total_tokens
                FROM public.usage_logs
                WHERE user_id = p_user_id AND status = 'success' AND created_at >= date_trunc('day', now())
                GROUP BY 1
            ) stats ON stats.hour = h
            ORDER BY h
        ) t;
    ELSIF period = 'week' THEN
        SELECT json_agg(t) INTO result FROM (
             SELECT to_char(d, 'Day') AS date_trunc,
                    COALESCE(stats.total_requests, 0) AS total_requests,
                    COALESCE(stats.total_tokens, 0) AS total_tokens
             FROM generate_series(now() - interval '6 days', now(), interval '1 day') d
             LEFT JOIN (
                SELECT date_trunc('day', created_at) as day, count(id) as total_requests, sum(total_tokens) as total_tokens
                FROM public.usage_logs
                WHERE user_id = p_user_id AND status = 'success' AND created_at >= date_trunc('day', now() - interval '6 days')
                GROUP BY 1
            ) stats ON stats.day = date_trunc('day', d::timestamp)
             ORDER BY d
        ) t;
    ELSE -- month
        SELECT json_agg(t) INTO result FROM (
            SELECT to_char(d, 'MM-DD') AS date_trunc,
                   COALESCE(stats.total_requests, 0) AS total_requests,
                   COALESCE(stats.total_tokens, 0) AS total_tokens
            FROM generate_series(now() - interval '29 days', now(), interval '1 day') d
            LEFT JOIN (
                SELECT date_trunc('day', created_at) as day, count(id) as total_requests, sum(total_tokens) as total_tokens
                FROM public.usage_logs
                WHERE user_id = p_user_id AND status = 'success' AND created_at >= date_trunc('day', now() - interval '29 days')
                GROUP BY 1
            ) stats ON stats.day = date_trunc('day', d::timestamp)
            ORDER BY d
        ) t;
    END IF;
    RETURN result;
END;
$$;


ALTER FUNCTION public.get_user_stats(p_user_id uuid, period text) OWNER TO postgres;

--
-- Name: get_user_usage_stats(uuid); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.get_user_usage_stats(p_user_id uuid) RETURNS json
    LANGUAGE plpgsql STABLE
    AS $$
DECLARE
    requests_count INT;
    requests_limit INT;
BEGIN
    -- Count user requests for today (UTC) from usage_logs where status is 'success'
    -- This is more accurate as it only counts successful requests.
    SELECT COUNT(*)
    INTO requests_count
    FROM public.usage_logs
    WHERE user_id = p_user_id
      AND status = 'success'
      AND created_at >= date_trunc('day', now() at time zone 'utc');

    -- Get user's daily limit, default to 0 if no profile is found
    SELECT COALESCE(daily_request_limit, 0)
    INTO requests_limit
    FROM public.user_profiles
    WHERE id = p_user_id;

    -- If no profile was found, the query above returns no rows, and requests_limit will be NULL.
    -- We must handle this case and default to 0.
    requests_limit := COALESCE(requests_limit, 0);

    -- Return result as JSON
    RETURN json_build_object(
        'usage', requests_count,
        'limit', requests_limit
    );
END;
$$;


ALTER FUNCTION public.get_user_usage_stats(p_user_id uuid) OWNER TO postgres;

--
-- Name: handle_new_user(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.handle_new_user() RETURNS trigger
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
    AS $$
BEGIN
    -- Create user profile
    INSERT INTO public.user_profiles (id, email, display_name)
    VALUES (
        new.id,
        new.email,
        new.raw_user_meta_data->>'display_name'
    );
    
    -- Grant access to DEFAULT models only for the new user
    INSERT INTO public.user_model_access (user_id, model_id)
    SELECT new.id, m.id FROM public.models m WHERE m.is_default_access = true;
    
    RETURN new;
END;
$$;


ALTER FUNCTION public.handle_new_user() OWNER TO postgres;

--
-- Name: handle_updated_at(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.handle_updated_at() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    NEW.updated_at = now();
    RETURN NEW;
END;
$$;


ALTER FUNCTION public.handle_updated_at() OWNER TO postgres;

--
-- Name: set_user_model_permission(uuid, uuid, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.set_user_model_permission(p_user_id uuid, p_model_id uuid, p_has_access boolean) RETURNS void
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
BEGIN
    IF p_has_access THEN
        -- Grant access by inserting a record
        INSERT INTO public.user_model_access (user_id, model_id)
        VALUES (p_user_id, p_model_id)
        ON CONFLICT (user_id, model_id) DO NOTHING;
    ELSE
        -- Revoke access by deleting the record
        DELETE FROM public.user_model_access
        WHERE user_id = p_user_id AND model_id = p_model_id;
    END IF;
END;
$$;


ALTER FUNCTION public.set_user_model_permission(p_user_id uuid, p_model_id uuid, p_has_access boolean) OWNER TO postgres;

--
-- Name: FUNCTION set_user_model_permission(p_user_id uuid, p_model_id uuid, p_has_access boolean); Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON FUNCTION public.set_user_model_permission(p_user_id uuid, p_model_id uuid, p_has_access boolean) IS 'Grants or revokes a user''s access to a specific model. To be called by admin users.';


--
-- Name: update_model_routing_updated_at(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.update_model_routing_updated_at() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    NEW.updated_at = now();
    RETURN NEW;
END;
$$;


ALTER FUNCTION public.update_model_routing_updated_at() OWNER TO postgres;

--
-- Name: apply_rls(jsonb, integer); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer DEFAULT (1024 * 1024)) RETURNS SETOF realtime.wal_rls
    LANGUAGE plpgsql
    AS $$
declare
-- Regclass of the table e.g. public.notes
entity_ regclass = (quote_ident(wal ->> 'schema') || '.' || quote_ident(wal ->> 'table'))::regclass;

-- I, U, D, T: insert, update ...
action realtime.action = (
    case wal ->> 'action'
        when 'I' then 'INSERT'
        when 'U' then 'UPDATE'
        when 'D' then 'DELETE'
        else 'ERROR'
    end
);

-- Is row level security enabled for the table
is_rls_enabled bool = relrowsecurity from pg_class where oid = entity_;

subscriptions realtime.subscription[] = array_agg(subs)
    from
        realtime.subscription subs
    where
        subs.entity = entity_;

-- Subscription vars
roles regrole[] = array_agg(distinct us.claims_role::text)
    from
        unnest(subscriptions) us;

working_role regrole;
claimed_role regrole;
claims jsonb;

subscription_id uuid;
subscription_has_access bool;
visible_to_subscription_ids uuid[] = '{}';

-- structured info for wal's columns
columns realtime.wal_column[];
-- previous identity values for update/delete
old_columns realtime.wal_column[];

error_record_exceeds_max_size boolean = octet_length(wal::text) > max_record_bytes;

-- Primary jsonb output for record
output jsonb;

begin
perform set_config('role', null, true);

columns =
    array_agg(
        (
            x->>'name',
            x->>'type',
            x->>'typeoid',
            realtime.cast(
                (x->'value') #>> '{}',
                coalesce(
                    (x->>'typeoid')::regtype, -- null when wal2json version <= 2.4
                    (x->>'type')::regtype
                )
            ),
            (pks ->> 'name') is not null,
            true
        )::realtime.wal_column
    )
    from
        jsonb_array_elements(wal -> 'columns') x
        left join jsonb_array_elements(wal -> 'pk') pks
            on (x ->> 'name') = (pks ->> 'name');

old_columns =
    array_agg(
        (
            x->>'name',
            x->>'type',
            x->>'typeoid',
            realtime.cast(
                (x->'value') #>> '{}',
                coalesce(
                    (x->>'typeoid')::regtype, -- null when wal2json version <= 2.4
                    (x->>'type')::regtype
                )
            ),
            (pks ->> 'name') is not null,
            true
        )::realtime.wal_column
    )
    from
        jsonb_array_elements(wal -> 'identity') x
        left join jsonb_array_elements(wal -> 'pk') pks
            on (x ->> 'name') = (pks ->> 'name');

for working_role in select * from unnest(roles) loop

    -- Update `is_selectable` for columns and old_columns
    columns =
        array_agg(
            (
                c.name,
                c.type_name,
                c.type_oid,
                c.value,
                c.is_pkey,
                pg_catalog.has_column_privilege(working_role, entity_, c.name, 'SELECT')
            )::realtime.wal_column
        )
        from
            unnest(columns) c;

    old_columns =
            array_agg(
                (
                    c.name,
                    c.type_name,
                    c.type_oid,
                    c.value,
                    c.is_pkey,
                    pg_catalog.has_column_privilege(working_role, entity_, c.name, 'SELECT')
                )::realtime.wal_column
            )
            from
                unnest(old_columns) c;

    if action <> 'DELETE' and count(1) = 0 from unnest(columns) c where c.is_pkey then
        return next (
            jsonb_build_object(
                'schema', wal ->> 'schema',
                'table', wal ->> 'table',
                'type', action
            ),
            is_rls_enabled,
            -- subscriptions is already filtered by entity
            (select array_agg(s.subscription_id) from unnest(subscriptions) as s where claims_role = working_role),
            array['Error 400: Bad Request, no primary key']
        )::realtime.wal_rls;

    -- The claims role does not have SELECT permission to the primary key of entity
    elsif action <> 'DELETE' and sum(c.is_selectable::int) <> count(1) from unnest(columns) c where c.is_pkey then
        return next (
            jsonb_build_object(
                'schema', wal ->> 'schema',
                'table', wal ->> 'table',
                'type', action
            ),
            is_rls_enabled,
            (select array_agg(s.subscription_id) from unnest(subscriptions) as s where claims_role = working_role),
            array['Error 401: Unauthorized']
        )::realtime.wal_rls;

    else
        output = jsonb_build_object(
            'schema', wal ->> 'schema',
            'table', wal ->> 'table',
            'type', action,
            'commit_timestamp', to_char(
                ((wal ->> 'timestamp')::timestamptz at time zone 'utc'),
                'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"'
            ),
            'columns', (
                select
                    jsonb_agg(
                        jsonb_build_object(
                            'name', pa.attname,
                            'type', pt.typname
                        )
                        order by pa.attnum asc
                    )
                from
                    pg_attribute pa
                    join pg_type pt
                        on pa.atttypid = pt.oid
                where
                    attrelid = entity_
                    and attnum > 0
                    and pg_catalog.has_column_privilege(working_role, entity_, pa.attname, 'SELECT')
            )
        )
        -- Add "record" key for insert and update
        || case
            when action in ('INSERT', 'UPDATE') then
                jsonb_build_object(
                    'record',
                    (
                        select
                            jsonb_object_agg(
                                -- if unchanged toast, get column name and value from old record
                                coalesce((c).name, (oc).name),
                                case
                                    when (c).name is null then (oc).value
                                    else (c).value
                                end
                            )
                        from
                            unnest(columns) c
                            full outer join unnest(old_columns) oc
                                on (c).name = (oc).name
                        where
                            coalesce((c).is_selectable, (oc).is_selectable)
                            and ( not error_record_exceeds_max_size or (octet_length((c).value::text) <= 64))
                    )
                )
            else '{}'::jsonb
        end
        -- Add "old_record" key for update and delete
        || case
            when action = 'UPDATE' then
                jsonb_build_object(
                        'old_record',
                        (
                            select jsonb_object_agg((c).name, (c).value)
                            from unnest(old_columns) c
                            where
                                (c).is_selectable
                                and ( not error_record_exceeds_max_size or (octet_length((c).value::text) <= 64))
                        )
                    )
            when action = 'DELETE' then
                jsonb_build_object(
                    'old_record',
                    (
                        select jsonb_object_agg((c).name, (c).value)
                        from unnest(old_columns) c
                        where
                            (c).is_selectable
                            and ( not error_record_exceeds_max_size or (octet_length((c).value::text) <= 64))
                            and ( not is_rls_enabled or (c).is_pkey ) -- if RLS enabled, we can't secure deletes so filter to pkey
                    )
                )
            else '{}'::jsonb
        end;

        -- Create the prepared statement
        if is_rls_enabled and action <> 'DELETE' then
            if (select 1 from pg_prepared_statements where name = 'walrus_rls_stmt' limit 1) > 0 then
                deallocate walrus_rls_stmt;
            end if;
            execute realtime.build_prepared_statement_sql('walrus_rls_stmt', entity_, columns);
        end if;

        visible_to_subscription_ids = '{}';

        for subscription_id, claims in (
                select
                    subs.subscription_id,
                    subs.claims
                from
                    unnest(subscriptions) subs
                where
                    subs.entity = entity_
                    and subs.claims_role = working_role
                    and (
                        realtime.is_visible_through_filters(columns, subs.filters)
                        or (
                          action = 'DELETE'
                          and realtime.is_visible_through_filters(old_columns, subs.filters)
                        )
                    )
        ) loop

            if not is_rls_enabled or action = 'DELETE' then
                visible_to_subscription_ids = visible_to_subscription_ids || subscription_id;
            else
                -- Check if RLS allows the role to see the record
                perform
                    -- Trim leading and trailing quotes from working_role because set_config
                    -- doesn't recognize the role as valid if they are included
                    set_config('role', trim(both '"' from working_role::text), true),
                    set_config('request.jwt.claims', claims::text, true);

                execute 'execute walrus_rls_stmt' into subscription_has_access;

                if subscription_has_access then
                    visible_to_subscription_ids = visible_to_subscription_ids || subscription_id;
                end if;
            end if;
        end loop;

        perform set_config('role', null, true);

        return next (
            output,
            is_rls_enabled,
            visible_to_subscription_ids,
            case
                when error_record_exceeds_max_size then array['Error 413: Payload Too Large']
                else '{}'
            end
        )::realtime.wal_rls;

    end if;
end loop;

perform set_config('role', null, true);
end;
$$;


ALTER FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) OWNER TO supabase_admin;

--
-- Name: broadcast_changes(text, text, text, text, text, record, record, text); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text DEFAULT 'ROW'::text) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
    -- Declare a variable to hold the JSONB representation of the row
    row_data jsonb := '{}'::jsonb;
BEGIN
    IF level = 'STATEMENT' THEN
        RAISE EXCEPTION 'function can only be triggered for each row, not for each statement';
    END IF;
    -- Check the operation type and handle accordingly
    IF operation = 'INSERT' OR operation = 'UPDATE' OR operation = 'DELETE' THEN
        row_data := jsonb_build_object('old_record', OLD, 'record', NEW, 'operation', operation, 'table', table_name, 'schema', table_schema);
        PERFORM realtime.send (row_data, event_name, topic_name);
    ELSE
        RAISE EXCEPTION 'Unexpected operation type: %', operation;
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        RAISE EXCEPTION 'Failed to process the row: %', SQLERRM;
END;

$$;


ALTER FUNCTION realtime.broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text) OWNER TO supabase_admin;

--
-- Name: build_prepared_statement_sql(text, regclass, realtime.wal_column[]); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) RETURNS text
    LANGUAGE sql
    AS $$
      /*
      Builds a sql string that, if executed, creates a prepared statement to
      tests retrive a row from *entity* by its primary key columns.
      Example
          select realtime.build_prepared_statement_sql('public.notes', '{"id"}'::text[], '{"bigint"}'::text[])
      */
          select
      'prepare ' || prepared_statement_name || ' as
          select
              exists(
                  select
                      1
                  from
                      ' || entity || '
                  where
                      ' || string_agg(quote_ident(pkc.name) || '=' || quote_nullable(pkc.value #>> '{}') , ' and ') || '
              )'
          from
              unnest(columns) pkc
          where
              pkc.is_pkey
          group by
              entity
      $$;


ALTER FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) OWNER TO supabase_admin;

--
-- Name: cast(text, regtype); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime."cast"(val text, type_ regtype) RETURNS jsonb
    LANGUAGE plpgsql IMMUTABLE
    AS $$
    declare
      res jsonb;
    begin
      execute format('select to_jsonb(%L::'|| type_::text || ')', val)  into res;
      return res;
    end
    $$;


ALTER FUNCTION realtime."cast"(val text, type_ regtype) OWNER TO supabase_admin;

--
-- Name: check_equality_op(realtime.equality_op, regtype, text, text); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) RETURNS boolean
    LANGUAGE plpgsql IMMUTABLE
    AS $$
      /*
      Casts *val_1* and *val_2* as type *type_* and check the *op* condition for truthiness
      */
      declare
          op_symbol text = (
              case
                  when op = 'eq' then '='
                  when op = 'neq' then '!='
                  when op = 'lt' then '<'
                  when op = 'lte' then '<='
                  when op = 'gt' then '>'
                  when op = 'gte' then '>='
                  when op = 'in' then '= any'
                  else 'UNKNOWN OP'
              end
          );
          res boolean;
      begin
          execute format(
              'select %L::'|| type_::text || ' ' || op_symbol
              || ' ( %L::'
              || (
                  case
                      when op = 'in' then type_::text || '[]'
                      else type_::text end
              )
              || ')', val_1, val_2) into res;
          return res;
      end;
      $$;


ALTER FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) OWNER TO supabase_admin;

--
-- Name: is_visible_through_filters(realtime.wal_column[], realtime.user_defined_filter[]); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) RETURNS boolean
    LANGUAGE sql IMMUTABLE
    AS $_$
    /*
    Should the record be visible (true) or filtered out (false) after *filters* are applied
    */
        select
            -- Default to allowed when no filters present
            $2 is null -- no filters. this should not happen because subscriptions has a default
            or array_length($2, 1) is null -- array length of an empty array is null
            or bool_and(
                coalesce(
                    realtime.check_equality_op(
                        op:=f.op,
                        type_:=coalesce(
                            col.type_oid::regtype, -- null when wal2json version <= 2.4
                            col.type_name::regtype
                        ),
                        -- cast jsonb to text
                        val_1:=col.value #>> '{}',
                        val_2:=f.value
                    ),
                    false -- if null, filter does not match
                )
            )
        from
            unnest(filters) f
            join unnest(columns) col
                on f.column_name = col.name;
    $_$;


ALTER FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) OWNER TO supabase_admin;

--
-- Name: list_changes(name, name, integer, integer); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) RETURNS SETOF realtime.wal_rls
    LANGUAGE sql
    SET log_min_messages TO 'fatal'
    AS $$
      with pub as (
        select
          concat_ws(
            ',',
            case when bool_or(pubinsert) then 'insert' else null end,
            case when bool_or(pubupdate) then 'update' else null end,
            case when bool_or(pubdelete) then 'delete' else null end
          ) as w2j_actions,
          coalesce(
            string_agg(
              realtime.quote_wal2json(format('%I.%I', schemaname, tablename)::regclass),
              ','
            ) filter (where ppt.tablename is not null and ppt.tablename not like '% %'),
            ''
          ) w2j_add_tables
        from
          pg_publication pp
          left join pg_publication_tables ppt
            on pp.pubname = ppt.pubname
        where
          pp.pubname = publication
        group by
          pp.pubname
        limit 1
      ),
      w2j as (
        select
          x.*, pub.w2j_add_tables
        from
          pub,
          pg_logical_slot_get_changes(
            slot_name, null, max_changes,
            'include-pk', 'true',
            'include-transaction', 'false',
            'include-timestamp', 'true',
            'include-type-oids', 'true',
            'format-version', '2',
            'actions', pub.w2j_actions,
            'add-tables', pub.w2j_add_tables
          ) x
      )
      select
        xyz.wal,
        xyz.is_rls_enabled,
        xyz.subscription_ids,
        xyz.errors
      from
        w2j,
        realtime.apply_rls(
          wal := w2j.data::jsonb,
          max_record_bytes := max_record_bytes
        ) xyz(wal, is_rls_enabled, subscription_ids, errors)
      where
        w2j.w2j_add_tables <> ''
        and xyz.subscription_ids[1] is not null
    $$;


ALTER FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) OWNER TO supabase_admin;

--
-- Name: quote_wal2json(regclass); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.quote_wal2json(entity regclass) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $$
      select
        (
          select string_agg('' || ch,'')
          from unnest(string_to_array(nsp.nspname::text, null)) with ordinality x(ch, idx)
          where
            not (x.idx = 1 and x.ch = '"')
            and not (
              x.idx = array_length(string_to_array(nsp.nspname::text, null), 1)
              and x.ch = '"'
            )
        )
        || '.'
        || (
          select string_agg('' || ch,'')
          from unnest(string_to_array(pc.relname::text, null)) with ordinality x(ch, idx)
          where
            not (x.idx = 1 and x.ch = '"')
            and not (
              x.idx = array_length(string_to_array(nsp.nspname::text, null), 1)
              and x.ch = '"'
            )
          )
      from
        pg_class pc
        join pg_namespace nsp
          on pc.relnamespace = nsp.oid
      where
        pc.oid = entity
    $$;


ALTER FUNCTION realtime.quote_wal2json(entity regclass) OWNER TO supabase_admin;

--
-- Name: send(jsonb, text, text, boolean); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.send(payload jsonb, event text, topic text, private boolean DEFAULT true) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  BEGIN
    -- Set the topic configuration
    EXECUTE format('SET LOCAL realtime.topic TO %L', topic);

    -- Attempt to insert the message
    INSERT INTO realtime.messages (payload, event, topic, private, extension)
    VALUES (payload, event, topic, private, 'broadcast');
  EXCEPTION
    WHEN OTHERS THEN
      -- Capture and notify the error
      RAISE WARNING 'ErrorSendingBroadcastMessage: %', SQLERRM;
  END;
END;
$$;


ALTER FUNCTION realtime.send(payload jsonb, event text, topic text, private boolean) OWNER TO supabase_admin;

--
-- Name: subscription_check_filters(); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.subscription_check_filters() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
    /*
    Validates that the user defined filters for a subscription:
    - refer to valid columns that the claimed role may access
    - values are coercable to the correct column type
    */
    declare
        col_names text[] = coalesce(
                array_agg(c.column_name order by c.ordinal_position),
                '{}'::text[]
            )
            from
                information_schema.columns c
            where
                format('%I.%I', c.table_schema, c.table_name)::regclass = new.entity
                and pg_catalog.has_column_privilege(
                    (new.claims ->> 'role'),
                    format('%I.%I', c.table_schema, c.table_name)::regclass,
                    c.column_name,
                    'SELECT'
                );
        filter realtime.user_defined_filter;
        col_type regtype;

        in_val jsonb;
    begin
        for filter in select * from unnest(new.filters) loop
            -- Filtered column is valid
            if not filter.column_name = any(col_names) then
                raise exception 'invalid column for filter %', filter.column_name;
            end if;

            -- Type is sanitized and safe for string interpolation
            col_type = (
                select atttypid::regtype
                from pg_catalog.pg_attribute
                where attrelid = new.entity
                      and attname = filter.column_name
            );
            if col_type is null then
                raise exception 'failed to lookup type for column %', filter.column_name;
            end if;

            -- Set maximum number of entries for in filter
            if filter.op = 'in'::realtime.equality_op then
                in_val = realtime.cast(filter.value, (col_type::text || '[]')::regtype);
                if coalesce(jsonb_array_length(in_val), 0) > 100 then
                    raise exception 'too many values for `in` filter. Maximum 100';
                end if;
            else
                -- raises an exception if value is not coercable to type
                perform realtime.cast(filter.value, col_type);
            end if;

        end loop;

        -- Apply consistent order to filters so the unique constraint on
        -- (subscription_id, entity, filters) can't be tricked by a different filter order
        new.filters = coalesce(
            array_agg(f order by f.column_name, f.op, f.value),
            '{}'
        ) from unnest(new.filters) f;

        return new;
    end;
    $$;


ALTER FUNCTION realtime.subscription_check_filters() OWNER TO supabase_admin;

--
-- Name: to_regrole(text); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.to_regrole(role_name text) RETURNS regrole
    LANGUAGE sql IMMUTABLE
    AS $$ select role_name::regrole $$;


ALTER FUNCTION realtime.to_regrole(role_name text) OWNER TO supabase_admin;

--
-- Name: topic(); Type: FUNCTION; Schema: realtime; Owner: supabase_realtime_admin
--

CREATE FUNCTION realtime.topic() RETURNS text
    LANGUAGE sql STABLE
    AS $$
select nullif(current_setting('realtime.topic', true), '')::text;
$$;


ALTER FUNCTION realtime.topic() OWNER TO supabase_realtime_admin;

--
-- Name: add_prefixes(text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.add_prefixes(_bucket_id text, _name text) RETURNS void
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
DECLARE
    prefixes text[];
BEGIN
    prefixes := "storage"."get_prefixes"("_name");

    IF array_length(prefixes, 1) > 0 THEN
        INSERT INTO storage.prefixes (name, bucket_id)
        SELECT UNNEST(prefixes) as name, "_bucket_id" ON CONFLICT DO NOTHING;
    END IF;
END;
$$;


ALTER FUNCTION storage.add_prefixes(_bucket_id text, _name text) OWNER TO supabase_storage_admin;

--
-- Name: can_insert_object(text, text, uuid, jsonb); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.can_insert_object(bucketid text, name text, owner uuid, metadata jsonb) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO "storage"."objects" ("bucket_id", "name", "owner", "metadata") VALUES (bucketid, name, owner, metadata);
  -- hack to rollback the successful insert
  RAISE sqlstate 'PT200' using
  message = 'ROLLBACK',
  detail = 'rollback successful insert';
END
$$;


ALTER FUNCTION storage.can_insert_object(bucketid text, name text, owner uuid, metadata jsonb) OWNER TO supabase_storage_admin;

--
-- Name: delete_leaf_prefixes(text[], text[]); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.delete_leaf_prefixes(bucket_ids text[], names text[]) RETURNS void
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
DECLARE
    v_rows_deleted integer;
BEGIN
    LOOP
        WITH candidates AS (
            SELECT DISTINCT
                t.bucket_id,
                unnest(storage.get_prefixes(t.name)) AS name
            FROM unnest(bucket_ids, names) AS t(bucket_id, name)
        ),
        uniq AS (
             SELECT
                 bucket_id,
                 name,
                 storage.get_level(name) AS level
             FROM candidates
             WHERE name <> ''
             GROUP BY bucket_id, name
        ),
        leaf AS (
             SELECT
                 p.bucket_id,
                 p.name,
                 p.level
             FROM storage.prefixes AS p
                  JOIN uniq AS u
                       ON u.bucket_id = p.bucket_id
                           AND u.name = p.name
                           AND u.level = p.level
             WHERE NOT EXISTS (
                 SELECT 1
                 FROM storage.objects AS o
                 WHERE o.bucket_id = p.bucket_id
                   AND o.level = p.level + 1
                   AND o.name COLLATE "C" LIKE p.name || '/%'
             )
             AND NOT EXISTS (
                 SELECT 1
                 FROM storage.prefixes AS c
                 WHERE c.bucket_id = p.bucket_id
                   AND c.level = p.level + 1
                   AND c.name COLLATE "C" LIKE p.name || '/%'
             )
        )
        DELETE
        FROM storage.prefixes AS p
            USING leaf AS l
        WHERE p.bucket_id = l.bucket_id
          AND p.name = l.name
          AND p.level = l.level;

        GET DIAGNOSTICS v_rows_deleted = ROW_COUNT;
        EXIT WHEN v_rows_deleted = 0;
    END LOOP;
END;
$$;


ALTER FUNCTION storage.delete_leaf_prefixes(bucket_ids text[], names text[]) OWNER TO supabase_storage_admin;

--
-- Name: delete_prefix(text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.delete_prefix(_bucket_id text, _name text) RETURNS boolean
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
BEGIN
    -- Check if we can delete the prefix
    IF EXISTS(
        SELECT FROM "storage"."prefixes"
        WHERE "prefixes"."bucket_id" = "_bucket_id"
          AND level = "storage"."get_level"("_name") + 1
          AND "prefixes"."name" COLLATE "C" LIKE "_name" || '/%'
        LIMIT 1
    )
    OR EXISTS(
        SELECT FROM "storage"."objects"
        WHERE "objects"."bucket_id" = "_bucket_id"
          AND "storage"."get_level"("objects"."name") = "storage"."get_level"("_name") + 1
          AND "objects"."name" COLLATE "C" LIKE "_name" || '/%'
        LIMIT 1
    ) THEN
    -- There are sub-objects, skip deletion
    RETURN false;
    ELSE
        DELETE FROM "storage"."prefixes"
        WHERE "prefixes"."bucket_id" = "_bucket_id"
          AND level = "storage"."get_level"("_name")
          AND "prefixes"."name" = "_name";
        RETURN true;
    END IF;
END;
$$;


ALTER FUNCTION storage.delete_prefix(_bucket_id text, _name text) OWNER TO supabase_storage_admin;

--
-- Name: delete_prefix_hierarchy_trigger(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.delete_prefix_hierarchy_trigger() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    prefix text;
BEGIN
    prefix := "storage"."get_prefix"(OLD."name");

    IF coalesce(prefix, '') != '' THEN
        PERFORM "storage"."delete_prefix"(OLD."bucket_id", prefix);
    END IF;

    RETURN OLD;
END;
$$;


ALTER FUNCTION storage.delete_prefix_hierarchy_trigger() OWNER TO supabase_storage_admin;

--
-- Name: enforce_bucket_name_length(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.enforce_bucket_name_length() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin
    if length(new.name) > 100 then
        raise exception 'bucket name "%" is too long (% characters). Max is 100.', new.name, length(new.name);
    end if;
    return new;
end;
$$;


ALTER FUNCTION storage.enforce_bucket_name_length() OWNER TO supabase_storage_admin;

--
-- Name: extension(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.extension(name text) RETURNS text
    LANGUAGE plpgsql IMMUTABLE
    AS $$
DECLARE
    _parts text[];
    _filename text;
BEGIN
    SELECT string_to_array(name, '/') INTO _parts;
    SELECT _parts[array_length(_parts,1)] INTO _filename;
    RETURN reverse(split_part(reverse(_filename), '.', 1));
END
$$;


ALTER FUNCTION storage.extension(name text) OWNER TO supabase_storage_admin;

--
-- Name: filename(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.filename(name text) RETURNS text
    LANGUAGE plpgsql
    AS $$
DECLARE
_parts text[];
BEGIN
	select string_to_array(name, '/') into _parts;
	return _parts[array_length(_parts,1)];
END
$$;


ALTER FUNCTION storage.filename(name text) OWNER TO supabase_storage_admin;

--
-- Name: foldername(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.foldername(name text) RETURNS text[]
    LANGUAGE plpgsql IMMUTABLE
    AS $$
DECLARE
    _parts text[];
BEGIN
    -- Split on "/" to get path segments
    SELECT string_to_array(name, '/') INTO _parts;
    -- Return everything except the last segment
    RETURN _parts[1 : array_length(_parts,1) - 1];
END
$$;


ALTER FUNCTION storage.foldername(name text) OWNER TO supabase_storage_admin;

--
-- Name: get_level(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.get_level(name text) RETURNS integer
    LANGUAGE sql IMMUTABLE STRICT
    AS $$
SELECT array_length(string_to_array("name", '/'), 1);
$$;


ALTER FUNCTION storage.get_level(name text) OWNER TO supabase_storage_admin;

--
-- Name: get_prefix(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.get_prefix(name text) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
SELECT
    CASE WHEN strpos("name", '/') > 0 THEN
             regexp_replace("name", '[\/]{1}[^\/]+\/?$', '')
         ELSE
             ''
        END;
$_$;


ALTER FUNCTION storage.get_prefix(name text) OWNER TO supabase_storage_admin;

--
-- Name: get_prefixes(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.get_prefixes(name text) RETURNS text[]
    LANGUAGE plpgsql IMMUTABLE STRICT
    AS $$
DECLARE
    parts text[];
    prefixes text[];
    prefix text;
BEGIN
    -- Split the name into parts by '/'
    parts := string_to_array("name", '/');
    prefixes := '{}';

    -- Construct the prefixes, stopping one level below the last part
    FOR i IN 1..array_length(parts, 1) - 1 LOOP
            prefix := array_to_string(parts[1:i], '/');
            prefixes := array_append(prefixes, prefix);
    END LOOP;

    RETURN prefixes;
END;
$$;


ALTER FUNCTION storage.get_prefixes(name text) OWNER TO supabase_storage_admin;

--
-- Name: get_size_by_bucket(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.get_size_by_bucket() RETURNS TABLE(size bigint, bucket_id text)
    LANGUAGE plpgsql STABLE
    AS $$
BEGIN
    return query
        select sum((metadata->>'size')::bigint) as size, obj.bucket_id
        from "storage".objects as obj
        group by obj.bucket_id;
END
$$;


ALTER FUNCTION storage.get_size_by_bucket() OWNER TO supabase_storage_admin;

--
-- Name: list_multipart_uploads_with_delimiter(text, text, text, integer, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.list_multipart_uploads_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer DEFAULT 100, next_key_token text DEFAULT ''::text, next_upload_token text DEFAULT ''::text) RETURNS TABLE(key text, id text, created_at timestamp with time zone)
    LANGUAGE plpgsql
    AS $_$
BEGIN
    RETURN QUERY EXECUTE
        'SELECT DISTINCT ON(key COLLATE "C") * from (
            SELECT
                CASE
                    WHEN position($2 IN substring(key from length($1) + 1)) > 0 THEN
                        substring(key from 1 for length($1) + position($2 IN substring(key from length($1) + 1)))
                    ELSE
                        key
                END AS key, id, created_at
            FROM
                storage.s3_multipart_uploads
            WHERE
                bucket_id = $5 AND
                key ILIKE $1 || ''%'' AND
                CASE
                    WHEN $4 != '''' AND $6 = '''' THEN
                        CASE
                            WHEN position($2 IN substring(key from length($1) + 1)) > 0 THEN
                                substring(key from 1 for length($1) + position($2 IN substring(key from length($1) + 1))) COLLATE "C" > $4
                            ELSE
                                key COLLATE "C" > $4
                            END
                    ELSE
                        true
                END AND
                CASE
                    WHEN $6 != '''' THEN
                        id COLLATE "C" > $6
                    ELSE
                        true
                    END
            ORDER BY
                key COLLATE "C" ASC, created_at ASC) as e order by key COLLATE "C" LIMIT $3'
        USING prefix_param, delimiter_param, max_keys, next_key_token, bucket_id, next_upload_token;
END;
$_$;


ALTER FUNCTION storage.list_multipart_uploads_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer, next_key_token text, next_upload_token text) OWNER TO supabase_storage_admin;

--
-- Name: list_objects_with_delimiter(text, text, text, integer, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.list_objects_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer DEFAULT 100, start_after text DEFAULT ''::text, next_token text DEFAULT ''::text) RETURNS TABLE(name text, id uuid, metadata jsonb, updated_at timestamp with time zone)
    LANGUAGE plpgsql
    AS $_$
BEGIN
    RETURN QUERY EXECUTE
        'SELECT DISTINCT ON(name COLLATE "C") * from (
            SELECT
                CASE
                    WHEN position($2 IN substring(name from length($1) + 1)) > 0 THEN
                        substring(name from 1 for length($1) + position($2 IN substring(name from length($1) + 1)))
                    ELSE
                        name
                END AS name, id, metadata, updated_at
            FROM
                storage.objects
            WHERE
                bucket_id = $5 AND
                name ILIKE $1 || ''%'' AND
                CASE
                    WHEN $6 != '''' THEN
                    name COLLATE "C" > $6
                ELSE true END
                AND CASE
                    WHEN $4 != '''' THEN
                        CASE
                            WHEN position($2 IN substring(name from length($1) + 1)) > 0 THEN
                                substring(name from 1 for length($1) + position($2 IN substring(name from length($1) + 1))) COLLATE "C" > $4
                            ELSE
                                name COLLATE "C" > $4
                            END
                    ELSE
                        true
                END
            ORDER BY
                name COLLATE "C" ASC) as e order by name COLLATE "C" LIMIT $3'
        USING prefix_param, delimiter_param, max_keys, next_token, bucket_id, start_after;
END;
$_$;


ALTER FUNCTION storage.list_objects_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer, start_after text, next_token text) OWNER TO supabase_storage_admin;

--
-- Name: lock_top_prefixes(text[], text[]); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.lock_top_prefixes(bucket_ids text[], names text[]) RETURNS void
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
DECLARE
    v_bucket text;
    v_top text;
BEGIN
    FOR v_bucket, v_top IN
        SELECT DISTINCT t.bucket_id,
            split_part(t.name, '/', 1) AS top
        FROM unnest(bucket_ids, names) AS t(bucket_id, name)
        WHERE t.name <> ''
        ORDER BY 1, 2
        LOOP
            PERFORM pg_advisory_xact_lock(hashtextextended(v_bucket || '/' || v_top, 0));
        END LOOP;
END;
$$;


ALTER FUNCTION storage.lock_top_prefixes(bucket_ids text[], names text[]) OWNER TO supabase_storage_admin;

--
-- Name: objects_delete_cleanup(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.objects_delete_cleanup() RETURNS trigger
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
DECLARE
    v_bucket_ids text[];
    v_names      text[];
BEGIN
    IF current_setting('storage.gc.prefixes', true) = '1' THEN
        RETURN NULL;
    END IF;

    PERFORM set_config('storage.gc.prefixes', '1', true);

    SELECT COALESCE(array_agg(d.bucket_id), '{}'),
           COALESCE(array_agg(d.name), '{}')
    INTO v_bucket_ids, v_names
    FROM deleted AS d
    WHERE d.name <> '';

    PERFORM storage.lock_top_prefixes(v_bucket_ids, v_names);
    PERFORM storage.delete_leaf_prefixes(v_bucket_ids, v_names);

    RETURN NULL;
END;
$$;


ALTER FUNCTION storage.objects_delete_cleanup() OWNER TO supabase_storage_admin;

--
-- Name: objects_insert_prefix_trigger(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.objects_insert_prefix_trigger() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    PERFORM "storage"."add_prefixes"(NEW."bucket_id", NEW."name");
    NEW.level := "storage"."get_level"(NEW."name");

    RETURN NEW;
END;
$$;


ALTER FUNCTION storage.objects_insert_prefix_trigger() OWNER TO supabase_storage_admin;

--
-- Name: objects_update_cleanup(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.objects_update_cleanup() RETURNS trigger
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
DECLARE
    -- NEW - OLD (destinations to create prefixes for)
    v_add_bucket_ids text[];
    v_add_names      text[];

    -- OLD - NEW (sources to prune)
    v_src_bucket_ids text[];
    v_src_names      text[];
BEGIN
    IF TG_OP <> 'UPDATE' THEN
        RETURN NULL;
    END IF;

    -- 1) Compute NEW−OLD (added paths) and OLD−NEW (moved-away paths)
    WITH added AS (
        SELECT n.bucket_id, n.name
        FROM new_rows n
        WHERE n.name <> '' AND position('/' in n.name) > 0
        EXCEPT
        SELECT o.bucket_id, o.name FROM old_rows o WHERE o.name <> ''
    ),
    moved AS (
         SELECT o.bucket_id, o.name
         FROM old_rows o
         WHERE o.name <> ''
         EXCEPT
         SELECT n.bucket_id, n.name FROM new_rows n WHERE n.name <> ''
    )
    SELECT
        -- arrays for ADDED (dest) in stable order
        COALESCE( (SELECT array_agg(a.bucket_id ORDER BY a.bucket_id, a.name) FROM added a), '{}' ),
        COALESCE( (SELECT array_agg(a.name      ORDER BY a.bucket_id, a.name) FROM added a), '{}' ),
        -- arrays for MOVED (src) in stable order
        COALESCE( (SELECT array_agg(m.bucket_id ORDER BY m.bucket_id, m.name) FROM moved m), '{}' ),
        COALESCE( (SELECT array_agg(m.name      ORDER BY m.bucket_id, m.name) FROM moved m), '{}' )
    INTO v_add_bucket_ids, v_add_names, v_src_bucket_ids, v_src_names;

    -- Nothing to do?
    IF (array_length(v_add_bucket_ids, 1) IS NULL) AND (array_length(v_src_bucket_ids, 1) IS NULL) THEN
        RETURN NULL;
    END IF;

    -- 2) Take per-(bucket, top) locks: ALL prefixes in consistent global order to prevent deadlocks
    DECLARE
        v_all_bucket_ids text[];
        v_all_names text[];
    BEGIN
        -- Combine source and destination arrays for consistent lock ordering
        v_all_bucket_ids := COALESCE(v_src_bucket_ids, '{}') || COALESCE(v_add_bucket_ids, '{}');
        v_all_names := COALESCE(v_src_names, '{}') || COALESCE(v_add_names, '{}');

        -- Single lock call ensures consistent global ordering across all transactions
        IF array_length(v_all_bucket_ids, 1) IS NOT NULL THEN
            PERFORM storage.lock_top_prefixes(v_all_bucket_ids, v_all_names);
        END IF;
    END;

    -- 3) Create destination prefixes (NEW−OLD) BEFORE pruning sources
    IF array_length(v_add_bucket_ids, 1) IS NOT NULL THEN
        WITH candidates AS (
            SELECT DISTINCT t.bucket_id, unnest(storage.get_prefixes(t.name)) AS name
            FROM unnest(v_add_bucket_ids, v_add_names) AS t(bucket_id, name)
            WHERE name <> ''
        )
        INSERT INTO storage.prefixes (bucket_id, name)
        SELECT c.bucket_id, c.name
        FROM candidates c
        ON CONFLICT DO NOTHING;
    END IF;

    -- 4) Prune source prefixes bottom-up for OLD−NEW
    IF array_length(v_src_bucket_ids, 1) IS NOT NULL THEN
        -- re-entrancy guard so DELETE on prefixes won't recurse
        IF current_setting('storage.gc.prefixes', true) <> '1' THEN
            PERFORM set_config('storage.gc.prefixes', '1', true);
        END IF;

        PERFORM storage.delete_leaf_prefixes(v_src_bucket_ids, v_src_names);
    END IF;

    RETURN NULL;
END;
$$;


ALTER FUNCTION storage.objects_update_cleanup() OWNER TO supabase_storage_admin;

--
-- Name: objects_update_level_trigger(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.objects_update_level_trigger() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    -- Ensure this is an update operation and the name has changed
    IF TG_OP = 'UPDATE' AND (NEW."name" <> OLD."name" OR NEW."bucket_id" <> OLD."bucket_id") THEN
        -- Set the new level
        NEW."level" := "storage"."get_level"(NEW."name");
    END IF;
    RETURN NEW;
END;
$$;


ALTER FUNCTION storage.objects_update_level_trigger() OWNER TO supabase_storage_admin;

--
-- Name: objects_update_prefix_trigger(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.objects_update_prefix_trigger() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    old_prefixes TEXT[];
BEGIN
    -- Ensure this is an update operation and the name has changed
    IF TG_OP = 'UPDATE' AND (NEW."name" <> OLD."name" OR NEW."bucket_id" <> OLD."bucket_id") THEN
        -- Retrieve old prefixes
        old_prefixes := "storage"."get_prefixes"(OLD."name");

        -- Remove old prefixes that are only used by this object
        WITH all_prefixes as (
            SELECT unnest(old_prefixes) as prefix
        ),
        can_delete_prefixes as (
             SELECT prefix
             FROM all_prefixes
             WHERE NOT EXISTS (
                 SELECT 1 FROM "storage"."objects"
                 WHERE "bucket_id" = OLD."bucket_id"
                   AND "name" <> OLD."name"
                   AND "name" LIKE (prefix || '%')
             )
         )
        DELETE FROM "storage"."prefixes" WHERE name IN (SELECT prefix FROM can_delete_prefixes);

        -- Add new prefixes
        PERFORM "storage"."add_prefixes"(NEW."bucket_id", NEW."name");
    END IF;
    -- Set the new level
    NEW."level" := "storage"."get_level"(NEW."name");

    RETURN NEW;
END;
$$;


ALTER FUNCTION storage.objects_update_prefix_trigger() OWNER TO supabase_storage_admin;

--
-- Name: operation(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.operation() RETURNS text
    LANGUAGE plpgsql STABLE
    AS $$
BEGIN
    RETURN current_setting('storage.operation', true);
END;
$$;


ALTER FUNCTION storage.operation() OWNER TO supabase_storage_admin;

--
-- Name: prefixes_delete_cleanup(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.prefixes_delete_cleanup() RETURNS trigger
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
DECLARE
    v_bucket_ids text[];
    v_names      text[];
BEGIN
    IF current_setting('storage.gc.prefixes', true) = '1' THEN
        RETURN NULL;
    END IF;

    PERFORM set_config('storage.gc.prefixes', '1', true);

    SELECT COALESCE(array_agg(d.bucket_id), '{}'),
           COALESCE(array_agg(d.name), '{}')
    INTO v_bucket_ids, v_names
    FROM deleted AS d
    WHERE d.name <> '';

    PERFORM storage.lock_top_prefixes(v_bucket_ids, v_names);
    PERFORM storage.delete_leaf_prefixes(v_bucket_ids, v_names);

    RETURN NULL;
END;
$$;


ALTER FUNCTION storage.prefixes_delete_cleanup() OWNER TO supabase_storage_admin;

--
-- Name: prefixes_insert_trigger(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.prefixes_insert_trigger() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    PERFORM "storage"."add_prefixes"(NEW."bucket_id", NEW."name");
    RETURN NEW;
END;
$$;


ALTER FUNCTION storage.prefixes_insert_trigger() OWNER TO supabase_storage_admin;

--
-- Name: search(text, text, integer, integer, integer, text, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.search(prefix text, bucketname text, limits integer DEFAULT 100, levels integer DEFAULT 1, offsets integer DEFAULT 0, search text DEFAULT ''::text, sortcolumn text DEFAULT 'name'::text, sortorder text DEFAULT 'asc'::text) RETURNS TABLE(name text, id uuid, updated_at timestamp with time zone, created_at timestamp with time zone, last_accessed_at timestamp with time zone, metadata jsonb)
    LANGUAGE plpgsql
    AS $$
declare
    can_bypass_rls BOOLEAN;
begin
    SELECT rolbypassrls
    INTO can_bypass_rls
    FROM pg_roles
    WHERE rolname = coalesce(nullif(current_setting('role', true), 'none'), current_user);

    IF can_bypass_rls THEN
        RETURN QUERY SELECT * FROM storage.search_v1_optimised(prefix, bucketname, limits, levels, offsets, search, sortcolumn, sortorder);
    ELSE
        RETURN QUERY SELECT * FROM storage.search_legacy_v1(prefix, bucketname, limits, levels, offsets, search, sortcolumn, sortorder);
    END IF;
end;
$$;


ALTER FUNCTION storage.search(prefix text, bucketname text, limits integer, levels integer, offsets integer, search text, sortcolumn text, sortorder text) OWNER TO supabase_storage_admin;

--
-- Name: search_legacy_v1(text, text, integer, integer, integer, text, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.search_legacy_v1(prefix text, bucketname text, limits integer DEFAULT 100, levels integer DEFAULT 1, offsets integer DEFAULT 0, search text DEFAULT ''::text, sortcolumn text DEFAULT 'name'::text, sortorder text DEFAULT 'asc'::text) RETURNS TABLE(name text, id uuid, updated_at timestamp with time zone, created_at timestamp with time zone, last_accessed_at timestamp with time zone, metadata jsonb)
    LANGUAGE plpgsql STABLE
    AS $_$
declare
    v_order_by text;
    v_sort_order text;
begin
    case
        when sortcolumn = 'name' then
            v_order_by = 'name';
        when sortcolumn = 'updated_at' then
            v_order_by = 'updated_at';
        when sortcolumn = 'created_at' then
            v_order_by = 'created_at';
        when sortcolumn = 'last_accessed_at' then
            v_order_by = 'last_accessed_at';
        else
            v_order_by = 'name';
        end case;

    case
        when sortorder = 'asc' then
            v_sort_order = 'asc';
        when sortorder = 'desc' then
            v_sort_order = 'desc';
        else
            v_sort_order = 'asc';
        end case;

    v_order_by = v_order_by || ' ' || v_sort_order;

    return query execute
        'with folders as (
           select path_tokens[$1] as folder
           from storage.objects
             where objects.name ilike $2 || $3 || ''%''
               and bucket_id = $4
               and array_length(objects.path_tokens, 1) <> $1
           group by folder
           order by folder ' || v_sort_order || '
     )
     (select folder as "name",
            null as id,
            null as updated_at,
            null as created_at,
            null as last_accessed_at,
            null as metadata from folders)
     union all
     (select path_tokens[$1] as "name",
            id,
            updated_at,
            created_at,
            last_accessed_at,
            metadata
     from storage.objects
     where objects.name ilike $2 || $3 || ''%''
       and bucket_id = $4
       and array_length(objects.path_tokens, 1) = $1
     order by ' || v_order_by || ')
     limit $5
     offset $6' using levels, prefix, search, bucketname, limits, offsets;
end;
$_$;


ALTER FUNCTION storage.search_legacy_v1(prefix text, bucketname text, limits integer, levels integer, offsets integer, search text, sortcolumn text, sortorder text) OWNER TO supabase_storage_admin;

--
-- Name: search_v1_optimised(text, text, integer, integer, integer, text, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.search_v1_optimised(prefix text, bucketname text, limits integer DEFAULT 100, levels integer DEFAULT 1, offsets integer DEFAULT 0, search text DEFAULT ''::text, sortcolumn text DEFAULT 'name'::text, sortorder text DEFAULT 'asc'::text) RETURNS TABLE(name text, id uuid, updated_at timestamp with time zone, created_at timestamp with time zone, last_accessed_at timestamp with time zone, metadata jsonb)
    LANGUAGE plpgsql STABLE
    AS $_$
declare
    v_order_by text;
    v_sort_order text;
begin
    case
        when sortcolumn = 'name' then
            v_order_by = 'name';
        when sortcolumn = 'updated_at' then
            v_order_by = 'updated_at';
        when sortcolumn = 'created_at' then
            v_order_by = 'created_at';
        when sortcolumn = 'last_accessed_at' then
            v_order_by = 'last_accessed_at';
        else
            v_order_by = 'name';
        end case;

    case
        when sortorder = 'asc' then
            v_sort_order = 'asc';
        when sortorder = 'desc' then
            v_sort_order = 'desc';
        else
            v_sort_order = 'asc';
        end case;

    v_order_by = v_order_by || ' ' || v_sort_order;

    return query execute
        'with folders as (
           select (string_to_array(name, ''/''))[level] as name
           from storage.prefixes
             where lower(prefixes.name) like lower($2 || $3) || ''%''
               and bucket_id = $4
               and level = $1
           order by name ' || v_sort_order || '
     )
     (select name,
            null as id,
            null as updated_at,
            null as created_at,
            null as last_accessed_at,
            null as metadata from folders)
     union all
     (select path_tokens[level] as "name",
            id,
            updated_at,
            created_at,
            last_accessed_at,
            metadata
     from storage.objects
     where lower(objects.name) like lower($2 || $3) || ''%''
       and bucket_id = $4
       and level = $1
     order by ' || v_order_by || ')
     limit $5
     offset $6' using levels, prefix, search, bucketname, limits, offsets;
end;
$_$;


ALTER FUNCTION storage.search_v1_optimised(prefix text, bucketname text, limits integer, levels integer, offsets integer, search text, sortcolumn text, sortorder text) OWNER TO supabase_storage_admin;

--
-- Name: search_v2(text, text, integer, integer, text, text, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.search_v2(prefix text, bucket_name text, limits integer DEFAULT 100, levels integer DEFAULT 1, start_after text DEFAULT ''::text, sort_order text DEFAULT 'asc'::text, sort_column text DEFAULT 'name'::text, sort_column_after text DEFAULT ''::text) RETURNS TABLE(key text, name text, id uuid, updated_at timestamp with time zone, created_at timestamp with time zone, last_accessed_at timestamp with time zone, metadata jsonb)
    LANGUAGE plpgsql STABLE
    AS $_$
DECLARE
    sort_col text;
    sort_ord text;
    cursor_op text;
    cursor_expr text;
    sort_expr text;
BEGIN
    -- Validate sort_order
    sort_ord := lower(sort_order);
    IF sort_ord NOT IN ('asc', 'desc') THEN
        sort_ord := 'asc';
    END IF;

    -- Determine cursor comparison operator
    IF sort_ord = 'asc' THEN
        cursor_op := '>';
    ELSE
        cursor_op := '<';
    END IF;
    
    sort_col := lower(sort_column);
    -- Validate sort column  
    IF sort_col IN ('updated_at', 'created_at') THEN
        cursor_expr := format(
            '($5 = '''' OR ROW(date_trunc(''milliseconds'', %I), name COLLATE "C") %s ROW(COALESCE(NULLIF($6, '''')::timestamptz, ''epoch''::timestamptz), $5))',
            sort_col, cursor_op
        );
        sort_expr := format(
            'COALESCE(date_trunc(''milliseconds'', %I), ''epoch''::timestamptz) %s, name COLLATE "C" %s',
            sort_col, sort_ord, sort_ord
        );
    ELSE
        cursor_expr := format('($5 = '''' OR name COLLATE "C" %s $5)', cursor_op);
        sort_expr := format('name COLLATE "C" %s', sort_ord);
    END IF;

    RETURN QUERY EXECUTE format(
        $sql$
        SELECT * FROM (
            (
                SELECT
                    split_part(name, '/', $4) AS key,
                    name,
                    NULL::uuid AS id,
                    updated_at,
                    created_at,
                    NULL::timestamptz AS last_accessed_at,
                    NULL::jsonb AS metadata
                FROM storage.prefixes
                WHERE name COLLATE "C" LIKE $1 || '%%'
                    AND bucket_id = $2
                    AND level = $4
                    AND %s
                ORDER BY %s
                LIMIT $3
            )
            UNION ALL
            (
                SELECT
                    split_part(name, '/', $4) AS key,
                    name,
                    id,
                    updated_at,
                    created_at,
                    last_accessed_at,
                    metadata
                FROM storage.objects
                WHERE name COLLATE "C" LIKE $1 || '%%'
                    AND bucket_id = $2
                    AND level = $4
                    AND %s
                ORDER BY %s
                LIMIT $3
            )
        ) obj
        ORDER BY %s
        LIMIT $3
        $sql$,
        cursor_expr,    -- prefixes WHERE
        sort_expr,      -- prefixes ORDER BY
        cursor_expr,    -- objects WHERE
        sort_expr,      -- objects ORDER BY
        sort_expr       -- final ORDER BY
    )
    USING prefix, bucket_name, limits, levels, start_after, sort_column_after;
END;
$_$;


ALTER FUNCTION storage.search_v2(prefix text, bucket_name text, limits integer, levels integer, start_after text, sort_order text, sort_column text, sort_column_after text) OWNER TO supabase_storage_admin;

--
-- Name: update_updated_at_column(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.update_updated_at_column() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    NEW.updated_at = now();
    RETURN NEW; 
END;
$$;


ALTER FUNCTION storage.update_updated_at_column() OWNER TO supabase_storage_admin;

--
-- Name: http_request(); Type: FUNCTION; Schema: supabase_functions; Owner: supabase_functions_admin
--

CREATE FUNCTION supabase_functions.http_request() RETURNS trigger
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'supabase_functions'
    AS $$
    DECLARE
      request_id bigint;
      payload jsonb;
      url text := TG_ARGV[0]::text;
      method text := TG_ARGV[1]::text;
      headers jsonb DEFAULT '{}'::jsonb;
      params jsonb DEFAULT '{}'::jsonb;
      timeout_ms integer DEFAULT 1000;
    BEGIN
      IF url IS NULL OR url = 'null' THEN
        RAISE EXCEPTION 'url argument is missing';
      END IF;

      IF method IS NULL OR method = 'null' THEN
        RAISE EXCEPTION 'method argument is missing';
      END IF;

      IF TG_ARGV[2] IS NULL OR TG_ARGV[2] = 'null' THEN
        headers = '{"Content-Type": "application/json"}'::jsonb;
      ELSE
        headers = TG_ARGV[2]::jsonb;
      END IF;

      IF TG_ARGV[3] IS NULL OR TG_ARGV[3] = 'null' THEN
        params = '{}'::jsonb;
      ELSE
        params = TG_ARGV[3]::jsonb;
      END IF;

      IF TG_ARGV[4] IS NULL OR TG_ARGV[4] = 'null' THEN
        timeout_ms = 1000;
      ELSE
        timeout_ms = TG_ARGV[4]::integer;
      END IF;

      CASE
        WHEN method = 'GET' THEN
          SELECT http_get INTO request_id FROM net.http_get(
            url,
            params,
            headers,
            timeout_ms
          );
        WHEN method = 'POST' THEN
          payload = jsonb_build_object(
            'old_record', OLD,
            'record', NEW,
            'type', TG_OP,
            'table', TG_TABLE_NAME,
            'schema', TG_TABLE_SCHEMA
          );

          SELECT http_post INTO request_id FROM net.http_post(
            url,
            payload,
            params,
            headers,
            timeout_ms
          );
        ELSE
          RAISE EXCEPTION 'method argument % is invalid', method;
      END CASE;

      INSERT INTO supabase_functions.hooks
        (hook_table_id, hook_name, request_id)
      VALUES
        (TG_RELID, TG_NAME, request_id);

      RETURN NEW;
    END
  $$;


ALTER FUNCTION supabase_functions.http_request() OWNER TO supabase_functions_admin;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: audit_log_entries; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.audit_log_entries (
    instance_id uuid,
    id uuid NOT NULL,
    payload json,
    created_at timestamp with time zone,
    ip_address character varying(64) DEFAULT ''::character varying NOT NULL
);


ALTER TABLE auth.audit_log_entries OWNER TO supabase_auth_admin;

--
-- Name: TABLE audit_log_entries; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.audit_log_entries IS 'Auth: Audit trail for user actions.';


--
-- Name: flow_state; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.flow_state (
    id uuid NOT NULL,
    user_id uuid,
    auth_code text NOT NULL,
    code_challenge_method auth.code_challenge_method NOT NULL,
    code_challenge text NOT NULL,
    provider_type text NOT NULL,
    provider_access_token text,
    provider_refresh_token text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    authentication_method text NOT NULL,
    auth_code_issued_at timestamp with time zone
);


ALTER TABLE auth.flow_state OWNER TO supabase_auth_admin;

--
-- Name: TABLE flow_state; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.flow_state IS 'stores metadata for pkce logins';


--
-- Name: identities; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.identities (
    provider_id text NOT NULL,
    user_id uuid NOT NULL,
    identity_data jsonb NOT NULL,
    provider text NOT NULL,
    last_sign_in_at timestamp with time zone,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    email text GENERATED ALWAYS AS (lower((identity_data ->> 'email'::text))) STORED,
    id uuid DEFAULT gen_random_uuid() NOT NULL
);


ALTER TABLE auth.identities OWNER TO supabase_auth_admin;

--
-- Name: TABLE identities; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.identities IS 'Auth: Stores identities associated to a user.';


--
-- Name: COLUMN identities.email; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.identities.email IS 'Auth: Email is a generated column that references the optional email property in the identity_data';


--
-- Name: instances; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.instances (
    id uuid NOT NULL,
    uuid uuid,
    raw_base_config text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE auth.instances OWNER TO supabase_auth_admin;

--
-- Name: TABLE instances; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.instances IS 'Auth: Manages users across multiple sites.';


--
-- Name: mfa_amr_claims; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.mfa_amr_claims (
    session_id uuid NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    authentication_method text NOT NULL,
    id uuid NOT NULL
);


ALTER TABLE auth.mfa_amr_claims OWNER TO supabase_auth_admin;

--
-- Name: TABLE mfa_amr_claims; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.mfa_amr_claims IS 'auth: stores authenticator method reference claims for multi factor authentication';


--
-- Name: mfa_challenges; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.mfa_challenges (
    id uuid NOT NULL,
    factor_id uuid NOT NULL,
    created_at timestamp with time zone NOT NULL,
    verified_at timestamp with time zone,
    ip_address inet NOT NULL,
    otp_code text,
    web_authn_session_data jsonb
);


ALTER TABLE auth.mfa_challenges OWNER TO supabase_auth_admin;

--
-- Name: TABLE mfa_challenges; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.mfa_challenges IS 'auth: stores metadata about challenge requests made';


--
-- Name: mfa_factors; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.mfa_factors (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    friendly_name text,
    factor_type auth.factor_type NOT NULL,
    status auth.factor_status NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    secret text,
    phone text,
    last_challenged_at timestamp with time zone,
    web_authn_credential jsonb,
    web_authn_aaguid uuid
);


ALTER TABLE auth.mfa_factors OWNER TO supabase_auth_admin;

--
-- Name: TABLE mfa_factors; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.mfa_factors IS 'auth: stores metadata about factors';


--
-- Name: oauth_authorizations; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.oauth_authorizations (
    id uuid NOT NULL,
    authorization_id text NOT NULL,
    client_id uuid NOT NULL,
    user_id uuid,
    redirect_uri text NOT NULL,
    scope text NOT NULL,
    state text,
    resource text,
    code_challenge text,
    code_challenge_method auth.code_challenge_method,
    response_type auth.oauth_response_type DEFAULT 'code'::auth.oauth_response_type NOT NULL,
    status auth.oauth_authorization_status DEFAULT 'pending'::auth.oauth_authorization_status NOT NULL,
    authorization_code text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    expires_at timestamp with time zone DEFAULT (now() + '00:03:00'::interval) NOT NULL,
    approved_at timestamp with time zone,
    CONSTRAINT oauth_authorizations_authorization_code_length CHECK ((char_length(authorization_code) <= 255)),
    CONSTRAINT oauth_authorizations_code_challenge_length CHECK ((char_length(code_challenge) <= 128)),
    CONSTRAINT oauth_authorizations_expires_at_future CHECK ((expires_at > created_at)),
    CONSTRAINT oauth_authorizations_redirect_uri_length CHECK ((char_length(redirect_uri) <= 2048)),
    CONSTRAINT oauth_authorizations_resource_length CHECK ((char_length(resource) <= 2048)),
    CONSTRAINT oauth_authorizations_scope_length CHECK ((char_length(scope) <= 4096)),
    CONSTRAINT oauth_authorizations_state_length CHECK ((char_length(state) <= 4096))
);


ALTER TABLE auth.oauth_authorizations OWNER TO supabase_auth_admin;

--
-- Name: oauth_clients; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.oauth_clients (
    id uuid NOT NULL,
    client_secret_hash text,
    registration_type auth.oauth_registration_type NOT NULL,
    redirect_uris text NOT NULL,
    grant_types text NOT NULL,
    client_name text,
    client_uri text,
    logo_uri text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    client_type auth.oauth_client_type DEFAULT 'confidential'::auth.oauth_client_type NOT NULL,
    CONSTRAINT oauth_clients_client_name_length CHECK ((char_length(client_name) <= 1024)),
    CONSTRAINT oauth_clients_client_uri_length CHECK ((char_length(client_uri) <= 2048)),
    CONSTRAINT oauth_clients_logo_uri_length CHECK ((char_length(logo_uri) <= 2048))
);


ALTER TABLE auth.oauth_clients OWNER TO supabase_auth_admin;

--
-- Name: oauth_consents; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.oauth_consents (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    client_id uuid NOT NULL,
    scopes text NOT NULL,
    granted_at timestamp with time zone DEFAULT now() NOT NULL,
    revoked_at timestamp with time zone,
    CONSTRAINT oauth_consents_revoked_after_granted CHECK (((revoked_at IS NULL) OR (revoked_at >= granted_at))),
    CONSTRAINT oauth_consents_scopes_length CHECK ((char_length(scopes) <= 2048)),
    CONSTRAINT oauth_consents_scopes_not_empty CHECK ((char_length(TRIM(BOTH FROM scopes)) > 0))
);


ALTER TABLE auth.oauth_consents OWNER TO supabase_auth_admin;

--
-- Name: one_time_tokens; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.one_time_tokens (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    token_type auth.one_time_token_type NOT NULL,
    token_hash text NOT NULL,
    relates_to text NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    CONSTRAINT one_time_tokens_token_hash_check CHECK ((char_length(token_hash) > 0))
);


ALTER TABLE auth.one_time_tokens OWNER TO supabase_auth_admin;

--
-- Name: refresh_tokens; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.refresh_tokens (
    instance_id uuid,
    id bigint NOT NULL,
    token character varying(255),
    user_id character varying(255),
    revoked boolean,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    parent character varying(255),
    session_id uuid
);


ALTER TABLE auth.refresh_tokens OWNER TO supabase_auth_admin;

--
-- Name: TABLE refresh_tokens; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.refresh_tokens IS 'Auth: Store of tokens used to refresh JWT tokens once they expire.';


--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE; Schema: auth; Owner: supabase_auth_admin
--

CREATE SEQUENCE auth.refresh_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE auth.refresh_tokens_id_seq OWNER TO supabase_auth_admin;

--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: auth; Owner: supabase_auth_admin
--

ALTER SEQUENCE auth.refresh_tokens_id_seq OWNED BY auth.refresh_tokens.id;


--
-- Name: saml_providers; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.saml_providers (
    id uuid NOT NULL,
    sso_provider_id uuid NOT NULL,
    entity_id text NOT NULL,
    metadata_xml text NOT NULL,
    metadata_url text,
    attribute_mapping jsonb,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    name_id_format text,
    CONSTRAINT "entity_id not empty" CHECK ((char_length(entity_id) > 0)),
    CONSTRAINT "metadata_url not empty" CHECK (((metadata_url = NULL::text) OR (char_length(metadata_url) > 0))),
    CONSTRAINT "metadata_xml not empty" CHECK ((char_length(metadata_xml) > 0))
);


ALTER TABLE auth.saml_providers OWNER TO supabase_auth_admin;

--
-- Name: TABLE saml_providers; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.saml_providers IS 'Auth: Manages SAML Identity Provider connections.';


--
-- Name: saml_relay_states; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.saml_relay_states (
    id uuid NOT NULL,
    sso_provider_id uuid NOT NULL,
    request_id text NOT NULL,
    for_email text,
    redirect_to text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    flow_state_id uuid,
    CONSTRAINT "request_id not empty" CHECK ((char_length(request_id) > 0))
);


ALTER TABLE auth.saml_relay_states OWNER TO supabase_auth_admin;

--
-- Name: TABLE saml_relay_states; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.saml_relay_states IS 'Auth: Contains SAML Relay State information for each Service Provider initiated login.';


--
-- Name: schema_migrations; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.schema_migrations (
    version character varying(255) NOT NULL
);


ALTER TABLE auth.schema_migrations OWNER TO supabase_auth_admin;

--
-- Name: TABLE schema_migrations; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.schema_migrations IS 'Auth: Manages updates to the auth system.';


--
-- Name: sessions; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.sessions (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    factor_id uuid,
    aal auth.aal_level,
    not_after timestamp with time zone,
    refreshed_at timestamp without time zone,
    user_agent text,
    ip inet,
    tag text,
    oauth_client_id uuid
);


ALTER TABLE auth.sessions OWNER TO supabase_auth_admin;

--
-- Name: TABLE sessions; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.sessions IS 'Auth: Stores session data associated to a user.';


--
-- Name: COLUMN sessions.not_after; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.sessions.not_after IS 'Auth: Not after is a nullable column that contains a timestamp after which the session should be regarded as expired.';


--
-- Name: sso_domains; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.sso_domains (
    id uuid NOT NULL,
    sso_provider_id uuid NOT NULL,
    domain text NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    CONSTRAINT "domain not empty" CHECK ((char_length(domain) > 0))
);


ALTER TABLE auth.sso_domains OWNER TO supabase_auth_admin;

--
-- Name: TABLE sso_domains; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.sso_domains IS 'Auth: Manages SSO email address domain mapping to an SSO Identity Provider.';


--
-- Name: sso_providers; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.sso_providers (
    id uuid NOT NULL,
    resource_id text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    disabled boolean,
    CONSTRAINT "resource_id not empty" CHECK (((resource_id = NULL::text) OR (char_length(resource_id) > 0)))
);


ALTER TABLE auth.sso_providers OWNER TO supabase_auth_admin;

--
-- Name: TABLE sso_providers; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.sso_providers IS 'Auth: Manages SSO identity provider information; see saml_providers for SAML.';


--
-- Name: COLUMN sso_providers.resource_id; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.sso_providers.resource_id IS 'Auth: Uniquely identifies a SSO provider according to a user-chosen resource ID (case insensitive), useful in infrastructure as code.';


--
-- Name: users; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.users (
    instance_id uuid,
    id uuid NOT NULL,
    aud character varying(255),
    role character varying(255),
    email character varying(255),
    encrypted_password character varying(255),
    email_confirmed_at timestamp with time zone,
    invited_at timestamp with time zone,
    confirmation_token character varying(255),
    confirmation_sent_at timestamp with time zone,
    recovery_token character varying(255),
    recovery_sent_at timestamp with time zone,
    email_change_token_new character varying(255),
    email_change character varying(255),
    email_change_sent_at timestamp with time zone,
    last_sign_in_at timestamp with time zone,
    raw_app_meta_data jsonb,
    raw_user_meta_data jsonb,
    is_super_admin boolean,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    phone text DEFAULT NULL::character varying,
    phone_confirmed_at timestamp with time zone,
    phone_change text DEFAULT ''::character varying,
    phone_change_token character varying(255) DEFAULT ''::character varying,
    phone_change_sent_at timestamp with time zone,
    confirmed_at timestamp with time zone GENERATED ALWAYS AS (LEAST(email_confirmed_at, phone_confirmed_at)) STORED,
    email_change_token_current character varying(255) DEFAULT ''::character varying,
    email_change_confirm_status smallint DEFAULT 0,
    banned_until timestamp with time zone,
    reauthentication_token character varying(255) DEFAULT ''::character varying,
    reauthentication_sent_at timestamp with time zone,
    is_sso_user boolean DEFAULT false NOT NULL,
    deleted_at timestamp with time zone,
    is_anonymous boolean DEFAULT false NOT NULL,
    CONSTRAINT users_email_change_confirm_status_check CHECK (((email_change_confirm_status >= 0) AND (email_change_confirm_status <= 2)))
);


ALTER TABLE auth.users OWNER TO supabase_auth_admin;

--
-- Name: TABLE users; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.users IS 'Auth: Stores user login data within a secure schema.';


--
-- Name: COLUMN users.is_sso_user; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.users.is_sso_user IS 'Auth: Set this column to true when the account comes from SSO. These accounts can have duplicate emails.';


--
-- Name: conversations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.conversations (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    user_id uuid NOT NULL,
    title text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.conversations OWNER TO postgres;

--
-- Name: TABLE conversations; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.conversations IS 'Хранит метаданные о каждом диалоге в чате.';


--
-- Name: COLUMN conversations.user_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.conversations.user_id IS 'Пользователь, который инициировал диалог.';


--
-- Name: COLUMN conversations.title; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.conversations.title IS 'Заголовок диалога (например, первое сообщение пользователя).';


--
-- Name: messages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.messages (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    conversation_id uuid NOT NULL,
    user_id uuid NOT NULL,
    role public.chat_role NOT NULL,
    content text NOT NULL,
    model text,
    token_count integer,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.messages OWNER TO postgres;

--
-- Name: TABLE messages; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.messages IS 'Хранит отдельные сообщения в рамках диалога.';


--
-- Name: COLUMN messages.conversation_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.messages.conversation_id IS 'Диалог, к которому относится сообщение.';


--
-- Name: COLUMN messages.role; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.messages.role IS 'Роль отправителя сообщения.';


--
-- Name: COLUMN messages.content; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.messages.content IS 'Текстовое содержимое сообщения.';


--
-- Name: COLUMN messages.model; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.messages.model IS 'Модель ИИ, которая сгенерировала ответ.';


--
-- Name: COLUMN messages.token_count; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.messages.token_count IS 'Количество токенов, использованных в сообщении.';


--
-- Name: model_routing_config; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.model_routing_config (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    model_id text NOT NULL,
    use_openrouter boolean DEFAULT false NOT NULL,
    openrouter_model_id text,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.model_routing_config OWNER TO postgres;

--
-- Name: models; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.models (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    model_id text NOT NULL,
    display_name text NOT NULL,
    provider text NOT NULL,
    temperature real DEFAULT 0.7 NOT NULL,
    is_default_access boolean DEFAULT false NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.models OWNER TO postgres;

--
-- Name: test_table; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.test_table (
    id uuid DEFAULT extensions.uuid_generate_v4() NOT NULL,
    content text
);


ALTER TABLE public.test_table OWNER TO postgres;

--
-- Name: usage_logs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usage_logs (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    user_id uuid NOT NULL,
    model text,
    prompt_tokens integer,
    completion_tokens integer,
    total_tokens integer,
    status text,
    created_at timestamp(6) with time zone DEFAULT now() NOT NULL,
    error_details text,
    message_id uuid
);


ALTER TABLE public.usage_logs OWNER TO postgres;

--
-- Name: user_model_access; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_model_access (
    user_id uuid NOT NULL,
    model_id uuid NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.user_model_access OWNER TO postgres;

--
-- Name: user_profiles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_profiles (
    id uuid NOT NULL,
    email text,
    daily_request_limit integer DEFAULT 20 NOT NULL,
    created_at timestamp(6) with time zone DEFAULT now() NOT NULL,
    updated_at timestamp(6) with time zone DEFAULT now() NOT NULL,
    role public.user_role DEFAULT 'user'::public.user_role NOT NULL,
    display_name text
);


ALTER TABLE public.user_profiles OWNER TO postgres;

--
-- Name: messages; Type: TABLE; Schema: realtime; Owner: supabase_realtime_admin
--

CREATE TABLE realtime.messages (
    topic text NOT NULL,
    extension text NOT NULL,
    payload jsonb,
    event text,
    private boolean DEFAULT false,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    inserted_at timestamp without time zone DEFAULT now() NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL
)
PARTITION BY RANGE (inserted_at);


ALTER TABLE realtime.messages OWNER TO supabase_realtime_admin;

--
-- Name: schema_migrations; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.schema_migrations (
    version bigint NOT NULL,
    inserted_at timestamp(0) without time zone
);


ALTER TABLE realtime.schema_migrations OWNER TO supabase_admin;

--
-- Name: subscription; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.subscription (
    id bigint NOT NULL,
    subscription_id uuid NOT NULL,
    entity regclass NOT NULL,
    filters realtime.user_defined_filter[] DEFAULT '{}'::realtime.user_defined_filter[] NOT NULL,
    claims jsonb NOT NULL,
    claims_role regrole GENERATED ALWAYS AS (realtime.to_regrole((claims ->> 'role'::text))) STORED NOT NULL,
    created_at timestamp without time zone DEFAULT timezone('utc'::text, now()) NOT NULL
);


ALTER TABLE realtime.subscription OWNER TO supabase_admin;

--
-- Name: subscription_id_seq; Type: SEQUENCE; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE realtime.subscription ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME realtime.subscription_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: buckets; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.buckets (
    id text NOT NULL,
    name text NOT NULL,
    owner uuid,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    public boolean DEFAULT false,
    avif_autodetection boolean DEFAULT false,
    file_size_limit bigint,
    allowed_mime_types text[],
    owner_id text,
    type storage.buckettype DEFAULT 'STANDARD'::storage.buckettype NOT NULL
);


ALTER TABLE storage.buckets OWNER TO supabase_storage_admin;

--
-- Name: COLUMN buckets.owner; Type: COMMENT; Schema: storage; Owner: supabase_storage_admin
--

COMMENT ON COLUMN storage.buckets.owner IS 'Field is deprecated, use owner_id instead';


--
-- Name: buckets_analytics; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.buckets_analytics (
    id text NOT NULL,
    type storage.buckettype DEFAULT 'ANALYTICS'::storage.buckettype NOT NULL,
    format text DEFAULT 'ICEBERG'::text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE storage.buckets_analytics OWNER TO supabase_storage_admin;

--
-- Name: migrations; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.migrations (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    hash character varying(40) NOT NULL,
    executed_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE storage.migrations OWNER TO supabase_storage_admin;

--
-- Name: objects; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.objects (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    bucket_id text,
    name text,
    owner uuid,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    last_accessed_at timestamp with time zone DEFAULT now(),
    metadata jsonb,
    path_tokens text[] GENERATED ALWAYS AS (string_to_array(name, '/'::text)) STORED,
    version text,
    owner_id text,
    user_metadata jsonb,
    level integer
);


ALTER TABLE storage.objects OWNER TO supabase_storage_admin;

--
-- Name: COLUMN objects.owner; Type: COMMENT; Schema: storage; Owner: supabase_storage_admin
--

COMMENT ON COLUMN storage.objects.owner IS 'Field is deprecated, use owner_id instead';


--
-- Name: prefixes; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.prefixes (
    bucket_id text NOT NULL,
    name text NOT NULL COLLATE pg_catalog."C",
    level integer GENERATED ALWAYS AS (storage.get_level(name)) STORED NOT NULL,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now()
);


ALTER TABLE storage.prefixes OWNER TO supabase_storage_admin;

--
-- Name: s3_multipart_uploads; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.s3_multipart_uploads (
    id text NOT NULL,
    in_progress_size bigint DEFAULT 0 NOT NULL,
    upload_signature text NOT NULL,
    bucket_id text NOT NULL,
    key text NOT NULL COLLATE pg_catalog."C",
    version text NOT NULL,
    owner_id text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    user_metadata jsonb
);


ALTER TABLE storage.s3_multipart_uploads OWNER TO supabase_storage_admin;

--
-- Name: s3_multipart_uploads_parts; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.s3_multipart_uploads_parts (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    upload_id text NOT NULL,
    size bigint DEFAULT 0 NOT NULL,
    part_number integer NOT NULL,
    bucket_id text NOT NULL,
    key text NOT NULL COLLATE pg_catalog."C",
    etag text NOT NULL,
    owner_id text,
    version text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE storage.s3_multipart_uploads_parts OWNER TO supabase_storage_admin;

--
-- Name: hooks; Type: TABLE; Schema: supabase_functions; Owner: supabase_functions_admin
--

CREATE TABLE supabase_functions.hooks (
    id bigint NOT NULL,
    hook_table_id integer NOT NULL,
    hook_name text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    request_id bigint
);


ALTER TABLE supabase_functions.hooks OWNER TO supabase_functions_admin;

--
-- Name: TABLE hooks; Type: COMMENT; Schema: supabase_functions; Owner: supabase_functions_admin
--

COMMENT ON TABLE supabase_functions.hooks IS 'Supabase Functions Hooks: Audit trail for triggered hooks.';


--
-- Name: hooks_id_seq; Type: SEQUENCE; Schema: supabase_functions; Owner: supabase_functions_admin
--

CREATE SEQUENCE supabase_functions.hooks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE supabase_functions.hooks_id_seq OWNER TO supabase_functions_admin;

--
-- Name: hooks_id_seq; Type: SEQUENCE OWNED BY; Schema: supabase_functions; Owner: supabase_functions_admin
--

ALTER SEQUENCE supabase_functions.hooks_id_seq OWNED BY supabase_functions.hooks.id;


--
-- Name: migrations; Type: TABLE; Schema: supabase_functions; Owner: supabase_functions_admin
--

CREATE TABLE supabase_functions.migrations (
    version text NOT NULL,
    inserted_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE supabase_functions.migrations OWNER TO supabase_functions_admin;

--
-- Name: refresh_tokens id; Type: DEFAULT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens ALTER COLUMN id SET DEFAULT nextval('auth.refresh_tokens_id_seq'::regclass);


--
-- Name: hooks id; Type: DEFAULT; Schema: supabase_functions; Owner: supabase_functions_admin
--

ALTER TABLE ONLY supabase_functions.hooks ALTER COLUMN id SET DEFAULT nextval('supabase_functions.hooks_id_seq'::regclass);


--
-- Data for Name: audit_log_entries; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.audit_log_entries (instance_id, id, payload, created_at, ip_address) FROM stdin;
00000000-0000-0000-0000-000000000000	e05fdab5-bc2a-4ad1-acab-75695346bba7	{"action":"user_signedup","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"provider":"email","user_email":"eugsu10@gmail.com","user_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","user_phone":""}}	2025-10-23 13:36:30.706728+00	
00000000-0000-0000-0000-000000000000	0c595ef3-95b6-425b-a219-89a2058e4e34	{"action":"login","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-23 13:37:29.652862+00	
00000000-0000-0000-0000-000000000000	e927c3f6-304d-4b8b-b4cf-51a52d0d61f7	{"action":"logout","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-10-23 13:37:30.681028+00	
00000000-0000-0000-0000-000000000000	73336b3e-ec3b-487c-9008-2c68dab8c05c	{"action":"login","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-23 13:39:39.846357+00	
00000000-0000-0000-0000-000000000000	959b0514-b3b4-4e6f-a475-42f49beaffaf	{"action":"user_confirmation_requested","actor_id":"6b0f8512-e3f8-4902-9977-bac361429eb0","actor_name":"Иван Иванов","actor_username":"mosgate@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2025-10-23 15:22:48.588636+00	
00000000-0000-0000-0000-000000000000	0243ae84-fee4-4d71-8394-2423c163e914	{"action":"token_refreshed","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-23 15:23:12.982894+00	
00000000-0000-0000-0000-000000000000	755ddd78-7cac-4000-9dbf-009d2bbc1e20	{"action":"token_revoked","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-23 15:23:12.984467+00	
00000000-0000-0000-0000-000000000000	b17ea6bc-be25-4322-a714-b9206d283a6a	{"action":"user_signedup","actor_id":"6b0f8512-e3f8-4902-9977-bac361429eb0","actor_name":"Иван Иванов","actor_username":"mosgate@gmail.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}	2025-10-23 15:24:13.051523+00	
00000000-0000-0000-0000-000000000000	da7246a0-c914-4393-8b22-cf2f064a1d69	{"action":"login","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-23 15:25:19.983935+00	
00000000-0000-0000-0000-000000000000	61630dc6-5c5c-4e47-bf77-2b5006896dbc	{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"mosgate@gmail.com","user_id":"6b0f8512-e3f8-4902-9977-bac361429eb0","user_phone":""}}	2025-10-23 16:24:38.125445+00	
00000000-0000-0000-0000-000000000000	f6242714-4895-4f4a-9a0c-cede1067d594	{"action":"user_confirmation_requested","actor_id":"ad89691f-0240-4c8f-af73-e86d70d6313e","actor_name":"Иван","actor_username":"mosgate@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2025-10-23 16:25:08.12705+00	
00000000-0000-0000-0000-000000000000	261ee59d-fd74-489a-a074-9be58fbff6ad	{"action":"user_signedup","actor_id":"ad89691f-0240-4c8f-af73-e86d70d6313e","actor_name":"Иван","actor_username":"mosgate@gmail.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}	2025-10-23 16:25:24.82887+00	
00000000-0000-0000-0000-000000000000	c48c8f81-aae1-48b8-a228-9ac79f6488b9	{"action":"login","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-23 16:25:56.651904+00	
00000000-0000-0000-0000-000000000000	7a7f0eec-23ce-4ac4-9e11-dad0194dd938	{"action":"token_refreshed","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-24 06:21:00.799878+00	
00000000-0000-0000-0000-000000000000	c7fb16aa-e390-4467-a765-466d9fbb9aa5	{"action":"token_revoked","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-24 06:21:00.811592+00	
00000000-0000-0000-0000-000000000000	ff79fa38-d671-425e-8c80-910e4eaf3108	{"action":"token_refreshed","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-24 07:45:00.672203+00	
00000000-0000-0000-0000-000000000000	bcd1f6bd-ed6d-4fa7-b95a-823c9277f333	{"action":"token_revoked","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-24 07:45:00.689663+00	
00000000-0000-0000-0000-000000000000	52ea9394-7304-4a1a-b1d5-98fd56bbc65c	{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"mosgate@gmail.com","user_id":"ad89691f-0240-4c8f-af73-e86d70d6313e","user_phone":""}}	2025-10-24 09:18:22.373373+00	
00000000-0000-0000-0000-000000000000	0472864f-cd40-4dba-bfa7-c17066fe5fbc	{"action":"login","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-24 09:48:38.214983+00	
00000000-0000-0000-0000-000000000000	02cc8c5c-52d7-436e-a156-f388dc1e5845	{"action":"token_refreshed","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-24 10:57:08.352892+00	
00000000-0000-0000-0000-000000000000	7fcb10dc-0fda-4887-a30e-05dd734e2e96	{"action":"token_revoked","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-24 10:57:08.371728+00	
00000000-0000-0000-0000-000000000000	ca100cdc-d01d-4e3d-a53a-71b26209fba6	{"action":"token_refreshed","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-24 11:55:11.522268+00	
00000000-0000-0000-0000-000000000000	9ccf685c-5061-4349-90fa-077bcbd67f37	{"action":"token_revoked","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-24 11:55:11.531982+00	
00000000-0000-0000-0000-000000000000	9820af77-d6d3-455b-927e-d1dc340011d7	{"action":"token_refreshed","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-24 13:01:33.80647+00	
00000000-0000-0000-0000-000000000000	f5e06edf-321a-48fa-b403-9d75ea00a4c5	{"action":"token_revoked","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-24 13:01:33.812647+00	
00000000-0000-0000-0000-000000000000	23d608c1-3555-4e60-81e7-f55bbc435d74	{"action":"token_refreshed","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-24 13:59:44.509546+00	
00000000-0000-0000-0000-000000000000	9d383502-7a32-4dca-ae8e-71b04557a9d2	{"action":"token_revoked","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-24 13:59:44.524481+00	
00000000-0000-0000-0000-000000000000	8ad91894-58e6-4921-a2f9-81d9613070f4	{"action":"token_refreshed","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-24 14:57:47.993997+00	
00000000-0000-0000-0000-000000000000	82528e7e-6a9b-4074-9947-a98d5ba1c8c6	{"action":"token_revoked","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-24 14:57:48.004498+00	
00000000-0000-0000-0000-000000000000	9e17a945-43fd-443e-9f71-92304d2762c1	{"action":"user_repeated_signup","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2025-10-25 07:14:11.692315+00	
00000000-0000-0000-0000-000000000000	c8e5ffe6-513c-4c1d-bdd0-bcedf75bcb39	{"action":"user_confirmation_requested","actor_id":"f6979247-726b-487c-8b13-ef5e1ae056d9","actor_username":"mosgate@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2025-10-25 07:20:18.089871+00	
00000000-0000-0000-0000-000000000000	a7d3399a-8960-4f61-bece-b09c212ac3ef	{"action":"user_signedup","actor_id":"f6979247-726b-487c-8b13-ef5e1ae056d9","actor_username":"mosgate@gmail.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}	2025-10-25 07:20:32.613442+00	
00000000-0000-0000-0000-000000000000	10d20371-b49f-463e-a494-187bcb713bd9	{"action":"token_refreshed","actor_id":"f6979247-726b-487c-8b13-ef5e1ae056d9","actor_username":"mosgate@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-25 09:03:27.099841+00	
00000000-0000-0000-0000-000000000000	fadfd79c-b548-4524-9fdd-4efb769bce80	{"action":"token_revoked","actor_id":"f6979247-726b-487c-8b13-ef5e1ae056d9","actor_username":"mosgate@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-25 09:03:27.113012+00	
00000000-0000-0000-0000-000000000000	4e84ac2e-e022-44ec-81b4-6012c64ab842	{"action":"login","actor_id":"f6979247-726b-487c-8b13-ef5e1ae056d9","actor_username":"mosgate@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-25 09:44:51.781318+00	
00000000-0000-0000-0000-000000000000	2b54d716-06d9-4bff-aa6c-1cad44432a3e	{"action":"login","actor_id":"f6979247-726b-487c-8b13-ef5e1ae056d9","actor_username":"mosgate@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-25 09:48:29.47706+00	
00000000-0000-0000-0000-000000000000	67daea1f-c1a4-46f4-94a6-9d0870c8e93d	{"action":"token_refreshed","actor_id":"f6979247-726b-487c-8b13-ef5e1ae056d9","actor_username":"mosgate@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-25 10:02:05.053843+00	
00000000-0000-0000-0000-000000000000	c5e1ba13-9043-424b-bf00-1c022310feb7	{"action":"token_revoked","actor_id":"f6979247-726b-487c-8b13-ef5e1ae056d9","actor_username":"mosgate@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-25 10:02:05.060456+00	
00000000-0000-0000-0000-000000000000	3a579f84-a8a9-48fe-b77b-6a59dd40594a	{"action":"login","actor_id":"f6979247-726b-487c-8b13-ef5e1ae056d9","actor_username":"mosgate@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-25 10:25:41.673606+00	
00000000-0000-0000-0000-000000000000	507f35a8-d95f-4e82-ae15-ee1375630498	{"action":"logout","actor_id":"f6979247-726b-487c-8b13-ef5e1ae056d9","actor_username":"mosgate@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-10-25 10:35:35.36925+00	
00000000-0000-0000-0000-000000000000	54eb231b-8a96-4604-ac27-380c6550737c	{"action":"login","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-25 10:36:10.163254+00	
00000000-0000-0000-0000-000000000000	62b6c72d-c575-4c8a-9885-1b8b430d1622	{"action":"login","actor_id":"f6979247-726b-487c-8b13-ef5e1ae056d9","actor_username":"mosgate@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-25 10:38:05.961036+00	
00000000-0000-0000-0000-000000000000	210017ac-e9b6-4a59-b2ff-c487740d7806	{"action":"logout","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-10-25 10:46:46.603646+00	
00000000-0000-0000-0000-000000000000	c6e91a60-363a-40ec-8a71-8b8abdaa385a	{"action":"login","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-25 10:47:09.934473+00	
00000000-0000-0000-0000-000000000000	4fdf193b-4f5e-4a59-aee4-7ea481c4b5e7	{"action":"logout","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-10-25 10:47:21.089763+00	
00000000-0000-0000-0000-000000000000	053c11b8-6768-4f16-8dab-b15d09f56c1d	{"action":"login","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-25 10:47:29.005976+00	
00000000-0000-0000-0000-000000000000	98783cec-c2db-4c20-9d3d-1dadbb35dc94	{"action":"logout","actor_id":"f6979247-726b-487c-8b13-ef5e1ae056d9","actor_username":"mosgate@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-10-25 11:08:26.447154+00	
00000000-0000-0000-0000-000000000000	6d1f1baa-b8a5-4a91-8dce-18f6e5a6a358	{"action":"login","actor_id":"f6979247-726b-487c-8b13-ef5e1ae056d9","actor_username":"mosgate@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-25 11:08:42.035042+00	
00000000-0000-0000-0000-000000000000	8da27c3f-bdc0-44e2-b7b8-4a437b710abb	{"action":"token_refreshed","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-25 11:50:21.617073+00	
00000000-0000-0000-0000-000000000000	e565b7c9-cb58-4d46-8534-6a8024d1b6d9	{"action":"token_revoked","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-25 11:50:21.627602+00	
00000000-0000-0000-0000-000000000000	03846994-60bf-4f90-96a3-dee9f5770a02	{"action":"token_refreshed","actor_id":"f6979247-726b-487c-8b13-ef5e1ae056d9","actor_username":"mosgate@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-25 12:08:35.396044+00	
00000000-0000-0000-0000-000000000000	036310cc-068a-44c5-a97d-ff60a5121cfc	{"action":"token_revoked","actor_id":"f6979247-726b-487c-8b13-ef5e1ae056d9","actor_username":"mosgate@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-25 12:08:35.403871+00	
00000000-0000-0000-0000-000000000000	ed0d8bef-bd5a-44c0-ac92-def5d934de0c	{"action":"token_refreshed","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-25 12:49:43.476945+00	
00000000-0000-0000-0000-000000000000	ebe27f87-3592-438d-96ac-f01bbc0444aa	{"action":"token_revoked","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-25 12:49:43.487854+00	
00000000-0000-0000-0000-000000000000	8de8d2a2-163f-466d-aa4a-beb0da6bfec0	{"action":"token_refreshed","actor_id":"f6979247-726b-487c-8b13-ef5e1ae056d9","actor_username":"mosgate@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-25 13:07:34.080015+00	
00000000-0000-0000-0000-000000000000	6dadcf19-f7f3-4c67-9190-f32585293930	{"action":"token_revoked","actor_id":"f6979247-726b-487c-8b13-ef5e1ae056d9","actor_username":"mosgate@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-25 13:07:34.08857+00	
00000000-0000-0000-0000-000000000000	f0eb212a-7d6b-490e-8f20-4e257be31516	{"action":"token_refreshed","actor_id":"f6979247-726b-487c-8b13-ef5e1ae056d9","actor_username":"mosgate@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-25 14:07:17.409678+00	
00000000-0000-0000-0000-000000000000	be0ad0ef-c455-4ef6-883a-fdb7718e7503	{"action":"token_revoked","actor_id":"f6979247-726b-487c-8b13-ef5e1ae056d9","actor_username":"mosgate@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-25 14:07:17.431991+00	
00000000-0000-0000-0000-000000000000	1108b6d5-a566-471f-9cf0-bf422c2bf99c	{"action":"token_refreshed","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-25 14:23:52.192013+00	
00000000-0000-0000-0000-000000000000	8ac834da-808a-4c27-bf7d-6d393be06197	{"action":"token_revoked","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-25 14:23:52.208664+00	
00000000-0000-0000-0000-000000000000	debc1cac-51a6-4f73-9e3b-182cfd9904b4	{"action":"token_refreshed","actor_id":"f6979247-726b-487c-8b13-ef5e1ae056d9","actor_username":"mosgate@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-25 15:16:47.457065+00	
00000000-0000-0000-0000-000000000000	6ea3fa53-bd11-4399-a40e-44a5e0084312	{"action":"token_revoked","actor_id":"f6979247-726b-487c-8b13-ef5e1ae056d9","actor_username":"mosgate@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-25 15:16:47.475589+00	
00000000-0000-0000-0000-000000000000	f04e93b1-6218-492c-8ab7-33b877664986	{"action":"token_refreshed","actor_id":"f6979247-726b-487c-8b13-ef5e1ae056d9","actor_username":"mosgate@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-25 16:39:49.484902+00	
00000000-0000-0000-0000-000000000000	f362aa45-ddf8-4659-b4dd-feaf6238ad95	{"action":"token_revoked","actor_id":"f6979247-726b-487c-8b13-ef5e1ae056d9","actor_username":"mosgate@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-25 16:39:49.499719+00	
00000000-0000-0000-0000-000000000000	f00524cb-5353-4660-a05e-e0b4d817d0a0	{"action":"token_refreshed","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-25 16:40:34.309873+00	
00000000-0000-0000-0000-000000000000	d3c0e23e-1e1b-47ca-b281-36c4375987e6	{"action":"token_revoked","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-25 16:40:34.316234+00	
00000000-0000-0000-0000-000000000000	b9bd4943-03ae-4fb6-9754-931a822d2772	{"action":"token_refreshed","actor_id":"f6979247-726b-487c-8b13-ef5e1ae056d9","actor_username":"mosgate@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-25 17:39:06.633231+00	
00000000-0000-0000-0000-000000000000	c63383a0-85b3-4eca-8292-df423acd8198	{"action":"token_revoked","actor_id":"f6979247-726b-487c-8b13-ef5e1ae056d9","actor_username":"mosgate@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-25 17:39:06.643541+00	
00000000-0000-0000-0000-000000000000	aedaac1c-5230-471a-99b9-049cd0cc9364	{"action":"token_refreshed","actor_id":"f6979247-726b-487c-8b13-ef5e1ae056d9","actor_username":"mosgate@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-25 20:16:34.090742+00	
00000000-0000-0000-0000-000000000000	2dddb5d3-cc4b-444c-833a-4fb9880a2043	{"action":"token_revoked","actor_id":"f6979247-726b-487c-8b13-ef5e1ae056d9","actor_username":"mosgate@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-25 20:16:34.11765+00	
00000000-0000-0000-0000-000000000000	cfb9bc76-8c1e-45a0-bef9-ebcdc89c77d2	{"action":"token_refreshed","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-25 20:24:20.75172+00	
00000000-0000-0000-0000-000000000000	86dd5830-554d-4ddc-ba61-df6956e97c3f	{"action":"token_revoked","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-25 20:24:20.755383+00	
00000000-0000-0000-0000-000000000000	427628a9-b652-493b-8480-dcbe7083f5e2	{"action":"user_confirmation_requested","actor_id":"7963cb5d-b2be-41ca-b707-6b0f5d026d47","actor_username":"postoev.e.v@su10.ru","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2025-10-25 21:06:37.477609+00	
00000000-0000-0000-0000-000000000000	06cd2104-2175-44a1-ad2d-2862f72f29c0	{"action":"user_signedup","actor_id":"7963cb5d-b2be-41ca-b707-6b0f5d026d47","actor_username":"postoev.e.v@su10.ru","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}	2025-10-25 21:07:02.89427+00	
00000000-0000-0000-0000-000000000000	a9e8176d-f132-4978-9c61-dea30b3fde08	{"action":"login","actor_id":"7963cb5d-b2be-41ca-b707-6b0f5d026d47","actor_username":"postoev.e.v@su10.ru","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-25 21:08:49.369195+00	
00000000-0000-0000-0000-000000000000	75fbdc83-79a6-4a34-8dbe-aacce3436ede	{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"postoev.e.v@su10.ru","user_id":"7963cb5d-b2be-41ca-b707-6b0f5d026d47","user_phone":""}}	2025-10-25 21:14:46.052653+00	
00000000-0000-0000-0000-000000000000	65ad599b-c263-4b2d-a95c-d13056bc81f1	{"action":"user_confirmation_requested","actor_id":"b2d6be07-0f60-419e-a103-5f4767bc2736","actor_username":"postoev.e.v@mstroy.pro","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2025-10-25 21:24:28.634807+00	
00000000-0000-0000-0000-000000000000	57edae66-3859-4f69-ac2c-fe86e0344003	{"action":"user_signedup","actor_id":"b2d6be07-0f60-419e-a103-5f4767bc2736","actor_username":"postoev.e.v@mstroy.pro","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}	2025-10-25 21:26:04.008058+00	
00000000-0000-0000-0000-000000000000	9a7c3a2e-738c-4921-a2fd-66d292db51a8	{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"postoev.e.v@mstroy.pro","user_id":"b2d6be07-0f60-419e-a103-5f4767bc2736","user_phone":""}}	2025-10-25 21:28:26.926121+00	
00000000-0000-0000-0000-000000000000	2d3c50a9-a7ea-4b50-8449-ee07b6e579e5	{"action":"user_confirmation_requested","actor_id":"b207c1f2-dd20-4e5d-b01f-59d972cec30e","actor_username":"postoev.e.v@su10.ru","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2025-10-25 21:29:19.873218+00	
00000000-0000-0000-0000-000000000000	8a1aa1f1-8c35-432f-bfb3-eeccac968e53	{"action":"user_signedup","actor_id":"b207c1f2-dd20-4e5d-b01f-59d972cec30e","actor_username":"postoev.e.v@su10.ru","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}	2025-10-25 21:29:32.866601+00	
00000000-0000-0000-0000-000000000000	f1c2299d-17b4-40ac-905f-a79a2a308cf7	{"action":"login","actor_id":"b207c1f2-dd20-4e5d-b01f-59d972cec30e","actor_username":"postoev.e.v@su10.ru","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-25 21:29:44.321042+00	
00000000-0000-0000-0000-000000000000	871d7bc5-5f03-4303-98be-81ba0cb1d551	{"action":"token_refreshed","actor_id":"f6979247-726b-487c-8b13-ef5e1ae056d9","actor_username":"mosgate@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-25 21:31:22.202529+00	
00000000-0000-0000-0000-000000000000	4265e6d3-16b0-40f6-925a-c6e7a6f30ceb	{"action":"token_revoked","actor_id":"f6979247-726b-487c-8b13-ef5e1ae056d9","actor_username":"mosgate@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-25 21:31:22.203277+00	
00000000-0000-0000-0000-000000000000	f97151cc-dda9-4dea-ae80-034f5bf29cc4	{"action":"token_refreshed","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-25 21:35:04.273438+00	
00000000-0000-0000-0000-000000000000	a2b62758-dca2-4975-b9e6-6aa246f7f7a6	{"action":"token_revoked","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-25 21:35:04.281719+00	
00000000-0000-0000-0000-000000000000	7de81363-ddc9-4e45-9dfb-3a35cc55a007	{"action":"token_refreshed","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-27 06:05:22.327099+00	
00000000-0000-0000-0000-000000000000	2fad1a69-d5e0-4b19-8ab7-2496150251eb	{"action":"token_refreshed","actor_id":"f6979247-726b-487c-8b13-ef5e1ae056d9","actor_username":"mosgate@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-27 06:05:22.324459+00	
00000000-0000-0000-0000-000000000000	c0e187f7-dbde-4853-a741-4acba12f5b74	{"action":"token_revoked","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-27 06:05:22.347445+00	
00000000-0000-0000-0000-000000000000	65f64baa-d439-48d6-a256-32f9f69c44a3	{"action":"token_revoked","actor_id":"f6979247-726b-487c-8b13-ef5e1ae056d9","actor_username":"mosgate@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-27 06:05:22.348944+00	
00000000-0000-0000-0000-000000000000	857455c7-31fd-434b-8e13-f635ded2b48f	{"action":"token_refreshed","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-27 07:04:06.137855+00	
00000000-0000-0000-0000-000000000000	54ee41aa-f0a4-4085-9dec-73c2ce6cc0dc	{"action":"token_revoked","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-27 07:04:06.15102+00	
00000000-0000-0000-0000-000000000000	0aa80afc-6a09-43df-922b-cd3f487ebe7a	{"action":"token_refreshed","actor_id":"f6979247-726b-487c-8b13-ef5e1ae056d9","actor_username":"mosgate@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-27 07:09:54.19676+00	
00000000-0000-0000-0000-000000000000	2bee62d5-2e5e-497c-8ee8-0a7e4b1fff5b	{"action":"token_revoked","actor_id":"f6979247-726b-487c-8b13-ef5e1ae056d9","actor_username":"mosgate@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-27 07:09:54.202612+00	
00000000-0000-0000-0000-000000000000	36142214-cba3-49c6-84a4-371f605102fa	{"action":"token_refreshed","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-27 08:02:27.331941+00	
00000000-0000-0000-0000-000000000000	c4b62761-a0fa-4773-a306-e9310e314651	{"action":"token_revoked","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-27 08:02:27.353904+00	
00000000-0000-0000-0000-000000000000	d42c59ef-d9e6-475c-891b-6df85cf9b7e3	{"action":"token_refreshed","actor_id":"f6979247-726b-487c-8b13-ef5e1ae056d9","actor_username":"mosgate@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-27 08:32:14.436867+00	
00000000-0000-0000-0000-000000000000	94b618c5-324b-4c86-bc75-cfd7fa9dc5d9	{"action":"token_revoked","actor_id":"f6979247-726b-487c-8b13-ef5e1ae056d9","actor_username":"mosgate@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-27 08:32:14.460496+00	
00000000-0000-0000-0000-000000000000	c0cbb2fd-2e82-42af-a7ea-df891c313c31	{"action":"user_confirmation_requested","actor_id":"702cf750-b8ea-4bb9-b553-c8eabda2dd9d","actor_username":"flowvector@proton.me","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2025-10-27 08:41:07.274262+00	
00000000-0000-0000-0000-000000000000	4538fdd3-ca6c-4372-8c22-85e4152fac0d	{"action":"user_signedup","actor_id":"702cf750-b8ea-4bb9-b553-c8eabda2dd9d","actor_username":"flowvector@proton.me","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}	2025-10-27 08:42:11.830797+00	
00000000-0000-0000-0000-000000000000	3c134655-2df4-4078-8a04-c41bf11e3c15	{"action":"token_refreshed","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-27 09:02:59.478227+00	
00000000-0000-0000-0000-000000000000	a4436788-7660-47e5-b935-591457aa1042	{"action":"token_revoked","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-27 09:02:59.481875+00	
00000000-0000-0000-0000-000000000000	7a422897-05df-4856-af8b-470ecc414f18	{"action":"token_refreshed","actor_id":"702cf750-b8ea-4bb9-b553-c8eabda2dd9d","actor_username":"flowvector@proton.me","actor_via_sso":false,"log_type":"token"}	2025-10-27 09:52:07.889637+00	
00000000-0000-0000-0000-000000000000	60aff8f5-3390-4cc5-9ca1-ea0ca6f071b5	{"action":"token_revoked","actor_id":"702cf750-b8ea-4bb9-b553-c8eabda2dd9d","actor_username":"flowvector@proton.me","actor_via_sso":false,"log_type":"token"}	2025-10-27 09:52:07.919569+00	
00000000-0000-0000-0000-000000000000	46b8a8a2-8573-49c7-9904-cfcfbefa2d19	{"action":"token_refreshed","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-27 10:47:18.238587+00	
00000000-0000-0000-0000-000000000000	8ed2083e-524c-463f-9e5e-f13da904441a	{"action":"token_revoked","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-27 10:47:18.251595+00	
00000000-0000-0000-0000-000000000000	adac93c8-56fe-4da1-b221-53bb466b380d	{"action":"token_refreshed","actor_id":"702cf750-b8ea-4bb9-b553-c8eabda2dd9d","actor_username":"flowvector@proton.me","actor_via_sso":false,"log_type":"token"}	2025-10-27 11:11:33.881927+00	
00000000-0000-0000-0000-000000000000	2c85bfd3-a3ed-4dd6-a7ae-0eedf23b3f93	{"action":"token_revoked","actor_id":"702cf750-b8ea-4bb9-b553-c8eabda2dd9d","actor_username":"flowvector@proton.me","actor_via_sso":false,"log_type":"token"}	2025-10-27 11:11:33.89772+00	
00000000-0000-0000-0000-000000000000	d460c42c-f827-4c33-8b33-270361a071b6	{"action":"login","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-27 11:14:02.141323+00	
00000000-0000-0000-0000-000000000000	8569b913-196b-46b4-9e83-fa51fc2f414a	{"action":"login","actor_id":"f6979247-726b-487c-8b13-ef5e1ae056d9","actor_username":"mosgate@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-27 11:14:49.610264+00	
00000000-0000-0000-0000-000000000000	a760ac02-bbd9-45d1-8fda-8cf1365a74a5	{"action":"token_refreshed","actor_id":"702cf750-b8ea-4bb9-b553-c8eabda2dd9d","actor_username":"flowvector@proton.me","actor_via_sso":false,"log_type":"token"}	2025-10-27 12:32:17.705543+00	
00000000-0000-0000-0000-000000000000	7827e2cb-1366-4cd6-a8fd-1138c38ff4f5	{"action":"token_revoked","actor_id":"702cf750-b8ea-4bb9-b553-c8eabda2dd9d","actor_username":"flowvector@proton.me","actor_via_sso":false,"log_type":"token"}	2025-10-27 12:32:17.717115+00	
00000000-0000-0000-0000-000000000000	7e52b47d-130f-4b5d-b00c-0af65705e169	{"action":"token_refreshed","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-27 12:32:24.568387+00	
00000000-0000-0000-0000-000000000000	013d99a2-d306-48b9-9463-9b0ed186daf8	{"action":"token_revoked","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-27 12:32:24.580009+00	
00000000-0000-0000-0000-000000000000	a1189532-7661-4355-9ada-c7f5f1950531	{"action":"login","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-27 12:33:24.14386+00	
00000000-0000-0000-0000-000000000000	fb3ff4c9-c20f-406e-94f0-433d4ff20ba2	{"action":"token_refreshed","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-27 13:32:37.66893+00	
00000000-0000-0000-0000-000000000000	ca46815f-2f96-4027-91c5-e2b139d0fa7f	{"action":"token_revoked","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-27 13:32:37.685591+00	
00000000-0000-0000-0000-000000000000	d2e79c4d-7694-4754-9804-7ff52d3f5246	{"action":"token_refreshed","actor_id":"702cf750-b8ea-4bb9-b553-c8eabda2dd9d","actor_username":"flowvector@proton.me","actor_via_sso":false,"log_type":"token"}	2025-10-27 13:33:27.385483+00	
00000000-0000-0000-0000-000000000000	6a6c12f5-0a0f-4a04-8c56-9dbc1c0f72a4	{"action":"token_revoked","actor_id":"702cf750-b8ea-4bb9-b553-c8eabda2dd9d","actor_username":"flowvector@proton.me","actor_via_sso":false,"log_type":"token"}	2025-10-27 13:33:27.387484+00	
00000000-0000-0000-0000-000000000000	5b5f213d-561b-4bca-8a64-16b6df045b87	{"action":"token_refreshed","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-27 14:31:54.372101+00	
00000000-0000-0000-0000-000000000000	812915a0-2e16-4b14-a876-748c86c6714d	{"action":"token_revoked","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-27 14:31:54.395545+00	
00000000-0000-0000-0000-000000000000	97830139-f5e4-43f7-b092-5e097eada55c	{"action":"token_refreshed","actor_id":"702cf750-b8ea-4bb9-b553-c8eabda2dd9d","actor_username":"flowvector@proton.me","actor_via_sso":false,"log_type":"token"}	2025-10-27 14:32:59.537299+00	
00000000-0000-0000-0000-000000000000	242b7d0c-f1ad-42e4-b7cc-d48ed3c76041	{"action":"token_revoked","actor_id":"702cf750-b8ea-4bb9-b553-c8eabda2dd9d","actor_username":"flowvector@proton.me","actor_via_sso":false,"log_type":"token"}	2025-10-27 14:32:59.538949+00	
00000000-0000-0000-0000-000000000000	5f651c30-a5a3-4d77-9311-dfbb12d14157	{"action":"token_refreshed","actor_id":"702cf750-b8ea-4bb9-b553-c8eabda2dd9d","actor_username":"flowvector@proton.me","actor_via_sso":false,"log_type":"token"}	2025-10-28 06:10:02.12153+00	
00000000-0000-0000-0000-000000000000	1cd2b28f-c2b2-43a5-80b3-736d934149eb	{"action":"token_refreshed","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-28 06:10:02.118803+00	
00000000-0000-0000-0000-000000000000	918ed3f3-f5c9-4dcd-923a-434be36e7e3f	{"action":"token_revoked","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-28 06:10:02.133379+00	
00000000-0000-0000-0000-000000000000	c088a240-442f-40b4-8058-4a985ffaee7b	{"action":"token_revoked","actor_id":"702cf750-b8ea-4bb9-b553-c8eabda2dd9d","actor_username":"flowvector@proton.me","actor_via_sso":false,"log_type":"token"}	2025-10-28 06:10:02.133502+00	
00000000-0000-0000-0000-000000000000	97834d5c-a47f-4fe2-8e1f-29c70b7ecdb5	{"action":"token_refreshed","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-28 06:10:03.630611+00	
00000000-0000-0000-0000-000000000000	9a64f694-03d5-4947-8924-b34a906ec6ee	{"action":"token_revoked","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-28 06:10:03.631624+00	
00000000-0000-0000-0000-000000000000	e989a558-6df6-4b8f-97dd-f0e002a9568b	{"action":"token_refreshed","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-28 06:23:51.425566+00	
00000000-0000-0000-0000-000000000000	c912afc5-506b-498b-8d3b-348b18600726	{"action":"token_revoked","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-28 06:23:51.437893+00	
00000000-0000-0000-0000-000000000000	dd9803a6-6e90-45bd-bb4b-99aa0cc1f29b	{"action":"logout","actor_id":"702cf750-b8ea-4bb9-b553-c8eabda2dd9d","actor_username":"flowvector@proton.me","actor_via_sso":false,"log_type":"account"}	2025-10-28 06:25:34.985625+00	
00000000-0000-0000-0000-000000000000	d395c629-ba99-4d0d-8642-ba397972deca	{"action":"login","actor_id":"f6979247-726b-487c-8b13-ef5e1ae056d9","actor_username":"mosgate@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-28 06:25:50.454857+00	
00000000-0000-0000-0000-000000000000	d232d88a-7e82-4f3f-8bfb-b8509b2e9af6	{"action":"login","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-28 07:33:20.621803+00	
00000000-0000-0000-0000-000000000000	13fa54f1-7898-4017-9459-e6eb65830a5c	{"action":"token_refreshed","actor_id":"f6979247-726b-487c-8b13-ef5e1ae056d9","actor_username":"mosgate@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-28 07:39:42.906942+00	
00000000-0000-0000-0000-000000000000	e17ff236-d294-4fb5-9ca2-b43d13fd8f41	{"action":"token_revoked","actor_id":"f6979247-726b-487c-8b13-ef5e1ae056d9","actor_username":"mosgate@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-28 07:39:42.90973+00	
00000000-0000-0000-0000-000000000000	6083dabd-6abf-4349-b843-4a1b1a14cb84	{"action":"token_refreshed","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-28 08:41:28.786444+00	
00000000-0000-0000-0000-000000000000	2691b9bb-5f09-4d65-a18f-01ffd88f7bd3	{"action":"token_revoked","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-28 08:41:28.794265+00	
00000000-0000-0000-0000-000000000000	12e18899-d2fa-421b-b444-827bddbb8c82	{"action":"token_refreshed","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-28 09:52:19.108009+00	
00000000-0000-0000-0000-000000000000	7b602e39-fc97-4428-8071-e9871c1e6551	{"action":"token_revoked","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-28 09:52:19.129137+00	
00000000-0000-0000-0000-000000000000	04d3ffb9-1e39-475f-bd71-3969c549fb92	{"action":"token_refreshed","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-28 10:58:49.750955+00	
00000000-0000-0000-0000-000000000000	63add34d-f0bc-41c2-ba17-529ea0f7edfc	{"action":"token_revoked","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-28 10:58:49.771362+00	
00000000-0000-0000-0000-000000000000	88ac1a72-0e1f-4e0b-9b91-7e176dccf898	{"action":"token_refreshed","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-28 11:57:57.472833+00	
00000000-0000-0000-0000-000000000000	7d7e9be6-3a8b-4b4e-84e0-794895d2b4ee	{"action":"token_revoked","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-28 11:57:57.482606+00	
00000000-0000-0000-0000-000000000000	4ee8d213-24ed-461a-89c9-8751b3985e54	{"action":"token_refreshed","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-28 12:56:22.766579+00	
00000000-0000-0000-0000-000000000000	c5ee1b2b-2ad3-4417-8b7a-34eb07b87750	{"action":"token_revoked","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-28 12:56:22.783283+00	
00000000-0000-0000-0000-000000000000	9c4a80d0-dabf-4afa-b27e-b05882b7fea3	{"action":"token_refreshed","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-28 13:55:04.38703+00	
00000000-0000-0000-0000-000000000000	0d6a418e-359f-4396-a57a-97752b6f6a4d	{"action":"token_revoked","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-28 13:55:04.397064+00	
00000000-0000-0000-0000-000000000000	ffce8bfa-a517-46df-a6a2-09580e877638	{"action":"token_refreshed","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-28 14:53:44.65789+00	
00000000-0000-0000-0000-000000000000	1b7eb2a6-3b29-4605-8678-ff50984ce809	{"action":"token_revoked","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-28 14:53:44.666474+00	
00000000-0000-0000-0000-000000000000	fe2b3a61-da3f-45e3-b99e-c00caf3d2332	{"action":"login","actor_id":"f6979247-726b-487c-8b13-ef5e1ae056d9","actor_username":"mosgate@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-28 14:57:36.469903+00	
\.


--
-- Data for Name: flow_state; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.flow_state (id, user_id, auth_code, code_challenge_method, code_challenge, provider_type, provider_access_token, provider_refresh_token, created_at, updated_at, authentication_method, auth_code_issued_at) FROM stdin;
\.


--
-- Data for Name: identities; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id) FROM stdin;
8537c87c-44d7-450e-b1b0-498ae7ddd3f6	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	{"sub": "8537c87c-44d7-450e-b1b0-498ae7ddd3f6", "email": "eugsu10@gmail.com", "email_verified": false, "phone_verified": false}	email	2025-10-23 13:36:30.702983+00	2025-10-23 13:36:30.703037+00	2025-10-23 13:36:30.703037+00	eae3d66b-929b-40e3-9d6c-268d56437705
f6979247-726b-487c-8b13-ef5e1ae056d9	f6979247-726b-487c-8b13-ef5e1ae056d9	{"sub": "f6979247-726b-487c-8b13-ef5e1ae056d9", "email": "mosgate@gmail.com", "email_verified": true, "phone_verified": false}	email	2025-10-25 07:20:18.07625+00	2025-10-25 07:20:18.076303+00	2025-10-25 07:20:18.076303+00	f8ec2ba6-c73d-4a08-9ea9-b4f12db61e30
b207c1f2-dd20-4e5d-b01f-59d972cec30e	b207c1f2-dd20-4e5d-b01f-59d972cec30e	{"sub": "b207c1f2-dd20-4e5d-b01f-59d972cec30e", "email": "postoev.e.v@su10.ru", "display_name": "Постоев", "email_verified": true, "phone_verified": false}	email	2025-10-25 21:29:19.870773+00	2025-10-25 21:29:19.870821+00	2025-10-25 21:29:19.870821+00	8f4d7e2e-d7df-42d0-a0b9-43eea0c7af1a
702cf750-b8ea-4bb9-b553-c8eabda2dd9d	702cf750-b8ea-4bb9-b553-c8eabda2dd9d	{"sub": "702cf750-b8ea-4bb9-b553-c8eabda2dd9d", "email": "flowvector@proton.me", "display_name": "dfdf", "email_verified": true, "phone_verified": false}	email	2025-10-27 08:41:07.264201+00	2025-10-27 08:41:07.264249+00	2025-10-27 08:41:07.264249+00	6cbafc41-6512-4baa-9759-deacd6f9cab0
\.


--
-- Data for Name: instances; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.instances (id, uuid, raw_base_config, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: mfa_amr_claims; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.mfa_amr_claims (session_id, created_at, updated_at, authentication_method, id) FROM stdin;
aba75ce1-94ea-446d-8e18-4a611a0e1338	2025-10-25 10:47:29.012002+00	2025-10-25 10:47:29.012002+00	password	d91e6183-1b60-44c6-991c-3bef40df7209
92bcc80a-6438-4e3e-a356-fa6bf8497706	2025-10-25 11:08:42.060774+00	2025-10-25 11:08:42.060774+00	password	b87e4c30-92cb-433e-8681-48c08e91e1c1
3624e931-727c-432f-9e89-9cd69ad87d59	2025-10-25 21:29:32.878327+00	2025-10-25 21:29:32.878327+00	otp	457588fd-81ff-4983-bb40-341e74ec2163
31d3ef55-1232-44b7-a4c9-68b837218c74	2025-10-25 21:29:44.325111+00	2025-10-25 21:29:44.325111+00	password	021ae397-b9f6-43ea-89ca-8a7b67fa4458
1950f3e2-e131-4cc5-91a3-09f6d0f76d4c	2025-10-27 11:14:02.192122+00	2025-10-27 11:14:02.192122+00	password	f8f93437-4284-4341-8f56-55a7eba0a323
e48493ad-84d2-4459-a0b3-36a4536cd9a9	2025-10-27 11:14:49.614176+00	2025-10-27 11:14:49.614176+00	password	4cd159e3-5cc7-4e19-8f01-67649ced762a
b5a5f219-01dd-490e-958d-04cc8615334d	2025-10-27 12:33:24.162353+00	2025-10-27 12:33:24.162353+00	password	d53f0b77-7473-4e18-bb89-8721ac1a2249
a2526b61-2234-4c13-bfa2-e7e37e94b69d	2025-10-28 06:25:50.467672+00	2025-10-28 06:25:50.467672+00	password	bdb3e375-a684-487d-8410-2e94b3ff71ea
a8aa6f5f-0cd8-47fe-8604-f3f3faa425f7	2025-10-28 07:33:20.676778+00	2025-10-28 07:33:20.676778+00	password	d31916ba-2fd0-4797-ab80-916f3f7b1029
0398b54b-59db-4735-8f1e-62208ca59252	2025-10-28 14:57:36.518821+00	2025-10-28 14:57:36.518821+00	password	4818d123-6e59-4213-8ca1-978113c01665
\.


--
-- Data for Name: mfa_challenges; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.mfa_challenges (id, factor_id, created_at, verified_at, ip_address, otp_code, web_authn_session_data) FROM stdin;
\.


--
-- Data for Name: mfa_factors; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.mfa_factors (id, user_id, friendly_name, factor_type, status, created_at, updated_at, secret, phone, last_challenged_at, web_authn_credential, web_authn_aaguid) FROM stdin;
\.


--
-- Data for Name: oauth_authorizations; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.oauth_authorizations (id, authorization_id, client_id, user_id, redirect_uri, scope, state, resource, code_challenge, code_challenge_method, response_type, status, authorization_code, created_at, expires_at, approved_at) FROM stdin;
\.


--
-- Data for Name: oauth_clients; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.oauth_clients (id, client_secret_hash, registration_type, redirect_uris, grant_types, client_name, client_uri, logo_uri, created_at, updated_at, deleted_at, client_type) FROM stdin;
\.


--
-- Data for Name: oauth_consents; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.oauth_consents (id, user_id, client_id, scopes, granted_at, revoked_at) FROM stdin;
\.


--
-- Data for Name: one_time_tokens; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.one_time_tokens (id, user_id, token_type, token_hash, relates_to, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: refresh_tokens; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.refresh_tokens (instance_id, id, token, user_id, revoked, created_at, updated_at, parent, session_id) FROM stdin;
00000000-0000-0000-0000-000000000000	44	zyqc5tq2mdx7	f6979247-726b-487c-8b13-ef5e1ae056d9	t	2025-10-25 21:31:22.205896+00	2025-10-27 06:05:22.350656+00	cjzxsg2bk4mv	92bcc80a-6438-4e3e-a356-fa6bf8497706
00000000-0000-0000-0000-000000000000	45	6q442tsxvk74	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	t	2025-10-25 21:35:04.288177+00	2025-10-27 06:05:22.350105+00	grezkamcwvax	aba75ce1-94ea-446d-8e18-4a611a0e1338
00000000-0000-0000-0000-000000000000	47	xciep3gedehk	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	t	2025-10-27 06:05:22.374419+00	2025-10-27 07:04:06.152898+00	6q442tsxvk74	aba75ce1-94ea-446d-8e18-4a611a0e1338
00000000-0000-0000-0000-000000000000	46	vmweijulcb7x	f6979247-726b-487c-8b13-ef5e1ae056d9	t	2025-10-27 06:05:22.373039+00	2025-10-27 07:09:54.203977+00	zyqc5tq2mdx7	92bcc80a-6438-4e3e-a356-fa6bf8497706
00000000-0000-0000-0000-000000000000	48	d23wsx3yuqay	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	t	2025-10-27 07:04:06.16624+00	2025-10-27 08:02:27.355805+00	xciep3gedehk	aba75ce1-94ea-446d-8e18-4a611a0e1338
00000000-0000-0000-0000-000000000000	49	envspip2a5an	f6979247-726b-487c-8b13-ef5e1ae056d9	t	2025-10-27 07:09:54.206067+00	2025-10-27 08:32:14.462393+00	vmweijulcb7x	92bcc80a-6438-4e3e-a356-fa6bf8497706
00000000-0000-0000-0000-000000000000	51	ickceas63yx7	f6979247-726b-487c-8b13-ef5e1ae056d9	f	2025-10-27 08:32:14.476488+00	2025-10-27 08:32:14.476488+00	envspip2a5an	92bcc80a-6438-4e3e-a356-fa6bf8497706
00000000-0000-0000-0000-000000000000	50	tbahkttved7m	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	t	2025-10-27 08:02:27.377+00	2025-10-27 09:02:59.482537+00	d23wsx3yuqay	aba75ce1-94ea-446d-8e18-4a611a0e1338
00000000-0000-0000-0000-000000000000	53	5cludkhqoocm	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	t	2025-10-27 09:02:59.488179+00	2025-10-27 10:47:18.255669+00	tbahkttved7m	aba75ce1-94ea-446d-8e18-4a611a0e1338
00000000-0000-0000-0000-000000000000	58	5v4f366fa5oj	f6979247-726b-487c-8b13-ef5e1ae056d9	f	2025-10-27 11:14:49.612101+00	2025-10-27 11:14:49.612101+00	\N	e48493ad-84d2-4459-a0b3-36a4536cd9a9
00000000-0000-0000-0000-000000000000	57	rl66laicllti	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	t	2025-10-27 11:14:02.172812+00	2025-10-27 12:32:24.581873+00	\N	1950f3e2-e131-4cc5-91a3-09f6d0f76d4c
00000000-0000-0000-0000-000000000000	61	nuhecxmc42ga	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	t	2025-10-27 12:33:24.157147+00	2025-10-27 13:32:37.686939+00	\N	b5a5f219-01dd-490e-958d-04cc8615334d
00000000-0000-0000-0000-000000000000	60	lo55uwi64ghr	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	t	2025-10-27 12:32:24.595627+00	2025-10-27 14:31:54.397974+00	rl66laicllti	1950f3e2-e131-4cc5-91a3-09f6d0f76d4c
00000000-0000-0000-0000-000000000000	25	miy7gbxheqch	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	t	2025-10-25 10:47:29.008089+00	2025-10-25 11:50:21.629004+00	\N	aba75ce1-94ea-446d-8e18-4a611a0e1338
00000000-0000-0000-0000-000000000000	26	rgjb62qnyzjx	f6979247-726b-487c-8b13-ef5e1ae056d9	t	2025-10-25 11:08:42.051232+00	2025-10-25 12:08:35.404488+00	\N	92bcc80a-6438-4e3e-a356-fa6bf8497706
00000000-0000-0000-0000-000000000000	64	purgv3h2u2af	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	t	2025-10-27 14:31:54.414157+00	2025-10-28 06:10:02.135813+00	lo55uwi64ghr	1950f3e2-e131-4cc5-91a3-09f6d0f76d4c
00000000-0000-0000-0000-000000000000	27	wbdc4pr3afr4	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	t	2025-10-25 11:50:21.63938+00	2025-10-25 12:49:43.49106+00	miy7gbxheqch	aba75ce1-94ea-446d-8e18-4a611a0e1338
00000000-0000-0000-0000-000000000000	28	t52m5lospq46	f6979247-726b-487c-8b13-ef5e1ae056d9	t	2025-10-25 12:08:35.409442+00	2025-10-25 13:07:34.090454+00	rgjb62qnyzjx	92bcc80a-6438-4e3e-a356-fa6bf8497706
00000000-0000-0000-0000-000000000000	67	puroypnrsgwb	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	f	2025-10-28 06:10:02.148883+00	2025-10-28 06:10:02.148883+00	purgv3h2u2af	1950f3e2-e131-4cc5-91a3-09f6d0f76d4c
00000000-0000-0000-0000-000000000000	30	tlqh4lddkat4	f6979247-726b-487c-8b13-ef5e1ae056d9	t	2025-10-25 13:07:34.096527+00	2025-10-25 14:07:17.435853+00	t52m5lospq46	92bcc80a-6438-4e3e-a356-fa6bf8497706
00000000-0000-0000-0000-000000000000	62	75hk632dh3d5	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	t	2025-10-27 13:32:37.695174+00	2025-10-28 06:10:03.632972+00	nuhecxmc42ga	b5a5f219-01dd-490e-958d-04cc8615334d
00000000-0000-0000-0000-000000000000	29	cp3avyi74lkf	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	t	2025-10-25 12:49:43.505395+00	2025-10-25 14:23:52.209374+00	wbdc4pr3afr4	aba75ce1-94ea-446d-8e18-4a611a0e1338
00000000-0000-0000-0000-000000000000	68	kv4p7xizinqw	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	f	2025-10-28 06:10:03.633375+00	2025-10-28 06:10:03.633375+00	75hk632dh3d5	b5a5f219-01dd-490e-958d-04cc8615334d
00000000-0000-0000-0000-000000000000	31	ghdx45all7rz	f6979247-726b-487c-8b13-ef5e1ae056d9	t	2025-10-25 14:07:17.454814+00	2025-10-25 15:16:47.47753+00	tlqh4lddkat4	92bcc80a-6438-4e3e-a356-fa6bf8497706
00000000-0000-0000-0000-000000000000	55	gxnr2rvk3t5q	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	t	2025-10-27 10:47:18.263495+00	2025-10-28 06:23:51.44037+00	5cludkhqoocm	aba75ce1-94ea-446d-8e18-4a611a0e1338
00000000-0000-0000-0000-000000000000	33	qv2swa3ec4vb	f6979247-726b-487c-8b13-ef5e1ae056d9	t	2025-10-25 15:16:47.492527+00	2025-10-25 16:39:49.502589+00	ghdx45all7rz	92bcc80a-6438-4e3e-a356-fa6bf8497706
00000000-0000-0000-0000-000000000000	69	eqtomcmbpm64	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	f	2025-10-28 06:23:51.443817+00	2025-10-28 06:23:51.443817+00	gxnr2rvk3t5q	aba75ce1-94ea-446d-8e18-4a611a0e1338
00000000-0000-0000-0000-000000000000	32	spma4gva3zqf	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	t	2025-10-25 14:23:52.22737+00	2025-10-25 16:40:34.316926+00	cp3avyi74lkf	aba75ce1-94ea-446d-8e18-4a611a0e1338
00000000-0000-0000-0000-000000000000	34	froeuve6j7yd	f6979247-726b-487c-8b13-ef5e1ae056d9	t	2025-10-25 16:39:49.518445+00	2025-10-25 17:39:06.64679+00	qv2swa3ec4vb	92bcc80a-6438-4e3e-a356-fa6bf8497706
00000000-0000-0000-0000-000000000000	36	s7e6lnabjw7b	f6979247-726b-487c-8b13-ef5e1ae056d9	t	2025-10-25 17:39:06.664245+00	2025-10-25 20:16:34.118896+00	froeuve6j7yd	92bcc80a-6438-4e3e-a356-fa6bf8497706
00000000-0000-0000-0000-000000000000	70	ayypsfltmu6u	f6979247-726b-487c-8b13-ef5e1ae056d9	t	2025-10-28 06:25:50.463337+00	2025-10-28 07:39:42.911031+00	\N	a2526b61-2234-4c13-bfa2-e7e37e94b69d
00000000-0000-0000-0000-000000000000	35	5mqvmzhsjse4	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	t	2025-10-25 16:40:34.31787+00	2025-10-25 20:24:20.756112+00	spma4gva3zqf	aba75ce1-94ea-446d-8e18-4a611a0e1338
00000000-0000-0000-0000-000000000000	72	3lzokfkxbwn2	f6979247-726b-487c-8b13-ef5e1ae056d9	f	2025-10-28 07:39:42.912427+00	2025-10-28 07:39:42.912427+00	ayypsfltmu6u	a2526b61-2234-4c13-bfa2-e7e37e94b69d
00000000-0000-0000-0000-000000000000	71	ktxzhfownjo3	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	t	2025-10-28 07:33:20.649596+00	2025-10-28 08:41:28.796791+00	\N	a8aa6f5f-0cd8-47fe-8604-f3f3faa425f7
00000000-0000-0000-0000-000000000000	73	m6euatkaahuy	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	t	2025-10-28 08:41:28.805901+00	2025-10-28 09:52:19.132795+00	ktxzhfownjo3	a8aa6f5f-0cd8-47fe-8604-f3f3faa425f7
00000000-0000-0000-0000-000000000000	42	jh3u6hlflmax	b207c1f2-dd20-4e5d-b01f-59d972cec30e	f	2025-10-25 21:29:32.87233+00	2025-10-25 21:29:32.87233+00	\N	3624e931-727c-432f-9e89-9cd69ad87d59
00000000-0000-0000-0000-000000000000	43	7jowdcmtwxad	b207c1f2-dd20-4e5d-b01f-59d972cec30e	f	2025-10-25 21:29:44.323019+00	2025-10-25 21:29:44.323019+00	\N	31d3ef55-1232-44b7-a4c9-68b837218c74
00000000-0000-0000-0000-000000000000	37	cjzxsg2bk4mv	f6979247-726b-487c-8b13-ef5e1ae056d9	t	2025-10-25 20:16:34.141931+00	2025-10-25 21:31:22.20447+00	s7e6lnabjw7b	92bcc80a-6438-4e3e-a356-fa6bf8497706
00000000-0000-0000-0000-000000000000	38	grezkamcwvax	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	t	2025-10-25 20:24:20.76114+00	2025-10-25 21:35:04.282919+00	5mqvmzhsjse4	aba75ce1-94ea-446d-8e18-4a611a0e1338
00000000-0000-0000-0000-000000000000	74	5w5vrk7fa5n7	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	t	2025-10-28 09:52:19.153377+00	2025-10-28 10:58:49.772637+00	m6euatkaahuy	a8aa6f5f-0cd8-47fe-8604-f3f3faa425f7
00000000-0000-0000-0000-000000000000	75	6nysztvhu4d5	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	t	2025-10-28 10:58:49.785457+00	2025-10-28 11:57:57.484539+00	5w5vrk7fa5n7	a8aa6f5f-0cd8-47fe-8604-f3f3faa425f7
00000000-0000-0000-0000-000000000000	76	ksgmbunoh3pv	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	t	2025-10-28 11:57:57.494802+00	2025-10-28 12:56:22.784127+00	6nysztvhu4d5	a8aa6f5f-0cd8-47fe-8604-f3f3faa425f7
00000000-0000-0000-0000-000000000000	77	5tjdxet4zl5t	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	t	2025-10-28 12:56:22.801367+00	2025-10-28 13:55:04.397693+00	ksgmbunoh3pv	a8aa6f5f-0cd8-47fe-8604-f3f3faa425f7
00000000-0000-0000-0000-000000000000	78	ypflk74irg7z	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	t	2025-10-28 13:55:04.413753+00	2025-10-28 14:53:44.667873+00	5tjdxet4zl5t	a8aa6f5f-0cd8-47fe-8604-f3f3faa425f7
00000000-0000-0000-0000-000000000000	79	axcgfj3ooui7	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	f	2025-10-28 14:53:44.680391+00	2025-10-28 14:53:44.680391+00	ypflk74irg7z	a8aa6f5f-0cd8-47fe-8604-f3f3faa425f7
00000000-0000-0000-0000-000000000000	80	rscm76shqkdk	f6979247-726b-487c-8b13-ef5e1ae056d9	f	2025-10-28 14:57:36.49532+00	2025-10-28 14:57:36.49532+00	\N	0398b54b-59db-4735-8f1e-62208ca59252
\.


--
-- Data for Name: saml_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.saml_providers (id, sso_provider_id, entity_id, metadata_xml, metadata_url, attribute_mapping, created_at, updated_at, name_id_format) FROM stdin;
\.


--
-- Data for Name: saml_relay_states; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.saml_relay_states (id, sso_provider_id, request_id, for_email, redirect_to, created_at, updated_at, flow_state_id) FROM stdin;
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.schema_migrations (version) FROM stdin;
20171026211738
20171026211808
20171026211834
20180103212743
20180108183307
20180119214651
20180125194653
00
20210710035447
20210722035447
20210730183235
20210909172000
20210927181326
20211122151130
20211124214934
20211202183645
20220114185221
20220114185340
20220224000811
20220323170000
20220429102000
20220531120530
20220614074223
20220811173540
20221003041349
20221003041400
20221011041400
20221020193600
20221021073300
20221021082433
20221027105023
20221114143122
20221114143410
20221125140132
20221208132122
20221215195500
20221215195800
20221215195900
20230116124310
20230116124412
20230131181311
20230322519590
20230402418590
20230411005111
20230508135423
20230523124323
20230818113222
20230914180801
20231027141322
20231114161723
20231117164230
20240115144230
20240214120130
20240306115329
20240314092811
20240427152123
20240612123726
20240729123726
20240802193726
20240806073726
20241009103726
20250717082212
20250731150234
20250804100000
20250901200500
20250903112500
20250904133000
\.


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.sessions (id, user_id, created_at, updated_at, factor_id, aal, not_after, refreshed_at, user_agent, ip, tag, oauth_client_id) FROM stdin;
1950f3e2-e131-4cc5-91a3-09f6d0f76d4c	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	2025-10-27 11:14:02.149831+00	2025-10-28 06:10:02.170362+00	\N	aal1	\N	2025-10-28 06:10:02.170229	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36	185.222.152.198	\N	\N
b5a5f219-01dd-490e-958d-04cc8615334d	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	2025-10-27 12:33:24.147726+00	2025-10-28 06:10:03.639227+00	\N	aal1	\N	2025-10-28 06:10:03.639132	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36	185.222.152.198	\N	\N
aba75ce1-94ea-446d-8e18-4a611a0e1338	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	2025-10-25 10:47:29.007311+00	2025-10-28 06:23:51.453862+00	\N	aal1	\N	2025-10-28 06:23:51.453777	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36	185.200.179.0	\N	\N
3624e931-727c-432f-9e89-9cd69ad87d59	b207c1f2-dd20-4e5d-b01f-59d972cec30e	2025-10-25 21:29:32.87135+00	2025-10-25 21:29:32.87135+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36	46.38.61.166	\N	\N
31d3ef55-1232-44b7-a4c9-68b837218c74	b207c1f2-dd20-4e5d-b01f-59d972cec30e	2025-10-25 21:29:44.322271+00	2025-10-25 21:29:44.322271+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36 Edg/141.0.0.0	185.200.179.0	\N	\N
a2526b61-2234-4c13-bfa2-e7e37e94b69d	f6979247-726b-487c-8b13-ef5e1ae056d9	2025-10-28 06:25:50.458086+00	2025-10-28 07:39:42.919859+00	\N	aal1	\N	2025-10-28 07:39:42.919786	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36	185.200.179.0	\N	\N
a8aa6f5f-0cd8-47fe-8604-f3f3faa425f7	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	2025-10-28 07:33:20.637271+00	2025-10-28 14:53:44.695157+00	\N	aal1	\N	2025-10-28 14:53:44.694483	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36	88.210.21.137	\N	\N
92bcc80a-6438-4e3e-a356-fa6bf8497706	f6979247-726b-487c-8b13-ef5e1ae056d9	2025-10-25 11:08:42.045036+00	2025-10-27 08:32:14.495615+00	\N	aal1	\N	2025-10-27 08:32:14.495524	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36	185.200.179.0	\N	\N
0398b54b-59db-4735-8f1e-62208ca59252	f6979247-726b-487c-8b13-ef5e1ae056d9	2025-10-28 14:57:36.487183+00	2025-10-28 14:57:36.487183+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36	88.210.21.137	\N	\N
e48493ad-84d2-4459-a0b3-36a4536cd9a9	f6979247-726b-487c-8b13-ef5e1ae056d9	2025-10-27 11:14:49.611266+00	2025-10-27 11:14:49.611266+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36	185.222.152.198	\N	\N
\.


--
-- Data for Name: sso_domains; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.sso_domains (id, sso_provider_id, domain, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: sso_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.sso_providers (id, resource_id, created_at, updated_at, disabled) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, invited_at, confirmation_token, confirmation_sent_at, recovery_token, recovery_sent_at, email_change_token_new, email_change, email_change_sent_at, last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at, phone, phone_confirmed_at, phone_change, phone_change_token, phone_change_sent_at, email_change_token_current, email_change_confirm_status, banned_until, reauthentication_token, reauthentication_sent_at, is_sso_user, deleted_at, is_anonymous) FROM stdin;
00000000-0000-0000-0000-000000000000	b207c1f2-dd20-4e5d-b01f-59d972cec30e	authenticated	authenticated	postoev.e.v@su10.ru	$2a$10$UW51WpYTmqnTW3JMqDw14.nS/ERnm5BlSIG.c3ucqJ3NvoCIZzquO	2025-10-25 21:29:32.86731+00	\N		2025-10-25 21:29:19.873773+00		\N			\N	2025-10-25 21:29:44.322185+00	{"provider": "email", "providers": ["email"]}	{"sub": "b207c1f2-dd20-4e5d-b01f-59d972cec30e", "email": "postoev.e.v@su10.ru", "display_name": "Постоев", "email_verified": true, "phone_verified": false}	\N	2025-10-25 21:29:19.865027+00	2025-10-25 21:29:44.324759+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	authenticated	authenticated	eugsu10@gmail.com	$2a$10$ycLTAeppx6j9uZ6OSL3EOOil5iKV.HJJkMzBWoZqTvwNmW3B8Laoa	2025-10-23 13:36:30.71992+00	\N		\N		\N			\N	2025-10-28 07:33:20.637179+00	{"provider": "email", "providers": ["email"]}	{"email_verified": true}	\N	2025-10-23 13:36:30.688124+00	2025-10-28 14:53:44.688237+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	f6979247-726b-487c-8b13-ef5e1ae056d9	authenticated	authenticated	mosgate@gmail.com	$2a$10$L8plCueXWreLZLZOKOTbje28tS2D.mphEH3vP.SBbq/YxsbtZj7GC	2025-10-25 07:20:32.618457+00	\N		2025-10-25 07:20:18.092671+00		\N			\N	2025-10-28 14:57:36.486354+00	{"provider": "email", "providers": ["email"]}	{"sub": "f6979247-726b-487c-8b13-ef5e1ae056d9", "email": "mosgate@gmail.com", "email_verified": true, "phone_verified": false}	\N	2025-10-25 07:20:18.054934+00	2025-10-28 14:57:36.512458+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	702cf750-b8ea-4bb9-b553-c8eabda2dd9d	authenticated	authenticated	flowvector@proton.me	$2a$10$nS9Tx29Z6tEuViHOjN0ZIuCYlGscBCPocLrBGiJtu/GX1CUva3p.y	2025-10-27 08:42:11.831772+00	\N		2025-10-27 08:41:07.276465+00		\N			\N	2025-10-27 08:42:11.839494+00	{"provider": "email", "providers": ["email"]}	{"sub": "702cf750-b8ea-4bb9-b553-c8eabda2dd9d", "email": "flowvector@proton.me", "display_name": "dfdf", "email_verified": true, "phone_verified": false}	\N	2025-10-27 08:41:07.244642+00	2025-10-28 06:10:02.162296+00	\N	\N			\N		0	\N		\N	f	\N	f
\.


--
-- Data for Name: conversations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.conversations (id, user_id, title, created_at) FROM stdin;
b57f5ce8-f65c-4057-af71-797e3d3299c6	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	назови площадь территории сша	2025-10-24 10:35:29.511246+00
ff9e0340-0361-4501-a791-1d32fb90ceb6	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	Назови 5 самых крупных по площади стран европы, и 	2025-10-24 11:47:07.095999+00
faea5156-e5c1-40e3-8739-26faa40fced6	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	распиши, как нужно подключаться к chat gpt через a	2025-10-24 13:14:09.781564+00
4bbdb8f4-bc3c-4c72-bf63-69562a103265	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	может ли работать модель gpt-4o через api, если на	2025-10-24 13:56:29.746815+00
56f22c71-19d0-4b79-8c1e-10cf4818750b	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	может ли работать модель gemini 1.5 pro через api,	2025-10-24 14:04:18.237154+00
bfae7390-9585-4f80-9a86-cd0b4bfc71af	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	может ли работать модель gemini pro через api, есл	2025-10-24 14:36:46.269193+00
cf1044e5-86f4-4219-946a-0f465eac6efa	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	может ли работать модель gemini pro через api, есл	2025-10-24 14:45:21.689703+00
98d56c20-4f57-4221-8b9a-3451d56f82ea	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	отличие flash от pro	2025-10-24 14:50:53.511791+00
25aa2208-f658-420d-b9ec-87cb57ffae80	f6979247-726b-487c-8b13-ef5e1ae056d9	как корректно настроить авторизацию пользователя в	2025-10-25 07:22:05.903281+00
d87866c5-84bc-49b4-89e7-0d48eae78868	f6979247-726b-487c-8b13-ef5e1ae056d9	как проще всего привязать роли для бизнес приложен	2025-10-25 10:26:50.989677+00
9f543d24-126b-40f9-a428-f954b19c4548	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	площадь франции	2025-10-25 10:36:29.675501+00
2d4679f5-b8d1-4da1-b436-affb19574b32	f6979247-726b-487c-8b13-ef5e1ae056d9	площадь тайланда	2025-10-25 10:37:44.444324+00
1e3575ba-2546-4dae-9296-301d46622cda	f6979247-726b-487c-8b13-ef5e1ae056d9	площадь руанды	2025-10-25 10:54:37.453756+00
d0dc5f50-ebd4-437b-9132-e45405313f99	f6979247-726b-487c-8b13-ef5e1ae056d9	площадь  руанды	2025-10-25 11:08:04.509061+00
b2a37ab2-f36d-4efb-9dc3-9ab4b06a3bfb	f6979247-726b-487c-8b13-ef5e1ae056d9	площадь руанды	2025-10-25 11:09:03.902869+00
5c79d89f-d09c-4576-9ef3-3e381515879b	f6979247-726b-487c-8b13-ef5e1ae056d9	площадь румынии	2025-10-25 13:29:24.302456+00
25fbde9a-8cfe-45a0-a35e-18294dcc8031	f6979247-726b-487c-8b13-ef5e1ae056d9	приведи список 5 самых больших стран азии и африки	2025-10-25 14:26:54.706074+00
b90d21b0-68f1-4d86-a47e-c5fddbf00937	f6979247-726b-487c-8b13-ef5e1ae056d9	расстояние от земли до луны	2025-10-25 17:48:43.873821+00
2c2b2f0a-32e0-44ad-9c76-0f81ac1de54c	b207c1f2-dd20-4e5d-b01f-59d972cec30e	какая средняя генподрядная наценка в россии  и мир	2025-10-25 21:30:39.570011+00
ebcccf6a-9cdf-4b03-bf11-113f88ebff8f	f6979247-726b-487c-8b13-ef5e1ae056d9	я разрабатываю приложение для работы с ai моделями	2025-10-27 06:21:19.359528+00
036c01d3-10c3-4861-896f-e30139ee5230	702cf750-b8ea-4bb9-b553-c8eabda2dd9d	gpt при работе через api использует сервис Assista	2025-10-27 08:43:50.949475+00
153b06f9-02e7-4271-b828-f5108f85c2f9	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	динамика добываемого газа в сша	2025-10-28 12:31:06.447693+00
7cc5a4dd-9c87-4f60-af17-522a59c05c66	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	динамика добываемого газа в сша	2025-10-28 12:32:39.811587+00
47a900ad-270e-44f4-a50d-0d1ffc20c65f	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	самые простые модели rag для анализа документации,	2025-10-28 12:40:42.937064+00
968ae644-b82a-4e62-af4f-9da78340ce3d	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	самые простые модели rag для анализа документации,	2025-10-28 12:42:16.424529+00
b069a442-77a9-4f39-a25c-b56ceab770ac	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	самые простые модели rag для анализа документации,	2025-10-28 12:43:23.078648+00
7dd7535a-dc9b-4b4b-9c1f-a6dcc1eab666	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	формулы воды	2025-10-28 12:45:00.442374+00
66120a41-f14c-4a55-b871-a16ebcf3db2e	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	состав воздуха	2025-10-28 12:46:35.844987+00
72ced4b4-cb9a-4abb-a4f8-10d25c73a1b8	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	состав воды	2025-10-28 12:53:11.817229+00
43d3c3d0-9208-42be-bfb2-ffc68641e068	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	состав лавы	2025-10-28 12:58:02.716169+00
\.


--
-- Data for Name: messages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.messages (id, conversation_id, user_id, role, content, model, token_count, created_at) FROM stdin;
94d9cc1d-00c2-4a4b-bf04-48e2ec318ab0	b57f5ce8-f65c-4057-af71-797e3d3299c6	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	user	назови площадь территории сша	\N	\N	2025-10-24 10:35:29.746311+00
d78fe86a-0108-45db-990e-148471064ead	b57f5ce8-f65c-4057-af71-797e3d3299c6	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	assistant	Площадь территории США составляет **9 833 520 км²**.\n\nЭто значение включает в себя площадь всех 50 штатов и федерального округа Колумбия.\n\nДля более полного понимания часто используются два показателя:\n\n1.  **Только суша:** ≈ 9 147 590 км²\n2.  **Общая площадь (суша + внутренние воды):** ≈ 9 833 520 км²\n\nИменно вторая цифра является общепринятой и используется для сравнения с другими странами. По этому показателю США занимают **четвёртое место в мире** по площади после России, Канады и Китая.	\N	\N	2025-10-24 10:35:36.619194+00
0827b332-0c14-487c-939c-0196b4296558	b57f5ce8-f65c-4057-af71-797e3d3299c6	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	user	а какой периметр сша	\N	\N	2025-10-24 11:12:27.314739+00
bf2271ea-1622-4a33-a07c-7043dd17e501	b57f5ce8-f65c-4057-af71-797e3d3299c6	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	assistant	Это очень интересный вопрос, на который нет одного простого ответа, в отличие от площади.\n\n**Короткий ответ: официально установленного периметра США не существует.** Причина в том, что длина границы сильно зависит от метода измерения.\n\nВот основные данные, которые обычно приводятся:\n\n### 1. Общая протяженность границ (включая побережье)\n\nЭто самый часто упоминаемый показатель. **Общая длина сухопутных границ и береговой линии США составляет примерно 125 600 км.**\n\nЭта цифра складывается из:\n\n*   **Береговая линия:** ~ 95 500 км\n    *   Это не прямая линия, а все изгибы, заливы и мысы побережья Атлантического, Тихого океанов, Мексиканского залива, Аляски и Гавайев.\n*   **Сухопутные границы:** ~ 12 000 км\n    *   С Канадой: ~ 8 893 км (включая границу с Аляской)\n    *   С Мексикой: ~ 3 145 км\n\n### 2. Периметр "континентальной" части США (соседние штаты)\n\nЕсли представить себе прямоугольник, в который заключены 48 соседних штатов, его примерный периметр будет составлять **около 13 000 - 14 000 км**. Но это очень грубая и условная оценка.\n\n### Почему нет точной цифры?\n\n1.  **Эффект береговой линии:** Это главная причина. Длина побережья зависит от масштаба измерения. Если мерить по карте крупного масштаба, получится одна цифра. Если учитывать каждый маленький заливчик и скалу (более мелкий масштаб), длина будет намного больше. Это классическая географическая проблема, известная как "парадокс береговой линии".\n2.  **Сложный рельеф границ:** Границы проходят по рекам, горным хребтам и не являются идеальными прямыми.\n\n**Вывод:** Вместо понятия "периметр" для США используется понятие **"общая протяженность границ"**, и она составляет **около 125 600 километров**.	\N	\N	2025-10-24 11:12:48.495817+00
4a83e795-2464-4cf5-ab45-39d16fe921c8	b57f5ce8-f65c-4057-af71-797e3d3299c6	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	user	сделай таблицу с 5 самыми крпными странами по площади	\N	\N	2025-10-24 11:13:28.509569+00
fffbac89-36a0-4950-b547-2499396cdadc	b57f5ce8-f65c-4057-af71-797e3d3299c6	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	assistant	Конечно, вот таблица с пятью крупнейшими странами мира по площади.\n\n### Крупнейшие страны мира по площади\n\n| № | Страна | Площадь (км²) | Континент |\n|---|--------|---------------|-----------|\n| 1 | Россия | ~ 17 098 246 | Европа / Азия |\n| 2 | Канада | ~ 9 984 670 | Северная Америка |\n| 3 | **США** | **~ 9 833 520** | Северная Америка |\n| 4 | Китай | ~ 9 596 960 | Азия |\n| 5 | Бразилия | ~ 8 515 770 | Южная Америка |\n\n**Примечание:**\n*   Площадь указана с учетом внутренних вод (озёр, водохранилищ, рек).\n*   США, как обсуждалось ранее, занимают **четвертое место** в мире по этому показателю.	\N	\N	2025-10-24 11:13:38.053669+00
81bcc5bb-49ab-4381-a171-2a570dd3218b	ff9e0340-0361-4501-a791-1d32fb90ceb6	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	user	Назови 5 самых крупных по площади стран европы, и 5 самыхх крупных по населению стран европы. Проанализируй, связаны ли эти 2 параметра	\N	\N	2025-10-24 11:47:07.356965+00
f69c1720-c8a2-4d96-8171-688ef9c1c9fb	ff9e0340-0361-4501-a791-1d32fb90ceb6	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	assistant	Конечно, вот ответ на ваш вопрос.\n\n### 5 самых крупных по площади стран Европы*\n\n1.  **Россия** (европейская часть) — ~3,96 млн км²\n2.  **Украина** — 603,5 тыс. км²\n3.  **Франция** — 551,7 тыс. км² (с учётом заморских территорий)\n4.  **Испания** — 505,9 тыс. км²\n5.  **Швеция** — 450,3 тыс. км²\n\n*Примечание: Если рассматривать только страны, чья территория полностью находится в Европе, то список после России будет таким: Украина, Франция, Испания, Швеция. Казахстан и Турция имеют части в Европе, но обычно не включаются в такие рейтинги.*\n\n---\n\n### 5 самых крупных по населению стран Европы\n\n1.  **Россия** (европейская часть) — ~110 млн чел.\n2.  **Германия** — ~83 млн чел.\n3.  **Великобритания** — ~67 млн чел.\n4.  **Франция** — ~68 млн чел.\n5.  **Италия** — ~59 млн чел.\n\n---\n\n### Анализ связи между площадью и населением\n\nМежду площадью страны и её населением **нет прямой и строгой зависимости**. Эти два параметра связаны сложным образом и зависят от множества других факторов.\n\n**Что подтверждает отсутствие прямой связи:**\n\n1.  **Пример Германии и Великобритании:** Германия (357 тыс. км²) и Великобритания (242 тыс. км²) значительно уступают по площади Украине, Испании или Швеции, но имеют гораздо большее население. Это связано с высокой плотностью населения и уровнем экономического развития.\n2.  **Пример Швеции:** Швеция — одна из крупнейших стран по площади, но её население (~10,5 млн чел.) меньше, чем, например, у Нидерландов (~17,5 млн чел.), чья площадь в 10 раз меньше. Это объясняется суровым климатом и историческими особенностями расселения.\n3.  **Пример Франции:** Франция — единственная страна, которая стабильно входит в обе пятерки, что демонстрирует более сбалансированное соотношение.\n\n**Какие факторы опосредованно связывают площадь и население и объясняют расхождения:**\n\n*   **Плотность населения:** Ключевой показатель. Высокая плотность (как в Германии или Великобритании) означает, что на небольшой территории может проживать много людей благодаря развитой инфраструктуре, урбанизации и экономике.\n*   **Природно-климатические условия:** Огромные территории севера России, Скандинавии или испанские пустоши малопригодны для плотного заселения.\n*   **Исторические и экономические факторы:** Уровень индустриализации, история миграций, экономические центры притяжения (как Рур в Германии или Лондон в Великобритании) играют гораздо большую роль, чем просто размер территории.\n*   **Географическое положение:** Страны в центре Европы с благоприятным климатом и торговыми путями (Германия, Франция, Италия) исторически имели больше предпосылок для роста населения.\n\n**Вывод:**\n\nПлощадь страны создает **потенциал** для размещения большого населения, но не является определяющим фактором. **Реальная численность населения зависит в первую очередь от социально-экономических, исторических и географических условий, которые определяют плотность заселения.** Поэтому списки крупнейших стран по площади и по населению в Европе значительно различаются.	\N	\N	2025-10-24 11:47:42.402355+00
d9b62c61-fed8-4ae9-b494-8a1ba302c416	faea5156-e5c1-40e3-8739-26faa40fced6	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	user	распиши, как нужно подключаться к chat gpt через api	deepseek-chat	\N	2025-10-24 13:14:10.135783+00
849744f0-c708-4b57-8f13-20950c4595c2	faea5156-e5c1-40e3-8739-26faa40fced6	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	assistant	Покажу, как подключиться к OpenAI API (ChatGPT) на разных языках программирования.\n\n## 1. Получение API ключа\n\nСначала получите API ключ:\n1. Зарегистрируйтесь на [platform.openai.com](https://platform.openai.com)\n2. Перейдите в раздел "API Keys"\n3. Создайте новый ключ\n\n## 2. Установка клиента (Python)\n\n```bash\npip install openai\n```\n\n## 3. Базовое подключение (Python)\n\n```python\nimport openai\nfrom openai import OpenAI\n\n# Инициализация клиента\nclient = OpenAI(api_key="your-api-key-here")\n\n# Простой запрос\ndef chat_with_gpt(prompt):\n    try:\n        response = client.chat.completions.create(\n            model="gpt-3.5-turbo",\n            messages=[\n                {"role": "user", "content": prompt}\n            ],\n            max_tokens=150,\n            temperature=0.7\n        )\n        return response.choices[0].message.content\n    except Exception as e:\n        return f"Ошибка: {e}"\n\n# Использование\nresult = chat_with_gpt("Привет! Как дела?")\nprint(result)\n```\n\n## 4. Более продвинутый пример\n\n```python\nimport openai\nfrom openai import OpenAI\n\nclient = OpenAI(api_key="your-api-key-here")\n\ndef advanced_chat(messages, model="gpt-3.5-turbo", temperature=0.7):\n    try:\n        response = client.chat.completions.create(\n            model=model,\n            messages=messages,\n            temperature=temperature,\n            max_tokens=1000,\n            top_p=1.0,\n            frequency_penalty=0.0,\n            presence_penalty=0.0\n        )\n        return response.choices[0].message.content\n    except Exception as e:\n        return f"Ошибка: {e}"\n\n# Пример с историей диалога\nconversation = [\n    {"role": "system", "content": "Ты полезный ассистент."},\n    {"role": "user", "content": "Привет!"},\n    {"role": "assistant", "content": "Здравствуйте! Чем могу помочь?"},\n    {"role": "user", "content": "Расскажи о Python"}\n]\n\nresponse = advanced_chat(conversation)\nprint(response)\n```\n\n## 5. JavaScript/Node.js пример\n\n```bash\nnpm install openai\n```\n\n```javascript\nimport OpenAI from 'openai';\n\nconst openai = new OpenAI({\n  apiKey: 'your-api-key-here',\n});\n\nasync function chatGPT(prompt) {\n  try {\n    const completion = await openai.chat.completions.create({\n      model: "gpt-3.5-turbo",\n      messages: [{ role: "user", content: prompt }],\n      max_tokens: 150,\n    });\n    \n    return completion.choices[0].message.content;\n  } catch (error) {\n    console.error('Ошибка:', error);\n    return null;\n  }\n}\n\n// Использование\nchatGPT("Привет!").then(response => console.log(response));\n```\n\n## 6. Прямой HTTP запрос (cURL)\n\n```bash\ncurl https://api.openai.com/v1/chat/completions \\\n  -H "Content-Type: application/json" \\\n  -H "Authorization: Bearer YOUR_API_KEY" \\\n  -d '{\n    "model": "gpt-3.5-turbo",\n    "messages": [{"role": "user", "content": "Привет!"}],\n    "temperature": 0.7\n  }'\n```\n\n## 7. Важные параметры\n\n- **model**: "gpt-3.5-turbo", "gpt-4", "gpt-4-turbo"\n- **temperature** (0-2): Креативность ответов\n- **max_tokens**: Максимальная длина ответа\n- **top_p**: Альтернатива temperature\n- **frequency_penalty**: Штраф за повторения\n- **presence_penalty**: Штраф за новые темы\n\n## 8. Лучшие практики\n\n1. **Безопасность**: Никогда не храните API ключ в коде\n2. **Переменные окружения**:\n```python\nimport os\napi_key = os.getenv('OPENAI_API_KEY')\n```\n\n3. **Обработка ошибок**: Всегда обрабатывайте исключения\n4. **Лимиты**: Следите за использованием токенов\n\n## 9. Пример с переменными окружения\n\n```python\nimport os\nfrom openai import OpenAI\n\n# Установите переменную окружения: export OPENAI_API_KEY='your-key'\nclient = OpenAI(api_key=os.environ.get('OPENAI_API_KEY'))\n\ndef safe_chat(prompt):\n    if not client.api_key:\n        return "API ключ не найден"\n    \n    try:\n        response = client.chat.completions.create(\n            model="gpt-3.5-turbo",\n            messages=[{"role": "user", "content": prompt}]\n        )\n        return response.choices[0].message.content\n    except Exception as e:\n        return f"Ошибка API: {e}"\n```\n\nНачните с простых запросов и постепенно усложняйте функционал!	deepseek-chat	\N	2025-10-24 13:14:53.732902+00
636c7eb3-f080-45db-8dd8-da706e249893	faea5156-e5c1-40e3-8739-26faa40fced6	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	user	теперь напиши, без примеров кода, как получить api ключ для gemini	deepseek-chat	\N	2025-10-24 13:50:33.577427+00
3e4cb16e-a24e-4fb3-9c4f-315bf494d1d0	faea5156-e5c1-40e3-8739-26faa40fced6	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	assistant	## Получение API ключа для Google Gemini\n\n### 1. **Создание аккаунта Google AI Studio**\n- Перейдите на [makersuite.google.com/app/apikey](https://makersuite.google.com/app/apikey)\n- Войдите в свой Google аккаунт (или создайте новый)\n- Примите условия использования API\n\n### 2. **Создание API ключа**\n- На странице Google AI Studio нажмите "Create API Key"\n- Выберите проект (можно создать новый)\n- Придумайте название для ключа\n- Нажмите "Create API Key"\n\n### 3. **Копирование ключа**\n- После создания ключ отобразится на экране\n- **Скопируйте и сохраните** ключ в безопасном месте\n- Ключ выглядит как длинная строка символов\n\n### 4. **Активация API (если требуется)**\n- Перейдите в [Google Cloud Console](https://console.cloud.google.com)\n- Убедитесь, что API Gemini активирован для вашего проекта\n- Если нет - найдите "Generative Language API" и включите его\n\n### 5. **Проверка доступных моделей**\n- В Google AI Studio можно ознакомиться с доступными моделями:\n  - Gemini Pro (основная модель)\n  - Gemini Pro Vision (для работы с изображениями)\n  - Другие специализированные версии\n\n### 6. **Настройки безопасности**\n- Не делитесь ключом публично\n- Используйте переменные окружения для хранения\n- Регулярно проверяйте квоты использования\n- При компрометации ключа - немедленно создайте новый\n\n### 7. **Начало работы**\n- Ключ готов к использованию сразу после создания\n- Бесплатный лимит: ~60 запросов в минуту\n- Для увеличения лимитов нужно настроить биллинг в Google Cloud\n\n**Важно**: API ключ Gemini предоставляется бесплатно с определенными лимитами, которые можно расширить через Google Cloud Console.	deepseek-chat	\N	2025-10-24 13:50:52.638056+00
d21add86-62fb-425f-8b27-caedb14ccda7	4bbdb8f4-bc3c-4c72-bf63-69562a103265	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	user	может ли работать модель gpt-4o через api, если на счету нет денег	gpt-4o	\N	2025-10-24 13:56:29.937433+00
c6050514-cf07-4b95-b60e-701ce33603b3	56f22c71-19d0-4b79-8c1e-10cf4818750b	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	user	может ли работать модель gemini 1.5 pro через api, если на счету нет денег?	gemini-1.5-pro-latest	\N	2025-10-24 14:04:18.40021+00
cd48f5c8-8a09-4b3e-b053-54fce6a71b28	56f22c71-19d0-4b79-8c1e-10cf4818750b	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	user	может ли работать модель gemini 1.5 pro через api, если на счету нет денег?	gemini-1.5-pro-latest	\N	2025-10-24 14:04:28.049994+00
802ef11d-2b76-48fa-a42e-98e800923af2	56f22c71-19d0-4b79-8c1e-10cf4818750b	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	user	может ли работать модель gemini 1.5 pro через api, если на счету нет денег?	gemini-pro	\N	2025-10-24 14:08:08.582703+00
1a6b6ed0-5ab4-4b51-9e61-48feb3bba3cb	56f22c71-19d0-4b79-8c1e-10cf4818750b	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	user	может ли работать модель gemini 1.5 pro через api, если на счету нет денег?	gemini-pro	\N	2025-10-24 14:08:14.178125+00
aed90624-2a50-4031-97e0-ab778bf4459d	56f22c71-19d0-4b79-8c1e-10cf4818750b	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	user	может ли работать модель gemini pro через api, если на счету нет денег?	gemini-pro	\N	2025-10-24 14:15:44.059167+00
b5340897-e9c7-44a7-9330-7405319c8d03	56f22c71-19d0-4b79-8c1e-10cf4818750b	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	user	может ли работать модель gemini pro через api, если на счету нет денег?	gemini-pro	\N	2025-10-24 14:22:47.786214+00
b99533ac-b9db-47b6-b94a-0cc21aea07e8	56f22c71-19d0-4b79-8c1e-10cf4818750b	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	user	может ли работать модель gemini pro через api, если на счету нет денег?	gemini-pro	\N	2025-10-24 14:34:17.847205+00
fc773f77-8f7f-45c6-9fe1-b7c4c76fbb99	56f22c71-19d0-4b79-8c1e-10cf4818750b	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	user	может ли работать модель gemini pro через api, если на счету нет денег?	gemini-pro	\N	2025-10-24 14:34:26.248054+00
d4eba6d1-c321-458d-82a6-d20bbe1ebd2f	56f22c71-19d0-4b79-8c1e-10cf4818750b	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	user	может ли работать модель gemini pro через api, если на счету нет денег?	gemini-pro	\N	2025-10-24 14:36:10.518391+00
65349e2b-e4bf-4689-b759-473d40eb1bf0	56f22c71-19d0-4b79-8c1e-10cf4818750b	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	user	может ли работать модель gemini pro через api, если на счету нет денег?	deepseek-chat	\N	2025-10-24 14:36:25.589078+00
d8d23d3b-1e3c-4e23-b3ae-cd55df0d5439	bfae7390-9585-4f80-9a86-cd0b4bfc71af	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	user	может ли работать модель gemini pro через api, если на счету нет денег?	gemini-pro	\N	2025-10-24 14:36:46.405183+00
fda2cbdc-aa08-4375-9a3e-55f27897598e	56f22c71-19d0-4b79-8c1e-10cf4818750b	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	assistant	Отличный вопрос, который волнует многих. Давайте разберем его подробно.\n\n**Короткий ответ: Нет, не может.**\n\nЕсли на вашем счету в Google Cloud (или Vertex AI) нет денег или доступный кредит израсходован, API-запросы к моделям Gemini (как 1.5 Pro, так и Pro) выполняться не будут. Вы получите ошибку, связанную с недостатком средств.\n\n---\n\n### Подробное объяснение\n\nGoogle Cloud — это коммерческая платформа, и использование ее сервисов, включая AI-модели через API, является платным. Вот как это устроено:\n\n1.  **Бесплатный пробный период:** Google Cloud предоставляет **новым пользователям** бесплатный пробный период, который включает стартовый кредит (обычно $300). В течение этого периода и пока есть кредит, вы можете бесплатно использовать API Gemini в рамках установленных квот.\n2.  **Бесплатный tier (уровень):** После окончания пробного периода или исчерпания кредита для некоторых сервисов существует постоянный бесплатный уровень с ограниченными квотами. **Важно:** На момент написания этого ответа (июнь 2024) модели **Gemini 1.5 Pro и Gemini Pro НЕ входят в постоянный бесплатный уровень**. Бесплатный tier обычно распространяется на более старые или менее мощные модели.\n3.  **Работа после пробного периода:** Как только ваш пробный период закончится и кредит будет израсходован, или если вы его отмените досрочно, все платные сервисы, включая Gemini API, будут отключены. Для их возобновления вам необходимо будет привязать действующий способ оплаты (банковскую карту) и иметь положительный баланс счета.\n\n### Что делать, если вы хотите использовать Gemini API бесплатно?\n\nЕсть два законных способа:\n\n1.  **Воспользоваться бесплатным пробным периодом:** Если вы новый пользователь, зарегистрируйтесь в Google Cloud и активируйте пробный период с $300. Этого хватит на очень большое количество запросов к Gemini API для личного использования и экспериментов.\n2.  **Использовать бесплатные квоты других моделей:** Если вам нужен API для простых задач, вы можете изучить, какие модели *входят* в постоянный бесплатный уровень Google Cloud (например, некоторые версии PaLM API, но их поддержка может быть прекращена в пользу Gemini).\n\n### Важная альтернатива: Google AI Studio\n\nЕсли вам нужно просто потестировать модель без коммерческих целей и написания сложного кода, обратите внимание на **Google AI Studio**.\n\n*   **Это веб-интерфейс** для быстрого прототипирования и взаимодействия с моделями Gemini.\n*   Для доступа к нему используется ваша обычная учетная запись Google.\n*   Он имеет **собственный бесплатный лимит запросов** (на момент написания — 60 запросов в минуту для Gemini 1.5 Pro), который не привязан к вашему счету Google Cloud.\n*   Это самый простой способ "поиграть" с Gemini без необходимости создания проекта в Google Cloud и беспокойства о счетах.\n\n**Итог:**\n\nДля работы с **Gemini Pro** и **Gemini 1.5 Pro** через API необходим активный и оплаченный проект Google Cloud. Если на счету нет денег, API перестанет отвечать. Для бесплатного использования либо воспользуйтесь пробным периодом в Google Cloud, либо тестируйте модель через Google AI Studio.	deepseek-chat	\N	2025-10-24 14:36:57.607631+00
c4d220cf-d3d6-4527-b7e2-a7016958e411	bfae7390-9585-4f80-9a86-cd0b4bfc71af	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	user	может ли работать модель gemini pro через api, если на счету нет денег?	deepseek-chat	\N	2025-10-24 14:44:30.119109+00
890b8a2e-fd9a-43a2-bff3-a159efbea2ee	bfae7390-9585-4f80-9a86-cd0b4bfc71af	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	assistant	Отличный вопрос. Давайте разберем его подробно.\n\n**Короткий ответ: Нет, не может.**\n\nДля работы с Gemini Pro через официальный API необходим аккаунт в Google AI Studio, который привязан к платежному аккаунту Google Cloud. Даже если используется бесплатный лимит, наличие действующего платежного аккаунта является обязательным требованием.\n\n---\n\n### Подробное объяснение:\n\n1.  **Бесплатный лимит (Free Tier):**\n    *   У Google действительно есть бесплатный ежемесячный лимит для Gemini Pro. На момент написания этого ответа он составляет **60 запросов в минуту** и **1500 запросов в день**.\n    *   **НО КЛЮЧЕВОЙ МОМЕНТ:** Этот бесплатный лимит действует **только при наличии привязанного и проверенного платежного аккаунта**. Система использует данные вашей карты для идентификации и как страховку на случай, если вы превысите бесплатные квоты.\n\n2.  **Почему требуется платежный аккаунт?**\n    *   **Верификация:** Это способ Google убедиться, что вы реальный человек, а не бот, который будет создавать тысячи аккаунтов для злоупотреблений.\n    *   **Защита от злоупотреблений:** Ограничивает спам и нецелевое использование API.\n    *   **Автоматический переход на платную модель:** Если вы исчерпаете бесплатный лимит и продолжите использовать API, списания будут происходить автоматически с вашего привязанного счета. Вы можете установить лимиты бюджета, чтобы контролировать расходы.\n\n3.  **Что будет, если на счету нет денег?**\n    *   Если у вас привязан платежный аккаунт, но на счете Google Cloud недостаточно средств (или карта expired), и вы исчерпали бесплатный лимит, ваши API-запросы начнут завершаться с ошибкой. Вам придут уведомления от Google о необходимости пополнения счета.\n    *   Если же вы только создаете аккаунт и пытаетесь не привязывать карту, вы просто не получите доступ к API-ключу.\n\n---\n\n### Альтернативы, если у вас нет денег или карты:\n\n1.  **Google AI Studio (ранее MakerSuite):**\n    *   Это самый простой способ попробовать Gemini Pro **без API** и без строгой необходимости в платежном аккаунте (требуется только аккаунт Google). Здесь вы можете вручную общаться с моделью через веб-интерфейс, проводить эксперименты и даже создавать небольшие прототипы чатов. Но для интеграции в свое приложение этот способ не подойдет.\n\n2.  **Другие модели с более щедрым бесплатным тарифом:**\n    *   **OpenAI:** Дает стартовый кредит ($5) при регистрации для пробного использования их API. Этого хватит на тысячи запросов к не самым мощным моделям.\n    *   **Hugging Face:** Предоставляет бесплатный доступ к тысячам моделей через их Inference API, хотя с лимитами по скорости и количеству запросов.\n    *   **Yandex Cloud (YandexGPT):** Также имеет бесплатный грант для новых пользователей, который можно использовать для их моделей.\n    *   **Ollama:** Если у вас есть более-менее современный компьютер, вы можете запускать бесплатные открытые модели (например, Llama, Mistral) локально у себя на машине через фреймворк Ollama. Это полностью бесплатно, но требует вычислительных ресурсов вашего ПК.\n\n### Итог:\n\nДля полноценной работы с **Gemini Pro через API** платежный аккаунт с привязанной картой **обязателен**, даже в рамках бесплатного лимита. Если вы не можете или не хотите его привязывать, используйте Google AI Studio для тестирования или рассмотрите альтернативные платформы.	deepseek-chat	\N	2025-10-24 14:45:07.413009+00
46f7d30a-1958-47da-9c1a-bc33e5ee3872	cf1044e5-86f4-4219-946a-0f465eac6efa	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	user	может ли работать модель gemini pro через api, если на счету нет денег?	gemini-1.5-pro-latest	\N	2025-10-24 14:45:21.821863+00
1e28d930-447f-4a39-995e-e78a7f9669de	98d56c20-4f57-4221-8b9a-3451d56f82ea	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	user	отличие flash от pro	gemini-2.5-flash	\N	2025-10-24 14:50:53.630974+00
55c9aa21-bfb0-48ce-91f8-4bc3075f3d6f	98d56c20-4f57-4221-8b9a-3451d56f82ea	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	assistant	Ваш вопрос очень интересный, так как "Flash" — это конкретный продукт, а "Pro" часто является частью названия многих продуктов Adobe (Premiere Pro, Audition Pro, Lightroom Classic, Photoshop Elements и т.д.).\n\nЯ предполагаю, что под "Flash" вы имеете в виду **Adobe Flash Professional** (теперь **Adobe Animate**), а под "Pro" — наиболее часто контрастируемый с ним видеоредактор **Adobe Premiere Pro**.\n\nДавайте рассмотрим отличия между **Adobe Animate (бывший Flash)** и **Adobe Premiere Pro**.\n\n---\n\n### Adobe Animate (ранее Flash Professional)\n\n*   **Основное назначение:** Создание 2D-анимации, интерактивного контента, игр, мультфильмов и веб-баннеров.\n*   **Тип контента:** В основном работает с **векторной графикой**, что позволяет масштабировать объекты без потери качества. Также поддерживает растровые изображения и видео.\n*   **Принципы работы:**\n    *   **Покадровая анимация (Frame-by-frame animation):** Создание движения путем изменения объектов в каждом кадре.\n    *   **Анимация с промежуточными кадрами (Tweening):** Программа автоматически генерирует промежуточные кадры между ключевыми (движение, изменение формы, прозрачности и т.д.).\n    *   **Символы (Symbols):** Многократно используемые объекты (графика, кнопки, клипы), которые можно анимировать независимо.\n    *   **Скриптинг (ActionScript / JavaScript):** Возможность добавлять интерактивность и логику с помощью кода.\n*   **Типичные задачи:**\n    *   Создание персонажной 2D-анимации для мультфильмов.\n    *   Разработка интерактивных веб-игр и приложений.\n    *   Создание анимированных веб-баннеров и инфографики.\n    *   Экспорт анимации для разных платформ (HTML5 Canvas, WebGL, SVG, видео).\n*   **Выходные форматы (современные):** HTML5 Canvas, WebGL, SVG, MOV, MP4, GIF, PNG и др. (SWF для веба в основном устарел).\n\n### Adobe Premiere Pro\n\n*   **Основное назначение:** Нелинейный монтаж видео и аудио, постпродакшн.\n*   **Тип контента:** В основном работает с **растровым видео** (футажами с камер, захваченным видео), аудиофайлами, растровыми изображениями и статической графикой.\n*   **Принципы работы:**\n    *   **Нелинейный монтаж (NLE - Non-Linear Editing):** Позволяет редактировать видео, аудио и графику на многодорожечной временной шкале в любом порядке, без повреждения исходных файлов.\n    *   **Редактирование клипов:** Обрезка, склейка, перемещение, изменение скорости, масштаба и положения.\n    *   **Переходы (Transitions):** Эффекты для плавного или эффектного перехода между клипами.\n    *   **Видеоэффекты (Video Effects):** Цветокоррекция, стилизация, искажения, стабилизация и многое другое.\n    *   **Работа со звуком:** Регулировка громкости, удаление шума, применение аудиоэффектов, микширование.\n    *   **Интеграция:** Тесная интеграция с After Effects (для сложной графики и VFX), Audition (для профессиональной обработки звука), Photoshop и Illustrator (для статичных изображений).\n*   **Типичные задачи:**\n    *   Монтаж фильмов, документальных фильмов, телевизионных программ.\n    *   Создание видеоблогов, YouTube-контента.\n    *   Редактирование корпоративных видеороликов, рекламных роликов.\n    *   Обработка отснятого материала с камер, дронов, смартфонов.\n*   **Выходные форматы:** MP4, MOV, AVI, FLV, MPEG, WMV и множество других видео- и аудиоформатов для различных платформ (YouTube, Vimeo, TV, Blu-ray и т.д.).\n\n---\n\n### Ключевые отличия в таблице\n\n| Характеристика      | Adobe Animate (бывший Flash)                  | Adobe Premiere Pro                               |\n| :------------------ | :--------------------------------------------- | :----------------------------------------------- |\n| **Основная цель**   | Создание 2D-анимации, интерактивного контента | Нелинейный монтаж и постпродакшн видео и аудио   |\n| **Тип данных**      | Векторная графика, растровые изображения, код  | Растровое видео, аудио, изображения              |\n| **Фокус**           | Анимация, рисование, интерактивность           | Редактирование, сборка, цветокоррекция, звук     |\n| **Основной процесс** | Рисование, покадровая анимация, твининг, скриптинг | Обрезка, склейка, аранжировка, эффекты, микширование |\n| **Для чего подойдет** | Мультфильмы, игры, веб-баннеры, интерактивные презентации | Фильмы, видеоблоги, реклама, документальные фильмы |\n| **Ключевые инструменты** | Инструменты для рисования, временная шкала, символы, ActionScript/JavaScript | Многодорожечная временная шкала, инструменты монтажа, эффекты, Lumetri Color |\n| **Роль на рынке**   | Инструмент для создания оригинальной анимации и интерактивного контента | Инструмент для работы с существующим видеоматериалом |\n\n---\n\n**Вывод:**\n\n*   Используйте **Adobe Animate (Flash)**, если вам нужно **создать собственную 2D-анимацию с нуля**, нарисовать персонажей, сделать интерактивный контент или легкую игру.\n*   Используйте **Adobe Premiere Pro**, если вам нужно **отредактировать уже отснятое видео**, склеить различные фрагменты, добавить музыку, эффекты, цветокоррекцию и получить готовый видеоролик.\n\nЭто два совершенно разных инструмента с разными целями и принципами работы, хотя оба они могут быть частью общего процесса создания мультимедийного контента. Например, анимацию, сделанную в Animate, можно экспортировать как видео и затем смонтировать в Premiere Pro с другими видеоматериалами.	gemini-2.5-flash	\N	2025-10-24 14:51:24.454472+00
5bc890af-622e-445a-ab3e-1e5cdca9f667	25aa2208-f658-420d-b9ec-87cb57ffae80	f6979247-726b-487c-8b13-ef5e1ae056d9	user	как корректно настроить авторизацию пользователя в корпоративном портале через supabase	gemini-2.5-flash	\N	2025-10-25 07:22:06.293132+00
b9fea3e5-0461-4258-b7dc-4dbd20f79603	25aa2208-f658-420d-b9ec-87cb57ffae80	f6979247-726b-487c-8b13-ef5e1ae056d9	assistant	Настройка авторизации пользователя в корпоративном портале через Supabase требует внимания к безопасности, управлению ролями и интеграции с существующими корпоративными системами (если таковые есть). Ниже представлен подробный план и рекомендации.\n\n---\n\n### I. Обзор и Предварительные Шаги\n\n1.  **Понимание Supabase Auth:**\n    *   Supabase использует GoTrue для аутентификации.\n    *   Он предоставляет готовые методы для регистрации (Sign Up), входа (Sign In) по email/паролю, через OAuth (Google, Azure AD, GitHub и др.), Magic Link, SMS OTP.\n    *   Управляет сессиями и токенами JWT.\n    *   Важно различать **аутентификацию** (кто ты?) и **авторизацию** (что тебе разрешено делать?). Supabase Auth занимается первым, а **Row Level Security (RLS)** и кастомные роли в базе данных — вторым.\n\n2.  **Предварительные Требования:**\n    *   Аккаунт Supabase и созданный проект.\n    *   Клиентская библиотека `supabase-js` установлена в вашем проекте (например, React, Next.js, Vue, Angular).\n    *   Базовые знания SQL и JavaScript.\n\n---\n\n### II. Настройка Проекта Supabase\n\n#### A. Включение Методов Аутентификации\n\n1.  **Email/Password (E-mail/Пароль):**\n    *   Перейдите в ваш проект Supabase -> "Authentication" -> "Settings".\n    *   Убедитесь, что "Enable Email Signup" и "Enable Password Signups" включены.\n    *   **Важно для корпоративного портала:** Вы можете отключить "Enable Email Confirmations" (если вы предпочитаете, чтобы администратор приглашал пользователей или подтверждал их вручную) или настроить шаблоны подтверждения. Для корпоративного портала чаще используется админское приглашение или SSO, а не свободная регистрация.\n    *   Настройте "Email Templates" для писем подтверждения, сброса пароля и т.д., используя корпоративный брендинг.\n\n2.  **OAuth (Single Sign-On, SSO):**\n    *   **Рекомендуется для корпоративного портала.** Позволяет пользователям входить через их существующие корпоративные аккаунты (например, Google Workspace, Azure Active Directory).\n    *   В "Authentication" -> "Providers" включите нужные:\n        *   **Google:** Потребуются `Client ID` и `Client Secret` из Google Cloud Console.\n        *   **Azure Active Directory:** Потребуются `Client ID`, `Client Secret`, `Tenant ID` из вашего Azure AD.\n        *   Другие провайдеры (GitHub, GitLab) могут быть полезны для разработчиков.\n    *   Следуйте инструкциям Supabase для каждого провайдера, чтобы получить необходимые ключи и настроить `Redirect URI`.\n\n3.  **Magic Link / SMS OTP (Опционально):**\n    *   **Magic Link:** Вход по ссылке, отправленной на email. Удобно, но для корпоративного портала может быть менее безопасно, чем пароль + MFA или SSO. Можно использовать для быстрого входа без пароля.\n    *   **SMS OTP:** Вход по коду из SMS. Требует интеграции с провайдером SMS (Twilio, MessageBird). Хорошо подходит для MFA.\n\n#### B. Настройка Таблицы Профилей (`public.profiles`)\n\nSupabase автоматически создает таблицу `auth.users` для базовых данных пользователя. Однако, для хранения специфических корпоративных данных (ФИО, должность, отдел, фотография) и управления ролями, вам нужна отдельная таблица:\n\n1.  **Создайте таблицу `public.profiles`:**\n    ```sql\n    CREATE TABLE public.profiles (\n      id UUID REFERENCES auth.users(id) PRIMARY KEY,\n      full_name TEXT,\n      avatar_url TEXT,\n      department TEXT,\n      position TEXT,\n      -- Дополнительные поля\n      created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()\n    );\n    ```\n\n2.  **Создайте триггер для автоматического создания профиля:**\n    При создании нового пользователя в `auth.users`, автоматически создаем запись в `public.profiles`.\n    ```sql\n    CREATE FUNCTION public.handle_new_user()\n    RETURNS TRIGGER AS $$\n    BEGIN\n      INSERT INTO public.profiles (id, full_name, avatar_url)\n      VALUES (NEW.id, NEW.email, NULL); -- Можно передать email как начальное имя\n      RETURN NEW;\n    END;\n    $$ LANGUAGE plpgsql SECURITY DEFINER;\n\n    CREATE TRIGGER on_auth_user_created\n      AFTER INSERT ON auth.users\n      FOR EACH ROW EXECUTE PROCEDURE public.handle_new_user();\n    ```\n    *Совет:* В корпоративном сценарии `full_name` может быть инициализирован из OAuth провайдера, если он предоставляет эту информацию.\n\n#### C. Управление Ролями и Авторизацией (RBAC - Role-Based Access Control)\n\nДля корпоративного портала критически важно иметь систему ролей (Администратор, Сотрудник, Менеджер, HR и т.д.).\n\n1.  **Создайте таблицу для ролей:**\n    ```sql\n    CREATE TABLE public.user_roles (\n      user_id UUID REFERENCES auth.users(id) ON DELETE CASCADE,\n      role TEXT NOT NULL,\n      PRIMARY KEY (user_id, role)\n    );\n\n    -- Пример ролей\n    INSERT INTO public.user_roles (user_id, role) VALUES\n    ('uuid-пользователя-админа', 'admin'),\n    ('uuid-пользователя-менеджера', 'manager');\n    ```\n\n2.  **Расширьте JWT токен для включения ролей:**\n    Это позволит фронтенду и RLS быстро получать роли пользователя без дополнительных запросов.\n    *   В Supabase -> "Database" -> "SQL Editor" выполните:\n        ```sql\n        -- Создаем функцию для получения ролей\n        CREATE OR REPLACE FUNCTION public.get_user_roles(user_uuid uuid)\n        RETURNS SETOF TEXT AS $$\n          SELECT role FROM public.user_roles WHERE user_id = user_uuid;\n        $$ LANGUAGE sql STABLE;\n\n        -- Добавляем роли в JWT claim\n        ALTER PUBLICATION supabase_realtime ADD COLUMN user_roles TEXT[] (SELECT ARRAY(SELECT public.get_user_roles(auth.uid())));\n        ```\n    *   *Примечание:* Это пример синтаксиса, возможно, вам потребуется немного другая логика для `ALTER PUBLICATION` или использование `custom_claims_hook` в `auth` настройках, если вы хотите динамически добавлять кастомные данные в JWT. Более простой способ - просто выполнять запрос к `public.user_roles` на сервере или в RLS.\n\n#### D. Row Level Security (RLS)\n\nRLS — это основа безопасности ваших данных в Supabase.\n\n1.  **Включите RLS:**\n    Для каждой таблицы, которую нужно защитить (например, `public.profiles`, `public.documents`, `public.user_roles`):\n    ```sql\n    ALTER TABLE public.profiles ENABLE ROW LEVEL SECURITY;\n    ALTER TABLE public.user_roles ENABLE ROW LEVEL SECURITY;\n    -- И так далее для всех таблиц\n    ```\n\n2.  **Создайте политики RLS:**\n    Политики определяют, какие пользователи могут читать/писать/обновлять/удалять данные. Используйте `auth.uid()` (ID текущего пользователя) и `auth.role()` (системная роль пользователя, обычно `authenticated`, `anon`). Для кастомных ролей, которые мы добавили, нужно делать подзапрос.\n\n    *   **Пример: Политика для `public.profiles` (пользователь может видеть свой профиль и, возможно, ограниченные данные других):**\n        ```sql\n        -- Пользователь может видеть и редактировать свой профиль\n        CREATE POLICY "Users can view and update their own profile" ON public.profiles\n        FOR ALL USING (auth.uid() = id) WITH CHECK (auth.uid() = id);\n\n        -- Администратор может видеть все профили\n        CREATE POLICY "Admins can view all profiles" ON public.profiles\n        FOR SELECT TO authenticated\n        USING (EXISTS (SELECT 1 FROM public.user_roles WHERE user_id = auth.uid() AND role = 'admin'));\n\n        -- Пользователи могут видеть основные данные других (например, ФИО, должность)\n        CREATE POLICY "Authenticated users can view basic profiles of others" ON public.profiles\n        FOR SELECT TO authenticated\n        USING (TRUE); -- Или более сложное условие, например, только для своего отдела\n        ```\n\n    *   **Пример: Политика для `public.user_roles` (только администратор может изменять роли):**\n        ```sql\n        CREATE POLICY "Admins can manage user roles" ON public.user_roles\n        FOR ALL TO authenticated\n        USING (EXISTS (SELECT 1 FROM public.user_roles WHERE user_id = auth.uid() AND role = 'admin'));\n\n        CREATE POLICY "Users can view their own roles" ON public.user_roles\n        FOR SELECT TO authenticated\n        USING (user_id = auth.uid());\n        ```\n\n#### E. Политики Безопасности Supabase Auth\n\n1.  **Ограничения Пароля:** В "Authentication" -> "Settings" настройте минимальную длину пароля и требования к сложности (например, включать цифры, символы).\n2.  **Multi-Factor Authentication (MFA):** Supabase поддерживает MFA. Вы можете включить его в "Authentication" -> "MFA Settings". Это очень рекомендуется для корпоративных порталов.\n3.  **Защита от brute-force:** Supabase Auth имеет встроенные механизмы защиты от перебора паролей.\n\n---\n\n### III. Интеграция с Фронтендом (Пример на `supabase-js`)\n\n#### A. Инициализация Клиента Supabase\n\n```javascript\nimport { createClient } from '@supabase/supabase-js';\n\nconst supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL;\nconst supabaseAnonKey = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY;\n\nexport const supabase = createClient(supabaseUrl, supabaseAnonKey);\n```\n*Всегда используйте переменные окружения для ключей.*\n\n#### B. Регистрация (Sign Up) / Приглашение Пользователей\n\nВ корпоративном портале чаще всего используется:\n\n1.  **Административное приглашение:**\n    *   Администратор на своей странице отправляет запрос на сервер (или напрямую в Supabase с `service_role` ключом - **очень осторожно!**).\n    *   Серверный код (или Edge Function):\n        ```javascript\n        // Пример с использованием Service Role Key (ТОЛЬКО НА СЕРВЕРЕ!)\n        import { createClient } from '@supabase/supabase-js';\n\n        const supabaseAdmin = createClient(process.env.SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);\n\n        async function inviteUser(email, password = null, role = 'employee') {\n          try {\n            const { data, error } = await supabaseAdmin.auth.admin.inviteUserByEmail(email, {\n              data: { /* любые дополнительные метаданные */ },\n              redirectTo: 'http://your-portal.com/set-password' // Куда перенаправить для установки пароля\n            });\n\n            if (error) throw error;\n\n            // Если успешно, назначить роль\n            await supabaseAdmin.from('user_roles').insert({ user_id: data.user.id, role: role });\n\n            return data;\n          } catch (e) {\n            console.error('Error inviting user:', e.message);\n            throw e;\n          }\n        }\n        ```\n    *   После получения приглашения, пользователь переходит по ссылке и устанавливает пароль.\n\n2.  **Ограниченная самостоятельная регистрация (опционально):**\n    Если разрешена, то после регистрации может требоваться подтверждение администратором.\n\n    ```javascript\n    async function signUpUser(email, password) {\n      const { data, error } = await supabase.auth.signUp({\n        email,\n        password,\n        options: {\n          data: { /* дополнительные метаданные, например, department */ }\n        }\n      });\n      if (error) throw error;\n      // В корпоративном сценарии здесь может быть логика отправки уведомления админу для подтверждения.\n      return data;\n    }\n    ```\n\n#### C. Вход Пользователей (Sign In)\n\n1.  **Email/Пароль:**\n    ```javascript\n    async function signInWithEmail(email, password) {\n      const { data, error } = await supabase.auth.signInWithPassword({\n        email,\n        password,\n      });\n      if (error) throw error;\n      return data;\n    }\n    ```\n\n2.  **OAuth (Google/Azure AD):**\n    ```javascript\n    async function signInWithOAuth(provider) { // 'google' или 'azure'\n      const { data, error } = await supabase.auth.signInWithOAuth({\n        provider: provider,\n        options: {\n          redirectTo: 'http://your-portal.com/dashboard', // Куда вернуться после авторизации\n          // В корпоративном сценарии может быть полезно указать scope или queryParams\n          // queryParams: {\n          //   access_type: 'offline', // Для получения refresh token\n          //   prompt: 'consent'\n          // }\n        }\n      });\n      if (error) throw error;\n      // Пользователь будет перенаправлен на страницу провайдера, а затем обратно.\n    }\n    ```\n\n#### D. Выход (Sign Out)\n\n```javascript\nasync function signOutUser() {\n  const { error } = await supabase.auth.signOut();\n  if (error) console.error('Error signing out:', error.message);\n}\n```\n\n#### E. Управление Сессией и Состоянием Пользователя\n\nИспользуйте `onAuthStateChange` для реактивного обновления состояния пользователя в вашем приложении.\n\n```javascript\nimport React, { useState, useEffect, createContext, useContext } from 'react';\n\nconst AuthContext = createContext(null);\n\nexport const AuthProvider = ({ children }) => {\n  const [session, setSession] = useState(null);\n  const [user, setUser] = useState(null);\n  const [loading, setLoading] = useState(true);\n\n  useEffect(() => {\n    const { data: authListener } = supabase.auth.onAuthStateChange(\n      async (event, currentSession) => {\n        setSession(currentSession);\n        setUser(currentSession?.user || null);\n        setLoading(false);\n      }\n    );\n\n    // Получаем текущую сессию при инициализации\n    supabase.auth.getSession().then(({ data: { session } }) => {\n      setSession(session);\n      setUser(session?.user || null);\n      setLoading(false);\n    });\n\n    return () => authListener.subscription.unsubscribe();\n  }, []);\n\n  // Пример получения ролей пользователя (если они не в JWT)\n  const getUserRoles = async () => {\n    if (!user) return [];\n    const { data, error } = await supabase\n      .from('user_roles')\n      .select('role')\n      .eq('user_id', user.id);\n    if (error) {\n      console.error('Error fetching user roles:', error);\n      return [];\n    }\n    return data.map(r => r.role);\n  };\n\n  const value = {\n    session,\n    user,\n    loading,\n    signInWithEmail,\n    signInWithOAuth,\n    signOutUser,\n    getUserRoles\n  };\n\n  return <AuthContext.Provider value={value}>{!loading && children}</AuthContext.Provider>;\n};\n\nexport const useAuth = () => useContext(AuthContext);\n```\n\n#### F. Защита Маршрутов (Route Protection)\n\nИспользуйте состояние `user` из `AuthContext` для условного рендеринга или перенаправления.\n\n```javascript\nimport { useRouter } from 'next/router';\nimport { useAuth } from '../contexts/AuthContext'; // Путь к вашему AuthContext\n\nconst DashboardPage = () => {\n  const { user, loading } = useAuth();\n  const router = useRouter();\n\n  useEffect(() => {\n    if (!loading && !user) {\n      router.push('/login'); // Перенаправить на страницу входа, если пользователь не аутентифицирован\n    }\n  }, [user, loading, router]);\n\n  if (loading || !user) {\n    return <div>Loading...</div>; // Или спиннер\n  }\n\n  // Здесь логика для аутентифицированного пользователя\n  return (\n    <div>\n      <h1>Добро пожаловать, {user.email}!</h1>\n      {/* Контент портала */}\n    </div>\n  );\n};\n\nexport default DashboardPage;\n```\n\n#### G. Сброс Пароля (Password Reset)\n\n```javascript\nasync function resetPassword(email) {\n  const { data, error } = await supabase.auth.resetPasswordForEmail(email, {\n    redirectTo: 'http://your-portal.com/update-password', // Страница, где пользователь установит новый пароль\n  });\n  if (error) throw error;\n  return data;\n}\n\n// На странице /update-password\nasync function updatePassword(newPassword) {\n  const { error } = await supabase.auth.updateUser({ password: newPassword });\n  if (error) throw error;\n  // Успешно, перенаправить на страницу входа\n}\n```\n\n---\n\n### IV. Расширенные Возможности и Лучшие Практики\n\n1.  **Управление Пользователями (Админ-панель):**\n    *   Создайте админ-панель, где пользователи с ролью `admin` могут просматривать, создавать, редактировать (например, изменять роль или данные в `public.profiles`), отключать или удалять пользователей.\n    *   **Важно:** Для этих операций на бэкенде или в Edge Functions используйте `service_role` ключ Supabase (никогда на фронтенде!), который имеет полные права доступа.\n    *   Примеры: `supabaseAdmin.auth.admin.listUsers()`, `supabaseAdmin.auth.admin.updateUserById()`, `supabaseAdmin.auth.admin.deleteUser()`.\n\n2.  **Аудит (Auditing):**\n    *   Supabase ведет логи аутентификации. Мониторьте их на предмет подозрительной активности (многочисленные неудачные попытки входа).\n    *   Для аудита действий с данными (кто, когда, что изменил) в ваших `public` таблицах, рассмотрите использование триггеров или расширений Postgres (например, `audit.sql`).\n\n3.  **Пользовательские Данные:**\n    *   Всегда храните расширенные данные пользователя в `public.profiles` (или аналогичной таблице), а не в `auth.users`. Это позволяет гибче настраивать RLS и не смешивать системные данные с прикладными.\n\n4.  **Environment Variables:**\n    *   Всегда используйте переменные окружения для чувствительных данных (Supabase URL, Anon Key, Service Role Key). На фронтенде используйте только `anon` ключ.\n\n5.  **Тестирование:**\n    *   Тщательно тестируйте все сценарии аутентификации и авторизации, включая граничные случаи и ошибки.\n\n---\n\n### V. Важные Моменты для Корпоративного Портала\n\n1.  **Строгое Провизионирование Пользователей:**\n    *   В отличие от публичных приложений, корпоративные порталы редко позволяют свободную регистрацию. Предпочитается система приглашений администратором или автоматическая синхронизация с корпоративным IdP (например, Azure AD) через SCIM. Supabase не имеет встроенной поддержки SCIM, но это можно реализовать через сторонние сервисы или собственную логику.\n\n2.  **Интеграция с Корпоративным IDP (SAML/OpenID Connect):**\n    *   Хотя Supabase поддерживает популярные OAuth провайдеры (Google, Azure AD), для крупных компаний может потребоваться поддержка SAML или OpenID Connect с их собственными Identity Providers (Okta, Auth0, ADFS). Это более продвинутая настройка, которая может потребовать использования прокси-сервиса (например, Authelia, Keycloak) перед Supabase или ждать, пока Supabase добавит нативную поддержку.\n\n3.  **Детализированный RBAC:**\n    *   Наша система `user_roles` — это базовый пример. Для сложных порталов может потребоваться более гранулированная система разрешений (например, "can_edit_documents", "can_view_analytics"), которая может быть реализована через таблицу `permissions` и связующую таблицу `role_permissions`.\n\n4.  **Соответствие Требованиям (Compliance):**\n    *   Учитывайте требования GDPR, CCPA или другие региональные нормы при работе с данными пользователей. Supabase помогает с этим, но окончательная ответственность лежит на вас.\n\n---\n\nНастройка авторизации в корпоративном портале с Supabase — это мощный подход, который при правильной реализации обеспечивает высокий уровень безопасности и гибкости. Уделите особое внимание RLS и управлению ролями, так как это ключевые компоненты для защиты корпоративных данных.	gemini-2.5-flash	\N	2025-10-25 07:22:48.694805+00
2536d0ba-4cd6-4232-b2c7-b587fc3fbfe4	25aa2208-f658-420d-b9ec-87cb57ffae80	f6979247-726b-487c-8b13-ef5e1ae056d9	user	отвечай без кода,  кратко. как правильно устанавливать в cursor ai mcp сервера	gemini-2.5-flash	\N	2025-10-25 07:25:36.879123+00
0116ae53-d0fb-44a3-861d-dc38a39b8b55	25aa2208-f658-420d-b9ec-87cb57ffae80	f6979247-726b-487c-8b13-ef5e1ae056d9	assistant	Cursor AI — это среда разработки и редактор кода, а не платформа для хостинга или запуска серверов. Вы не устанавливаете MCP серверы *внутри* Cursor AI.\n\nДля запуска MCP сервера вам потребуется отдельная серверная платформа:\n\n1.  **Выбор Хостинга:** Получите виртуальный или физический сервер (VPS, выделенный сервер) у провайдера.\n2.  **Подключение:** Подключитесь к этому серверу (например, через SSH).\n3.  **Установка Необходимого ПО:** Установите все требуемые зависимости (например, Java для Minecraft серверов) на вашем хостинге.\n4.  **Загрузка Файлов:** Загрузите файлы MCP сервера на ваш хостинг.\n5.  **Конфигурация:** Настройте параметры сервера, используя конфигурационные файлы.\n6.  **Запуск:** Запустите серверный процесс на выбранной платформе.\n\nCursor AI можно использовать для *редактирования* файлов конфигурации или кода вашего MCP сервера перед его загрузкой на хостинг.	gemini-2.5-flash	\N	2025-10-25 07:25:45.026984+00
9ef66c5a-a499-4418-88ad-ecc2922cb7d6	25aa2208-f658-420d-b9ec-87cb57ffae80	f6979247-726b-487c-8b13-ef5e1ae056d9	user	я пользуюсь настольным приложением cursor ai для вайб кодинга. как мне добавить mcp сервера	gemini-2.5-flash	\N	2025-10-25 07:27:13.630746+00
f563ed05-6203-4933-b72c-1a8b3f08b7f5	25aa2208-f658-420d-b9ec-87cb57ffae80	f6979247-726b-487c-8b13-ef5e1ae056d9	assistant	Cursor AI — это среда разработки (IDE), а не хостинг или платформа для запуска серверов. Вы не "добавляете" MCP сервер *внутрь* Cursor AI для его запуска.\n\nВместо этого вы используете Cursor AI для **работы с файлами и кодом, относящимися к серверу**.\n\nВот как это правильно делать:\n\n1.  **Удаленная разработка (Remote - SSH):**\n    *   **Наиболее интегрированный и рекомендуемый способ.** Вы настраиваете подключение к вашему *удаленному серверу*, где уже установлен или будет установлен MCP.\n    *   Cursor AI (поскольку он основан на VS Code) имеет функциональность "Remote - SSH". Это позволяет вам подключиться к удаленной машине через SSH и работать с файлами сервера так, будто они находятся локально на вашем компьютере.\n    *   **Как:** Установите расширение "Remote - SSH" (если оно не встроено), настройте SSH-соединение с вашим MCP сервером, и затем откройте папку сервера прямо в Cursor AI.\n    *   **Преимущества:** Вы можете редактировать конфигурационные файлы, разрабатывать плагины, просматривать логи и запускать команды в терминале сервера — всё прямо из Cursor AI.\n\n2.  **Локальная разработка и деплоймент:**\n    *   Если вы разрабатываете плагины или кастомные моды для MCP, вы держите их исходный код локально на вашем компьютере, открывая проект в Cursor AI.\n    *   После того как вы написали и скомпилировали ваш плагин (.jar файл), вам нужно будет **вручную или с помощью скрипта загрузить его на ваш MCP сервер** (который находится на отдельном хостинге) в папку `plugins`.\n    *   **Как:** Используйте SFTP/SCP клиент (например, FileZilla), команды `scp` в терминале или автоматизированные скрипты для передачи файлов.\n\n**Итог:** Cursor AI поможет вам с написанием кода, редактированием файлов и использованием AI-помощника для проекта MCP сервера, но сам запуск и хостинг сервера происходит на отдельной машине (локальной или удаленной). Вы "добавляете" сервер не в Cursor AI, а Cursor AI "подключается" к файлам на этом сервере или работает с их локальными копиями.	gemini-2.5-flash	\N	2025-10-25 07:27:27.361601+00
17866dff-89cb-44ac-a9a9-54e7393bc39f	25aa2208-f658-420d-b9ec-87cb57ffae80	f6979247-726b-487c-8b13-ef5e1ae056d9	user	я хочу подключить существующие mcp сервера сторонней разработки context7 и brightdata для более эффективной работы модели	gemini-2.5-flash	\N	2025-10-25 07:30:26.606735+00
ff6ccaad-7aec-4cd4-810d-4d0fa246cd0b	25aa2208-f658-420d-b9ec-87cb57ffae80	f6979247-726b-487c-8b13-ef5e1ae056d9	assistant	Отлично, теперь стало намного яснее, что вы имеете в виду под "MCP серверами" в контексте Cursor AI!\n\nMCP здесь, вероятно, означает **"Model Control Plane"** или нечто подобное, а не Minecraft Server. Context7 и BrightData — это провайдеры прокси-серверов и данных, которые могут быть использованы для улучшения работы AI-моделей или доступа к информации.\n\nЕсли вы хотите **подключить Cursor AI к сервисам Context7 и BrightData для более эффективной работы модели (вероятно, AI-модели, встроенной в Cursor, или вашей собственной, которую вы разрабатываете)**, то вот как это обычно делается:\n\nCursor AI, как и любая другая IDE, использует HTTP(S) запросы для взаимодействия с внешними сервисами. Чтобы подключить его к Context7 и BrightData, вам нужно использовать их как **прокси-серверы** для исходящих запросов Cursor AI или вашей модели.\n\nВот краткое пошаговое руководство:\n\n1.  **Настройка Прокси в Cursor AI (или вашем проекте):**\n    *   **Для исходящих запросов Cursor AI:** Если вы хотите, чтобы сам Cursor AI (например, для доступа к определенным API или внешним ресурсам) использовал прокси, вам нужно настроить прокси-сервер на уровне операционной системы или в настройках Cursor AI (если такая опция есть). Это обычно делается через переменные среды (`HTTP_PROXY`, `HTTPS_PROXY`) или GUI-настройки прокси в вашей ОС.\n    *   **Для вашего кода/модели:** Если ваша AI-модель или скрипты, которые вы пишете в Cursor AI, делают HTTP-запросы (например, к веб-сайтам для сбора данных), то вам нужно настроить прокси в **коде вашей модели/скрипта**.\n\n2.  **Получение Деталей Прокси от Context7/BrightData:**\n    *   Зарегистрируйтесь на платформах Context7 и BrightData.\n    *   Создайте необходимые прокси-серверы/доступы.\n    *   Они предоставят вам:\n        *   **Адрес прокси-сервера** (IP-адрес или доменное имя, например, `gate.smartproxy.com`).\n        *   **Порт** (например, `7000`).\n        *   **Имя пользователя и Пароль** для аутентификации на прокси (если требуется).\n        *   Возможно, специфические HTTP-заголовки или другие параметры.\n\n3.  **Интеграция в ваш код (наиболее вероятный сценарий):**\n    *   В коде, который вы пишете в Cursor AI (например, на Python с библиотеками `requests`, `urllib`, `httpx`), вы указываете прокси-сервер перед отправкой запросов.\n    *   **Пример на Python с `requests`:**\n        ```python\n        import requests\n\n        proxies = {\n            'http': 'http://USERNAME:PASSWORD@PROXY_HOST:PROXY_PORT',\n            'https': 'http://USERNAME:PASSWORD@PROXY_HOST:PROXY_PORT',\n            # Или 'https': 'https://USERNAME:PASSWORD@PROXY_HOST:PROXY_PORT' если прокси поддерживает HTTPS напрямую\n        }\n\n        # Замените на ваши данные от BrightData/Context7\n        proxy_username = "YOUR_BRIGHTDATA_USERNAME"\n        proxy_password = "YOUR_BRIGHTDATA_PASSWORD"\n        proxy_host = "geo.brightdata.com" # Пример\n        proxy_port = "22225" # Пример\n\n        proxies = {\n            'http': f'http://{proxy_username}:{proxy_password}@{proxy_host}:{proxy_port}',\n            'https': f'http://{proxy_username}:{proxy_password}@{proxy_host}:{proxy_port}',\n        }\n\n        try:\n            response = requests.get('https://example.com', proxies=proxies)\n            print(response.text)\n        except requests.exceptions.RequestException as e:\n            print(f"Ошибка при запросе через прокси: {e}")\n\n        ```\n    *   Это позволит вашей модели или скрипту отправлять запросы через прокси-серверы BrightData или Context7, что может помочь в обходе блокировок, сборе данных из разных гео-локаций или для более стабильного доступа к внешним ресурсам, необходимым для обучения/работы модели.\n\n**Кратко:**\n1.  Получите учетные данные и адрес прокси от Context7/BrightData.\n2.  В своем коде, который вы пишете и запускаете через Cursor AI, настройте HTTP-запросы на использование этих прокси. Cursor AI сам по себе не "подключается" к ним напрямую, но ваш код, написанный в Cursor AI, будет их использовать.	gemini-2.5-flash	\N	2025-10-25 07:30:35.708147+00
f6bfbc43-af76-4f47-aa57-3218d8053d7b	d87866c5-84bc-49b4-89e7-0d48eae78868	f6979247-726b-487c-8b13-ef5e1ae056d9	user	как проще всего привязать роли для бизнес приложений при аутентификации через supabase	gemini-2.5-flash	\N	2025-10-25 10:26:51.20685+00
02a4f6ea-8428-4447-ad71-0ba27b2c544a	9f543d24-126b-40f9-a428-f954b19c4548	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	user	площадь франции	deepseek-chat	\N	2025-10-25 10:36:29.885538+00
ff702583-0232-48a6-a203-66815d9db2ab	b2a37ab2-f36d-4efb-9dc3-9ab4b06a3bfb	f6979247-726b-487c-8b13-ef5e1ae056d9	assistant	Четвертой по величине страной в Африке является **Ливия**.\n\n**Площадь Ливии:** около **1 759 540 км²**.\n\nТаким образом, Топ-4 крупнейших стран Африки по площади:\n\n1.  **Алжир** (~2,38 млн км²)\n2.  **Демократическая Республика Конго** (~2,34 млн км²)\n3.  **Судан** (~1,89 млн км²)\n4.  **Ливия** (~1,76 млн км²)	gemini-2.5-flash	\N	2025-10-25 11:20:15.276494+00
5b66bcf8-1951-4ba3-ac81-63c169fb19e8	b2a37ab2-f36d-4efb-9dc3-9ab4b06a3bfb	f6979247-726b-487c-8b13-ef5e1ae056d9	assistant	Конечно, вот список из **5 крупнейших стран Африки** по площади:\n\n1.  **Алжир** — ≈ 2 381 741 км²\n2.  **Демократическая Республика Конго** — ≈ 2 344 858 км²\n3.  **Судан** — ≈ 1 886 068 км²\n4.  **Ливия** — ≈ 1 759 540 км²\n5.  **Чад** — ≈ 1 284 000 км²	deepseek-chat	\N	2025-10-25 11:36:49.092277+00
f9f49b28-6251-44f3-b07a-9fe05ba6d48c	9f543d24-126b-40f9-a428-f954b19c4548	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	assistant	Конечно, вот подробная информация о площади Франции.\n\n**Основная территория (Метрополия):**\n*   **547 030 км²** (примерно 551 500 км², включая внутренние водоемы).\n\n**Полная территория (с учетом заморских владений):**\n*   **643 801 км²** — это **самая большая страна в Европейском Союзе** и 42-я по площади в мире.\n\n### Детализация:\n\n1.  **Метрополия (Европейская Франция):**\n    *   Часть страны, расположенная в Европе. Часто ее называют "Шестиугольник" (*L'Hexagone*) из-за ее формы.\n    *   Включает континентальную часть и острова, такие как Корсика в Средиземном море.\n    *   Площадь: **~547 030 км²**.\n\n2.  **Заморская Франция (*France d'outre-mer*):**\n    *   Состоит из 5 заморских департаментов и регионов (Гваделупа, Мартиника, Гвиана, Реюньон, Майотта), а также заморских сообществ и других территорий (например, Французская Полинезия, Новая Каледония, Сен-Мартен и др.).\n    *   Площадь всех заморских территорий: **~96 771 км²**.\n    *   Крупнейшая из них — **Французская Гвиана** в Южной Америке, площадью ~83 534 км².\n\n### Сравнение для наглядности:\n\n*   Площадь Франции (метрополия) примерно равна **сумме площадей Германии и Великобритании**.\n*   Она почти **вдвое больше**, чем площадь Великобритании.\n*   Она чуть **меньше**, чем штат Техас в США (~695 662 км²).\n\n### Ключевой вывод:\n\nКогда говорят о площади Франции в контексте Европы, обычно имеют в виду **метрополию (~547 тыс. км²)**. Если же учитывать все территории по всему миру, то площадь страны составляет **~644 тыс. км²**.	deepseek-chat	\N	2025-10-25 10:36:50.030709+00
58bdfa1a-4f24-4fe7-94b2-2cef08edcc10	2d4679f5-b8d1-4da1-b436-affb19574b32	f6979247-726b-487c-8b13-ef5e1ae056d9	user	площадь тайланда	gemini-2.5-flash	\N	2025-10-25 10:37:44.583488+00
223bd70c-3fc1-4cc0-a0dd-3a6de6e647b5	2d4679f5-b8d1-4da1-b436-affb19574b32	f6979247-726b-487c-8b13-ef5e1ae056d9	assistant	Площадь Таиланда составляет приблизительно **513 120 квадратных километров (км²)**.\n\nЭто также около **198 120 квадратных миль**.	gemini-2.5-flash	\N	2025-10-25 10:37:51.571762+00
eef96774-2084-4145-b7f1-8b851caa73a2	1e3575ba-2546-4dae-9296-301d46622cda	f6979247-726b-487c-8b13-ef5e1ae056d9	user	площадь руанды	deepseek-chat	\N	2025-10-25 10:54:37.638797+00
827bf45d-17b1-4e32-bd3a-2ec6618bee90	d0dc5f50-ebd4-437b-9132-e45405313f99	f6979247-726b-487c-8b13-ef5e1ae056d9	user	площадь  руанды	deepseek-chat	\N	2025-10-25 11:08:05.47+00
c258de48-0e32-40a3-a6f8-0042baed1b39	b2a37ab2-f36d-4efb-9dc3-9ab4b06a3bfb	f6979247-726b-487c-8b13-ef5e1ae056d9	user	площадь руанды	deepseek-chat	\N	2025-10-25 11:09:04.88+00
1b2e4e92-1063-47e5-8358-d228141482a2	b2a37ab2-f36d-4efb-9dc3-9ab4b06a3bfb	f6979247-726b-487c-8b13-ef5e1ae056d9	assistant	Конечно, вот информация о площади Руанды.\n\n**Площадь Руанды составляет 26 338 км².**\n\nЧтобы лучше понять этот размер, вот несколько сравнений:\n\n*   Это чуть **меньше площади Армении** и чуть **больше площади Северной Македонии**.\n*   Среди стран мира Руанда занимает **144-е место** по площади (для сравнения, Россия больше Руанды примерно в 649 раз).\n*   На постсоветском пространстве с ней можно сравнить, например, **Молдову** (33 846 км²).\n\n**Важный контекст:**\n\nНесмотря на небольшую территорию, Руанда является одной из самых густонаселенных стран Африки. Плотность населения здесь очень высокая, что связано с холмистым рельефом страны, который традиционно интенсивно используется для сельского хозяйства (из-за чего Руанду часто называют «Страной тысячи холмов»).\n\nТаким образом, **26 338 квадратных километров** — это официальная площадь Руанды.	deepseek-chat	\N	2025-10-25 11:09:15.143925+00
11343b18-6157-4ffa-8748-133af99cf827	b2a37ab2-f36d-4efb-9dc3-9ab4b06a3bfb	f6979247-726b-487c-8b13-ef5e1ae056d9	user	она больше или меньше площади юар	deepseek-chat	\N	2025-10-25 11:09:29.829+00
5cf33bf4-9aae-49a5-afe7-26e1a455dbaa	b2a37ab2-f36d-4efb-9dc3-9ab4b06a3bfb	f6979247-726b-487c-8b13-ef5e1ae056d9	user	она больше или меньше площади юар	deepseek-chat	\N	2025-10-25 11:12:20.339+00
12160a86-6026-455b-8683-4a2f563fa81f	b2a37ab2-f36d-4efb-9dc3-9ab4b06a3bfb	f6979247-726b-487c-8b13-ef5e1ae056d9	assistant	Руанда **значительно меньше** по площади, чем Южно-Африканская Республика (ЮАР).\n\n**Для сравнения:**\n\n*   **Площадь Руанды:** ≈ 26 338 км²\n*   **Площадь ЮАР:** ≈ 1 219 090 км²\n\n**ЮАР больше Руанды примерно в 46 раз.**\n\nЧтобы было нагляднее: на территории ЮАР можно было бы разместить около **46 таких стран, как Руанда**.	deepseek-chat	\N	2025-10-25 11:12:27.07033+00
6856f380-7465-4610-be56-34102758665c	b2a37ab2-f36d-4efb-9dc3-9ab4b06a3bfb	f6979247-726b-487c-8b13-ef5e1ae056d9	user	какая страна самая большая в африке	deepseek-chat	\N	2025-10-25 11:13:00.102+00
0f308584-09fd-464f-a988-496d6470f4a7	b2a37ab2-f36d-4efb-9dc3-9ab4b06a3bfb	f6979247-726b-487c-8b13-ef5e1ae056d9	user	вапвап	deepseek-chat	\N	2025-10-25 11:14:08.323+00
361f5c25-caae-494e-a450-f8ecb44317a6	b2a37ab2-f36d-4efb-9dc3-9ab4b06a3bfb	f6979247-726b-487c-8b13-ef5e1ae056d9	user	какая страна самая большая в африке	deepseek-chat	\N	2025-10-25 11:16:28.448+00
9caa5610-175a-4cd0-a43f-fd08b771ec81	b2a37ab2-f36d-4efb-9dc3-9ab4b06a3bfb	f6979247-726b-487c-8b13-ef5e1ae056d9	assistant	Самой большой страной в Африке является **Алжир**.\n\n**Площадь Алжира:** около **2 381 741 км²**.\n\nОн не только самая большая страна в Африке, но и **десятая по площади в мире**.\n\nДля сравнения с ранее упомянутыми странами:\n*   Алжир **больше Руанды** примерно в **90 раз**.\n*   Алжир почти **вдвое больше ЮАР**.	deepseek-chat	\N	2025-10-25 11:16:35.091263+00
513dfa90-8415-468c-a439-45ea5390b04c	b2a37ab2-f36d-4efb-9dc3-9ab4b06a3bfb	f6979247-726b-487c-8b13-ef5e1ae056d9	user	а вторая по размеру	gemini-2.5-flash	\N	2025-10-25 11:16:52.668+00
1109226d-d2e2-4a43-8f62-740a58e1e787	b2a37ab2-f36d-4efb-9dc3-9ab4b06a3bfb	f6979247-726b-487c-8b13-ef5e1ae056d9	assistant	Второй по величине страной в Африке является **Демократическая Республика Конго (ДРК)**.\n\nЕё площадь составляет около **2 344 858 км²**.\n\nОна лишь немного уступает Алжиру по размеру, и вместе они значительно превосходят все остальные страны континента. ДРК также является 11-й по площади страной в мире.	gemini-2.5-flash	\N	2025-10-25 11:16:56.992875+00
661a3dcc-6c9c-4777-9111-1f242fa77568	b2a37ab2-f36d-4efb-9dc3-9ab4b06a3bfb	f6979247-726b-487c-8b13-ef5e1ae056d9	user	какая третья	deepseek-chat	\N	2025-10-25 11:19:39.36+00
d7669807-e1a3-4956-8aa4-ec75e752a8f5	b2a37ab2-f36d-4efb-9dc3-9ab4b06a3bfb	f6979247-726b-487c-8b13-ef5e1ae056d9	assistant	Третьей по величине страной в Африке является **Судан**.\n\n**Площадь Судана:** около **1 886 068 км²**.\n\nПосле разделения страны в 2011 году на Судан и Южный Судан, именно Судан сохранил за собой позицию третьей по площади страны на континенте.\n\n**Итак, тройка крупнейших стран Африки:**\n1.  **Алжир** (~2,38 млн км²)\n2.  **ДР Конго** (~2,34 млн км²)\n3.  **Судан** (~1,89 млн км²)	deepseek-chat	\N	2025-10-25 11:19:46.238596+00
3d006a41-c747-40ea-9359-cd859883f22d	b2a37ab2-f36d-4efb-9dc3-9ab4b06a3bfb	f6979247-726b-487c-8b13-ef5e1ae056d9	user	а четвертая	gemini-2.5-flash	\N	2025-10-25 11:20:11.614+00
a26c80e0-ba34-4dd8-9ad9-62e8ff32a117	b2a37ab2-f36d-4efb-9dc3-9ab4b06a3bfb	f6979247-726b-487c-8b13-ef5e1ae056d9	user	составь список из 5 стран	deepseek-chat	\N	2025-10-25 11:36:42.302+00
13a0c581-22c8-4b5e-a87a-244d24d9289f	b2a37ab2-f36d-4efb-9dc3-9ab4b06a3bfb	f6979247-726b-487c-8b13-ef5e1ae056d9	user	сведи в таблицу 5 стран из африки и 5 стран из европы	deepseek-chat	\N	2025-10-25 11:37:09.746+00
1e34b177-8334-48d8-84b6-0f138f3fc959	b2a37ab2-f36d-4efb-9dc3-9ab4b06a3bfb	f6979247-726b-487c-8b13-ef5e1ae056d9	assistant	Конечно, вот сравнительная таблица 5 крупнейших стран Африки и 5 крупнейших стран Европы по площади.\n\n### Сравнение площадей стран Африки и Европы\n\n| Место | Страна (Африка) | Площадь (км²) | Страна (Европа) | Площадь (км²) |\n| :---: | :--- | :--- | :--- | :--- |\n| 1 | **Алжир** | ~2 381 741 | **Россия** (европейская часть) | ~3 995 200 |\n| 2 | **ДР Конго** | ~2 344 858 | **Украина** | ~603 550 |\n| 3 | **Судан** | ~1 886 068 | **Франция** | ~643 801 |\n| 4 | **Ливия** | ~1 759 540 | **Испания** | ~505 990 |\n| 5 | **Чад** | ~1 284 000 | **Швеция** | ~450 295 |\n\n---\n\n**Важное примечание:**\n*   Для России указана площадь только её европейской части. Общая площадь России (17,1 млн км²) является самой большой в мире, но большая часть территории находится в Азии.\n*   Площади стран приведены приблизительно, так как данные в разных источниках могут незначительно отличаться.\n\nКак наглядно видно из таблицы, даже крупнейшие страны Европы (за исключением европейской части России) уступают по размеру крупнейшим странам Африки.	deepseek-chat	\N	2025-10-25 11:37:25.502146+00
721da9d9-8f69-485f-8776-68f9e54e0dfd	b2a37ab2-f36d-4efb-9dc3-9ab4b06a3bfb	f6979247-726b-487c-8b13-ef5e1ae056d9	user	сделай это в виде таблицы, а не списка	deepseek-chat	\N	2025-10-25 11:37:53.415+00
a99d067a-145d-44c9-b9f3-6b309ca9c17f	b2a37ab2-f36d-4efb-9dc3-9ab4b06a3bfb	f6979247-726b-487c-8b13-ef5e1ae056d9	assistant	Конечно, вот таблица с пятью крупнейшими странами Африки и Европы по площади.\n\n### Крупнейшие страны Африки и Европы по площади\n\n| Ранг | Африка                | Площадь (км²)   | Европа                       | Площадь (км²)   |\n| :--- | :-------------------- | :-------------- | :--------------------------- | :-------------- |\n| 1    | **Алжир**             | ~2 381 741      | **Россия** (европ. часть)    | ~3 995 200      |\n| 2    | **Дем. Респ. Конго**  | ~2 344 858      | **Украина**                  | ~603 550        |\n| 3    | **Судан**             | ~1 886 068      | **Франция**                  | ~643 801        |\n| 4    | **Ливия**             | ~1 759 540      | **Испания**                  | ~505 990        |\n| 5    | **Чад**               | ~1 284 000      | **Швеция**                   | ~450 295        |\n\n**Примечание:** Для России указана площадь только её европейской части. Общая площадь России является крупнейшей в мире и составляет ~17,1 млн км², но большая часть территории находится в Азии.	deepseek-chat	\N	2025-10-25 11:38:07.269637+00
31639d0b-8dcb-4d6b-870b-8be863637f25	b2a37ab2-f36d-4efb-9dc3-9ab4b06a3bfb	f6979247-726b-487c-8b13-ef5e1ae056d9	user	выдай ответ именно в виде таблицы	gemini-2.5-flash	\N	2025-10-25 12:55:35.311+00
cad77ede-5c7e-43c9-bedc-b9f13db10c9c	b2a37ab2-f36d-4efb-9dc3-9ab4b06a3bfb	f6979247-726b-487c-8b13-ef5e1ae056d9	assistant	Вот, пожалуйста, информация в виде таблицы:\n\n### Крупнейшие страны Африки и Европы по площади\n\n| Ранг | Страна (Африка)        | Площадь (км²)   | Страна (Европа)              | Площадь (км²)   |\n| :--- | :--------------------- | :-------------- | :--------------------------- | :-------------- |\n| 1    | **Алжир**              | ~2 381 741      | **Россия** (европ. часть)    | ~3 995 200      |\n| 2    | **Демократическая Республика Конго** | ~2 344 858      | **Украина**                  | ~603 550        |\n| 3    | **Судан**              | ~1 886 068      | **Франция**                  | ~643 801        |\n| 4    | **Ливия**              | ~1 759 540      | **Испания**                  | ~505 990        |\n| 5    | **Чад**                | ~1 284 000      | **Швеция**                   | ~450 295        |\n\n**Примечание:** Для России указана площадь только её европейской части. Общая площадь России (~17,1 млн км²) является крупнейшей в мире, но большая часть её территории находится в Азии.	gemini-2.5-flash	\N	2025-10-25 12:55:39.266638+00
a8640f88-6b47-487d-b9fb-45de277202b9	b2a37ab2-f36d-4efb-9dc3-9ab4b06a3bfb	f6979247-726b-487c-8b13-ef5e1ae056d9	user	выдай ответ именно в виде таблицы	gemini-2.5-pro	\N	2025-10-25 12:55:53.01+00
21f334fc-e0c6-4f92-aa9c-282cdadce602	b2a37ab2-f36d-4efb-9dc3-9ab4b06a3bfb	f6979247-726b-487c-8b13-ef5e1ae056d9	assistant	Конечно, вот ответ в виде таблицы.\n\n### Крупнейшие страны Африки и Европы по площади\n\n| Ранг | Страна (Африка)        | Площадь (км²) | Страна (Европа)           | Площадь (км²) |\n| :--- | :--------------------- | :------------ | :------------------------ | :------------ |\n| 1    | **Алжир**              | ~2 381 741    | **Россия (европ. часть)** | ~3 995 200    |\n| 2    | **Дем. Респ. Конго**   | ~2 344 858    | **Украина**               | ~603 550      |\n| 3    | **Судан**              | ~1 886 068    | **Франция**               | ~643 801      |\n| 4    | **Ливия**              | ~1 759 540    | **Испания**               | ~505 990      |\n| 5    | **Чад**                | ~1 284 000    | **Швеция**                | ~450 295      |\n\n**Примечание:** Для России указана площадь только её европейской части. Общая площадь России (~17,1 млн км²) является крупнейшей в мире.	gemini-2.5-pro	\N	2025-10-25 12:56:03.782276+00
40e978c4-a2c8-4ead-a3be-210230c0646d	5c79d89f-d09c-4576-9ef3-3e381515879b	f6979247-726b-487c-8b13-ef5e1ae056d9	user	площадь румынии	deepseek-chat	\N	2025-10-25 13:29:24.66+00
468c5911-2460-4e9a-966c-5d81fec8f517	5c79d89f-d09c-4576-9ef3-3e381515879b	f6979247-726b-487c-8b13-ef5e1ae056d9	assistant	Конечно, вот информация о площади Румынии:\n\n**Общая площадь:** **238 397 км²**\n\nЭто значение ставит Румынию на следующие позиции:\n\n*   **12-е место** по площади среди стран Европы (без учета России и Турции, которые частично в Азии).\n*   **81-е место** в мире.\n\nДля лучшего понимания масштаба:\n\n*   **Территориальное деление:** Площадь Румынии состоит из:\n    *   **Суша:** 231 231 км²\n    *   **Водная поверхность:** 7 166 км² (включая дельту Дуная, озера и водохранилища).\n*   **Сравнение:** По площади Румыния примерно сопоставима с Великобританией (242 495 км²) или с американским штатом Орегон (254 806 км²).\n\nТаким образом, **площадь Румынии составляет 238 397 квадратных километров**.	deepseek-chat	\N	2025-10-25 13:29:35.268429+00
5a3a9a5e-88f1-4fc5-8a46-b34677e87262	5c79d89f-d09c-4576-9ef3-3e381515879b	f6979247-726b-487c-8b13-ef5e1ae056d9	user	площадь германии	gpt-5-mini	\N	2025-10-25 13:29:52.515+00
8a5f3345-c1c2-49eb-9e07-71751b638ad0	25fbde9a-8cfe-45a0-a35e-18294dcc8031	f6979247-726b-487c-8b13-ef5e1ae056d9	user	приведи список 5 самых больших стран азии и африки	grok-4-fast	\N	2025-10-25 14:26:55.349+00
e612db7e-97fa-4727-9ba5-996e818ba04c	25fbde9a-8cfe-45a0-a35e-18294dcc8031	f6979247-726b-487c-8b13-ef5e1ae056d9	user	приведи список 5 самых больших стран азии и африки	grok-4-fast	\N	2025-10-25 14:29:46.28+00
bdcf8fdd-85da-448f-8e62-4b728e445da2	25fbde9a-8cfe-45a0-a35e-18294dcc8031	f6979247-726b-487c-8b13-ef5e1ae056d9	assistant	### 5 самых больших стран Азии по площади (в км², приблизительно)\n\n1. **Россия** — 17 098 242 км² (большая часть территории в Азии).\n2. **Китай** — 9 596 961 км².\n3. **Индия** — 3 287 263 км².\n4. **Казахстан** — 2 724 900 км².\n5. **Саудовская Аравия** — 2 149 690 км².\n\n### 5 самых больших стран Африки по площади (в км², приблизительно)\n\n1. **Алжир** — 2 381 741 км².\n2. **Демократическая Республика Конго** — 2 344 858 км².\n3. **Судан** — 1 861 484 км².\n4. **Ливия** — 1 759 540 км².\n5. **Чад** — 1 284 000 км².\n\n*Примечание: Данные основаны на стандартных географических источниках (например, ООН). Площади могут слегка варьироваться в зависимости от источника и учета территорий.*	grok-4-fast	\N	2025-10-25 14:29:50.79593+00
5a5fb173-2bb5-4bb2-8f9d-e887cefe69dc	25fbde9a-8cfe-45a0-a35e-18294dcc8031	f6979247-726b-487c-8b13-ef5e1ae056d9	user	сделай график динамики населения в алжире за последниение 50 лет	grok-4-fast	\N	2025-10-25 15:47:35.823+00
c2b44394-f896-4f09-a3f7-10bb57f062dd	25fbde9a-8cfe-45a0-a35e-18294dcc8031	f6979247-726b-487c-8b13-ef5e1ae056d9	user	сделай график динамики населения в алжире за последниение 50 лет	grok-4-fast	\N	2025-10-25 16:40:07.581+00
d6d7d46e-9351-47a7-b7a0-b9e8f46329a0	25fbde9a-8cfe-45a0-a35e-18294dcc8031	f6979247-726b-487c-8b13-ef5e1ae056d9	user	сделай график динамики населения в алжире за последниение 50 лет	grok-4-fast	\N	2025-10-25 16:41:45.778+00
0ba628c3-7325-49b3-a34e-0ac2e46dd764	25fbde9a-8cfe-45a0-a35e-18294dcc8031	f6979247-726b-487c-8b13-ef5e1ae056d9	user	приведи список 5 самых больших стран азии и африки	grok-4-fast	\N	2025-10-25 16:42:24.892+00
2939713f-ebdd-4486-9ce8-8d5071505f58	b90d21b0-68f1-4d86-a47e-c5fddbf00937	f6979247-726b-487c-8b13-ef5e1ae056d9	user	расстояние от земли до луны	grok-4-fast	\N	2025-10-25 17:48:44.009641+00
60040d81-24f4-4df3-8edd-8c063a65eebf	b90d21b0-68f1-4d86-a47e-c5fddbf00937	f6979247-726b-487c-8b13-ef5e1ae056d9	assistant	Среднее расстояние от Земли до Луны составляет примерно **384 400 километров**. \n\nЭто значение усреднённое, так как орбита Луны эллиптическая: в ближайшей точке (перигей) оно около 363 300 км, а в дальней (апогей) — до 405 500 км. Эти данные основаны на измерениях NASA и других космических агентств. Если нужны более точные расчёты или дополнительные детали, уточните!	grok-4-fast	\N	2025-10-25 17:48:47.116925+00
0a159840-e354-4edc-b30e-321678cc8f6c	25fbde9a-8cfe-45a0-a35e-18294dcc8031	f6979247-726b-487c-8b13-ef5e1ae056d9	user	сделай график динамики населения в алжире за последниение 50 лет	grok-4-fast	\N	2025-10-25 17:57:35.846624+00
c3eed25e-0c6d-446e-80f9-b21e2c0fdaf1	25fbde9a-8cfe-45a0-a35e-18294dcc8031	f6979247-726b-487c-8b13-ef5e1ae056d9	assistant	### Динамика населения Алжира за последние 50 лет (1974–2024)\n\nЯ не могу создать интерактивный график в этом текстовом формате, но предоставлю:\n- **Таблицу с данными** (основана на оценках ООН и World Bank; население в миллионах человек, округлено).\n- **Простой ASCII-график** (линейный, для визуализации роста; шкала по годам и населению).\n- **Анализ**: Население Алжира росло экспоненциально благодаря высоким рождаемости и улучшению здравоохранения, но темпы роста замедляются.\n\n#### Таблица данных (население в млн человек)\n\n| Год  | Население (млн) | Прирост за 10 лет (%) |\n|------|-----------------|-----------------------|\n| 1974 | 15.0           | -                     |\n| 1980 | 18.1           | +20.7                 |\n| 1990 | 25.0           | +38.1                 |\n| 2000 | 30.8           | +23.2                 |\n| 2010 | 35.6           | +15.6                 |\n| 2020 | 43.9           | +23.3                 |\n| 2024 | 45.6           | +3.9 (за 4 года)      |\n\n*Источники: United Nations Population Division (World Population Prospects 2022) и World Bank. Данные — средние оценки; точные цифры могут варьироваться.*\n\n#### Анализ динамики\n- С 1974 по 1990: Быстрый рост (почти удвоение) из-за послевоенного baby-boom и снижения смертности.\n- 1990–2010: Стабильный рост, но замедление из-за урбанизации и снижения рождаемости.\n- 2010–2024: Рост продолжается, но темпы падают (с 2.5% в год в 1980-х до ~1.5% сейчас). Прогноз: К 2050 году — около 55–60 млн.\n\n#### ASCII-график динамики (линейный график)\nЗдесь население на оси Y (от 0 до 50 млн), годы на оси X. "*" представляет точки данных, соединенные линиями для тренда. (Масштаб приблизительный для простоты.)\n\n```\nНаселение (млн)\n50 |                                                                  \n   |                                                                  \n45 |                                                            *    \n   |                                                       *          \n40 |                                                 *                \n   |                                          *                      \n35 |                                   *                            \n   |                            *                                    \n30 |                     *                                           \n   |              *                                                  \n25 |        *                                                        \n   |   *                                                              \n15 |*                                                                 \n   |__________________________________________________________________\n     1974  1980  1990  2000  2010  2020  2024    Годы\n```\n\n- График показывает устойчивый восходящий тренд с ускорением в 1980–1990-х и замедлением недавно.\n- Для реального графика рекомендую использовать инструменты вроде Google Charts, Excel или сайты типа Our World in Data (поиск: "Algeria population").\n\nЕсли нужно больше деталей, данные по годам или график для другой страны — дай знать!\n\n### Список 5 самых больших стран Азии и Африки\n(Кратко повторяю из предыдущего ответа, как просил. По площади, в км².)\n\n#### Азия:\n1. Россия — 17 098 242\n2. Китай — 9 596 961\n3. Индия — 3 287 263\n4. Казахстан — 2 724 900\n5. Саудовская Аравия — 2 149 690\n\n#### Африка:\n1. Алжир — 2 381 741\n2. ДР Конго — 2 344 858\n3. Судан — 1 861 484\n4. Ливия — 1 759 540\n5. Чад — 1 284 000	grok-4-fast	\N	2025-10-25 17:57:49.874433+00
2b9d6e3a-afa7-4fea-b30f-2a8052f86980	b90d21b0-68f1-4d86-a47e-c5fddbf00937	f6979247-726b-487c-8b13-ef5e1ae056d9	user	а какое расстояние от земли до солнца?	grok-4-fast	\N	2025-10-25 20:17:59.786083+00
04a95d15-dfe7-4f03-b5d6-dfb5dce55cfc	b90d21b0-68f1-4d86-a47e-c5fddbf00937	f6979247-726b-487c-8b13-ef5e1ae056d9	assistant	Среднее расстояние от Земли до Солнца составляет примерно **149 597 870 километров**. \n\nЭто значение известно как **1 астрономическая единица (АЕ)** и является усреднённым, поскольку орбита Земли вокруг Солнца эллиптическая: в ближайшей точке (перигелий) — около 147 миллионов км, а в дальней (афелий) — до 152 миллионов км. Данные основаны на измерениях NASA и других астрономических организаций. Если нужны дополнительные детали или сравнения, спрашивайте!	grok-4-fast	\N	2025-10-25 20:18:01.917032+00
dffb1561-1826-42b9-88f3-eb41b2b4b0a7	b90d21b0-68f1-4d86-a47e-c5fddbf00937	f6979247-726b-487c-8b13-ef5e1ae056d9	user	а сколько АЕ до альфа центравра	grok-4-fast	\N	2025-10-25 20:22:43.048101+00
5aa54246-6122-4dfb-9a29-110c0afbfefa	b90d21b0-68f1-4d86-a47e-c5fddbf00937	f6979247-726b-487c-8b13-ef5e1ae056d9	assistant	Расстояние от Земли (Солнечной системы) до звёздной системы Альфа Центавра (ближайшей к нам) составляет примерно **276 000 астрономических единиц (АЕ)**.\n\nЭто значение основано на расстоянии около **4,37 световых лет** (стандартное для Альфа Центавра A и B; Проксима Центавра чуть ближе — 4,24 св. года, или ~253 000 АЕ). \n\nДля справки: 1 световой год равен примерно 63 240 АЕ, так что перевод довольно прямолинейный. Данные отчёта от Международной астрономической ассоциации (IAU) и NASA. Если нужны детали о звёздах системы или сравнения, уточните!	grok-4-fast	\N	2025-10-25 20:22:47.433064+00
5fe6954d-f424-4c13-9188-8ccac50da7fa	b90d21b0-68f1-4d86-a47e-c5fddbf00937	f6979247-726b-487c-8b13-ef5e1ae056d9	user	какие 2 самые близкие планеты	grok-4-fast	\N	2025-10-25 20:23:43.40383+00
965037a0-2ae2-43ff-8add-84848513d568	b90d21b0-68f1-4d86-a47e-c5fddbf00937	f6979247-726b-487c-8b13-ef5e1ae056d9	user	какие 2 самые близкие планеты	grok-4-fast	\N	2025-10-25 20:25:05.528225+00
b407880b-3343-4fdc-8445-f01998e10518	b90d21b0-68f1-4d86-a47e-c5fddbf00937	f6979247-726b-487c-8b13-ef5e1ae056d9	assistant	Две ближайшие к Земле планеты в Солнечной системе — это **Венера** и **Марс**.\n\n- **Венера**: Среднее расстояние от Земли — около 41 миллиона километров (минимальное — 38 млн км во время оппозиции). Она ближе всего из-за орбиты внутри земной.\n- **Марс**: Среднее расстояние — около 78 миллионов километров (минимальное — 54 млн км). Это вторая по близости.\n\nЭти значения усреднены и зависят от позиций планет на орбитах. Данные от NASA и IAU. Если вы имели в виду ближайшие к Солнцу (Меркурий и Венера) или что-то другое, уточните!	grok-4-fast	\N	2025-10-25 20:25:09.390673+00
35ce7f23-b6e4-4920-9c06-6babf1e63a67	b90d21b0-68f1-4d86-a47e-c5fddbf00937	f6979247-726b-487c-8b13-ef5e1ae056d9	user	какие 2 самые близкие планеты между собой	deepseek-chat	\N	2025-10-25 20:25:41.133174+00
3cfa84e2-8406-4262-94bc-27cf24802cd7	b90d21b0-68f1-4d86-a47e-c5fddbf00937	f6979247-726b-487c-8b13-ef5e1ae056d9	user	какие 2 самые близкие планеты между собой	grok-4-fast	\N	2025-10-25 20:28:40.861079+00
0b5e3b13-387b-4669-9d0a-1bac29084b46	b90d21b0-68f1-4d86-a47e-c5fddbf00937	f6979247-726b-487c-8b13-ef5e1ae056d9	user	какие 2 самые близкие планеты между собой	gemini-2.5-flash	\N	2025-10-25 20:38:10.306307+00
87fbb45d-23df-4e0f-8777-7c104fd28779	b90d21b0-68f1-4d86-a47e-c5fddbf00937	f6979247-726b-487c-8b13-ef5e1ae056d9	user	какие 2 самые близкие планеты между собой	grok-4-fast	\N	2025-10-25 20:46:52.358665+00
e661e87c-b71b-4790-8953-1df53d5ae77e	b90d21b0-68f1-4d86-a47e-c5fddbf00937	f6979247-726b-487c-8b13-ef5e1ae056d9	assistant	Две планеты Солнечной системы, которые находятся ближе всего друг к другу (по минимальному расстоянию), — это **Венера** и **Земля**.\n\n- **Минимальное расстояние между ними**: около **38,2 миллиона километров** (происходит во время нижнего соединения, когда Венера проходит между Землёй и Солнцем).\n- **Среднее расстояние**: примерно 41 миллион километров.\n\nЭто меньше, чем между любой другой парой планет. Для сравнения:\n- Минимальное расстояние между Землёй и Марсом — около 54,6 млн км.\n- Между Меркурием и Венерой — около 75 млн км.\n\nОрбиты планет эллиптические, поэтому расстояния варьируются, но Венера и Земля всегда остаются ближайшей парой. Данные основаны на измерениях NASA и Международной астрономической ассоциации (IAU). Если вы имеете в виду экзопланеты за пределами Солнечной системы или другой контекст, уточните!	grok-4-fast	\N	2025-10-25 20:46:56.473782+00
bcf1985d-f644-4469-a076-87be402fa678	b90d21b0-68f1-4d86-a47e-c5fddbf00937	f6979247-726b-487c-8b13-ef5e1ae056d9	user	а самые дальние?	grok-4-fast	\N	2025-10-25 20:47:41.271233+00
a21c20f4-8bea-42d6-86c0-f48cbedaa285	b90d21b0-68f1-4d86-a47e-c5fddbf00937	f6979247-726b-487c-8b13-ef5e1ae056d9	assistant	Две планеты Солнечной системы, которые находятся дальше всего друг от друга (по максимальному расстоянию), — это **Меркурий** и **Нептун**.\n\n- **Максимальное расстояние между ними**: около **4,5–4,6 миллиарда километров** (или примерно 30,4 астрономических единицы, АЕ). Это происходит, когда планеты находятся на противоположных сторонах от Солнца на своих орбитах.\n- **Среднее расстояние**: примерно 4,3 миллиарда километров (учитывая их орбитальные позиции).\n\nМеркурий — ближайшая к Солнцу планета (среднее расстояние ~58 млн км), а Нептун — самая далёкая (среднее ~4,5 млрд км), поэтому их пара даёт наибольшее возможное расстояние среди всех комбинаций планет. Орбиты эллиптические, так что расстояние варьируется, но эта пара всегда самая удалённая. Данные от NASA и Международной астрономической ассоциации (IAU). Если вы имеете в виду минимальное расстояние между дальними планетами (например, Уран и Нептун) или другой аспект, уточните!	grok-4-fast	\N	2025-10-25 20:47:46.025141+00
3b11552b-d9de-480d-8057-6f625b0cf461	b90d21b0-68f1-4d86-a47e-c5fddbf00937	f6979247-726b-487c-8b13-ef5e1ae056d9	user	какие самые дальние из соседних?	grok-4-fast	\N	2025-10-25 20:48:41.583722+00
3d15dba8-d301-4e08-b6e2-22f3cab9b5eb	2c2b2f0a-32e0-44ad-9c76-0f81ac1de54c	b207c1f2-dd20-4e5d-b01f-59d972cec30e	user	какая средняя генподрядная наценка в россии  и мире	grok-4-fast	\N	2025-10-25 21:30:39.632418+00
5ef4c31e-8c8b-46e5-87ac-4fedd9c80227	2c2b2f0a-32e0-44ad-9c76-0f81ac1de54c	b207c1f2-dd20-4e5d-b01f-59d972cec30e	assistant	### Средняя генподрядная наценка: Россия и мир\n\nГенподрядная наценка (или маржа генподрядчика) — это разница между стоимостью работ, материалов и услуг, которую генподрядчик закупает у субподрядчиков, и итоговой ценой контракта для заказчика. Она покрывает управление проектом, риски, прибыль и overhead (административные расходы). Наценка сильно зависит от отрасли (строительство, IT, производство), типа проекта (жилой, коммерческий, инфраструктурный), региона, экономической ситуации и конкуренции. Данные ниже — это обобщенные средние значения на основе отраслевых отчетов (например, от Deloitte, McKinsey, Росстата и международных ассоциаций строителей) на 2023–2024 годы. Они приблизительны и могут варьироваться; рекомендую проверять актуальные данные в специализированных источниках, таких как Минстрой РФ или FIDIC для мира.\n\n#### В России\n- **Средняя наценка**: 8–15% от общей стоимости проекта.\n  - В строительстве (самая распространенная область для генподрядчиков): 10–12% для жилых и коммерческих объектов. Для крупных инфраструктурных проектов (дороги, мосты) — до 15–20%, но с учетом госрегулирования (ФЗ-44, ФЗ-223) и инфляции (на 2024 год ~7–8%) она часто ниже.\n  - В IT и консалтинге: 15–25%, так как риски выше.\n  - Факторы влияния: Высокая конкуренция, санкции и волатильность цен на материалы снижают маржу. По данным Росстата и аналитики (например, от "Эксперт РА"), в 2023 году средняя рентабельность генподрядчиков в строительстве составила около 9–11%.\n- **Пример**: Для типового жилого дома наценка может быть 10% (из 100 млн руб. контракта — 10 млн руб. на управление и прибыль).\n\n#### В мире\n- **Средняя наценка**: 10–20% от общей стоимости.\n  - В США и Европе (строительство): 12–18% для коммерческих проектов, 8–12% для жилых. По отчетам Dodge Data & Analytics (2023), средняя маржа генподрядчиков в США — 11–14%, с ростом из-за инфляции и цепочек поставок.\n  - В Азии (Китай, Индия): 5–10%, из-за низкой конкуренции и масштаба, но с рисками коррупции.\n  - В развивающихся странах (Латинская Америка, Африка): 15–25%, чтобы покрыть высокие риски (политические, валютные).\n  - Глобальный средний показатель (по данным World Bank и ENR — Engineering News-Record): Около 12–15% для крупных проектов. В нефтегазе или энергетике — до 20–30%.\n- **Пример**: В ЕС для коммерческого здания наценка ~15% (из €100 млн — €15 млн на генподряд).\n\n**Важные замечания**:\n- Наценка рассчитывается как процент от себестоимости или от общей суммы контракта. В контрактах часто фиксируется как "общая прибыльность" (gross margin).\n- Влияющие факторы: Экономический цикл (в кризис наценка падает), тип контракта (FIDIC — фиксированная цена, EPC — с рисками) и цифровизация (BIM снижает overhead).\n- Для точности: В России смотрите отчеты Минстроя или СРО (саморегулируемых организаций). В мире — сайты AGC (Associated General Contractors) или аналогичные.\n\nЕсли у вас есть детали по отрасли или региону, я могу уточнить!	grok-4-fast	\N	2025-10-25 21:30:48.715456+00
d93f3fb5-605a-4d01-b09e-173109a852db	ebcccf6a-9cdf-4b03-bf11-113f88ebff8f	f6979247-726b-487c-8b13-ef5e1ae056d9	user	я разрабатываю приложение для работы с ai моделями через api. умеют ли модели chatgpt, grok, gemini, deepseek при работе через api создавать в ответ на запрос файлы, например excel с таблицами	grok-4-fast	\N	2025-10-27 06:21:19.499121+00
477b4f67-0e2a-48e8-a7e9-5f8c0e4f8f24	ebcccf6a-9cdf-4b03-bf11-113f88ebff8f	f6979247-726b-487c-8b13-ef5e1ae056d9	assistant	Нет, модели вроде ChatGPT (OpenAI API), Grok (xAI API), Gemini (Google API) и DeepSeek (DeepSeek API) не могут напрямую создавать и возвращать готовые файлы (например, Excel-файлы в формате .xlsx) в ответ на запрос через API. Эти API в основном предназначены для генерации текстового контента в формате JSON, и их ответы ограничены строками, объектами или массивами данных. Вот подробный разбор по каждой модели и общие рекомендации для вашего приложения:\n\n### 1. **ChatGPT (OpenAI API)**\n   - **Возможности**: Модель генерирует текст, включая структурированные данные вроде CSV, JSON или Markdown-таблиц. Вы можете попросить её сгенерировать содержимое таблицы в формате CSV (который легко импортировать в Excel), но сам файл .xlsx не создаётся и не отправляется.\n   - **Ограничения**: API возвращает только текст (в поле `content` ответа). Нет встроенной поддержки бинарных файлов. Однако в Assistants API (расширенная версия) модель может работать с загруженными файлами (анализ), но не генерировать новые для скачивания.\n   - **Как реализовать в приложении**:\n     - Запросите у модели данные в CSV-формате: "Сгенерируй таблицу продаж в формате CSV с колонками: Дата, Продукт, Сумма".\n     - На стороне вашего приложения (например, в Python с pandas или Node.js с библиотекой like xlsx) парсите ответ и создайте .xlsx-файл.\n     - Пример кода (Python с openai и pandas):\n       ```python\n       import openai\n       import pandas as pd\n       from io import StringIO\n\n       client = openai.OpenAI(api_key="your_key")\n       response = client.chat.completions.create(\n           model="gpt-4o",\n           messages=[{"role": "user", "content": "Создай CSV-таблицу с примерами данных о пользователях."}]\n       )\n       csv_data = response.choices[0].message.content\n\n       df = pd.read_csv(StringIO(csv_data))\n       df.to_excel("output.xlsx", index=False)\n       ```\n\n### 2. **Grok (xAI API)**\n   - **Возможности**: Аналогично — возвращает текстовый ответ в JSON. Модель может генерировать таблицы в текстовом формате (CSV, JSON), но не файлы.\n   - **Ограничения**: API фокусируется на чат-ответах, без поддержки файловой генерации. xAI API относительно новый, и на момент моего последнего обновления (2023–2024) нет функций для бинарных выходов.\n   - **Реализация**: То же, что и для OpenAI — генерируйте CSV/JSON в запросе и обрабатывайте на клиенте. Документация xAI: проверьте на grok.x.ai для актуальных эндпоинтов.\n\n### 3. **Gemini (Google Gemini API или Vertex AI)**\n   - **Возможности**: Генерирует текст, включая структурированные данные (JSON, CSV). Поддерживает мультимодальные запросы (изображения, но не файлы в ответе). Можно попросить таблицу в формате, подходящем для Excel.\n   - **Ограничения**: Ответы — чистый текст в JSON. Нет прямой генерации .xlsx. В Vertex AI есть инструменты для интеграции с Google Sheets (через API), но это не часть базового Gemini API.\n   - **Реализация**: Используйте Google Generative AI SDK. Пример (Python):\n     ```python\n     import google.generativeai as genai\n     import pandas as pd\n     from io import StringIO\n\n     genai.configure(api_key="your_key")\n     model = genai.GenerativeModel('gemini-1.5-pro')\n     response = model.generate_content("Создай CSV-данные для таблицы расходов.")\n     csv_data = response.text\n\n     df = pd.read_csv(StringIO(csv_data))\n     df.to_excel("output.xlsx", index=False)\n     ```\n     - Интеграция с Google Sheets: Если ваше приложение на Google Cloud, модель может генерировать данные, а вы их вставляете в Sheets API для экспорта в Excel.\n\n### 4. **DeepSeek (DeepSeek API)**\n   - **Возможности**: Это открытая модель (DeepSeek-V2 и т.д.), API возвращает текст. Хорошо справляется с генерацией кода или данных в CSV/JSON для таблиц.\n   - **Ограничения**: Как и у других, нет поддержки файлов — только текст. API от DeepSeek (на платформе вроде Hugging Face или их собственном) ориентирован на чат и кодинг.\n   - **Реализация**: Аналогично остальным. Их API совместим с OpenAI-форматом, так что библиотеки вроде openai-python подойдут. Генерируйте CSV и конвертируйте локально.\n\n### Общие рекомендации для вашего приложения\n- **Почему не напрямую?** API этих моделей — это stateless чат-интерфейсы, оптимизированные для текста. Генерация бинарных файлов (как .xlsx) требует вычислений на сервере, что выходит за рамки их дизайна (чтобы избежать нагрузки и безопасности). Вместо этого они предоставляют "сырые" данные.\n- **Лучшие практики**:\n  - **Форматы для таблиц**: Всегда запрашивайте данные в CSV или JSON — это просто и универсально. Excel может импортировать CSV напрямую.\n  - **Библиотеки для конвертации**:\n    - Python: `pandas` + `openpyxl` для .xlsx.\n    - JavaScript: `xlsx` (SheetJS) для браузера/сервера.\n    - Если приложение веб-based, генерируйте файл на бэкенде и отправляйте на скачивание.\n  - **Безопасность и лимиты**: Учитывайте токен-лимиты (например, 128k для GPT-4o) — большие таблицы могут превысить. Тестируйте на реальных данных.\n  - **Альтернативы**: Если нужно больше интеграций, посмотрите на LangChain или Haystack — фреймворки для цепочек, где AI генерирует данные, а вы их обрабатываете в файлы.\n  - **Документация**: \n    - OpenAI: platform.openai.com/docs\n    - xAI Grok: grok.x.ai/docs\n    - Google Gemini: ai.google.dev\n    - DeepSeek: platform.deepseek.com/docs\n\nЕсли вам нужны примеры кода для конкретного языка или интеграции, уточните — помогу!	grok-4-fast	\N	2025-10-27 06:21:34.086775+00
74f010da-08f3-4508-8b3e-5e146c45a934	ebcccf6a-9cdf-4b03-bf11-113f88ebff8f	f6979247-726b-487c-8b13-ef5e1ae056d9	user	напиши еще, каким моделям можно отправлять файлы, и каких типов	grok-4-fast	\N	2025-10-27 06:27:48.069481+00
7753a1e1-cca6-4951-950f-9a0bb36715ea	ebcccf6a-9cdf-4b03-bf11-113f88ebff8f	f6979247-726b-487c-8b13-ef5e1ae056d9	assistant	Вот дополнение к предыдущему ответу: я опишу, каким из упомянутых моделей (ChatGPT/OpenAI, Grok/xAI, Gemini/Google, DeepSeek) можно отправлять файлы через их API, и каких типов. Обратите внимание, что поддержка файлов в основном предназначена для анализа или мультимодальных запросов (например, "опиши изображение" или "проанализируй PDF"). Не все модели поддерживают загрузку файлов напрямую — это зависит от версии API. Файлы обычно отправляются в формате base64 (для небольших файлов), multipart/form-data (для больших) или по URL. Лимиты на размер и количество варьируются (от 20MB до 512MB на файл).\n\nЯ структурирую по моделям, как в предыдущем ответе. Информация актуальна на основе документации на 2024 год; всегда проверяйте официальные docs для обновлений.\n\n### 1. **ChatGPT (OpenAI API)**\n   - **Поддержка файлов**: Да, но не во всех эндпоинтах. \n     - **Базовый Chat Completions API**: Только текст. Для изображений используйте модели с vision (gpt-4o, gpt-4-turbo с vision) — отправляйте изображения как base64 или URL.\n     - **Assistants API (рекомендуется для файлов)**: Полная поддержка загрузки файлов для анализа. Вы загружаете файл заранее (через `/files` эндпоинт), получаете ID и используете в чате. Модель может извлекать текст, таблицы или описывать содержимое.\n     - **Fine-tuning API**: Поддержка для обучения (текстовые файлы в JSONL).\n   - **Поддерживаемые типы файлов**:\n     - **Изображения**: JPEG, PNG, GIF, WebP (до 20MB на изображение, до 4 в запросе для vision).\n     - **Документы**: PDF, TXT, DOCX, CSV, JSON (до 512MB на файл в Assistants; идеально для таблиц в Excel/CSV).\n     - **Аудио**: MP3, MP4, MPEG, MPGA, M4A, WAV, WEBM (до 25MB; для транскрипции через Whisper API, но не в чате).\n     - **Видео**: Не поддерживается напрямую в чате (только аудио из видео).\n     - **Другие**: Кодовые файлы (PY, JS и т.д.) для анализа.\n   - **Лимиты**: До 10 файлов на ассистента (общий размер до 100GB). Файлы хранятся до 7 дней (или дольше в custom setups).\n   - **Пример (Python с openai)**:\n     ```python\n     from openai import OpenAI\n     client = OpenAI(api_key="your_key")\n\n     # Загрузка файла\n     file = client.files.create(\n         file=open("example.pdf", "rb"),\n         purpose="assistants"\n     )\n\n     # Использование в чате\n     response = client.beta.assistants.create(\n         name="Analyzer",\n         instructions="Проанализируй таблицу в PDF.",\n         model="gpt-4o",\n         tools=[{"type": "file_search"}],\n         file_ids=[file.id]\n     )\n     # Затем запустите thread с этим ассистентом\n     ```\n   - **Документация**: platform.openai.com/docs/assistants/tools/file-search.\n\n### 2. **Grok (xAI API)**\n   - **Поддержка файлов**: Ограниченная. Grok API (на основе Grok-1.5 или Grok-2) в основном ориентирован на текст. Однако Grok-1.5V (vision-версия) поддерживает изображения для анализа (например, "что на фото?").\n     - Нет полноценной поддержки загрузки документов или аудио через API на момент 2024. В чат-интерфейсе на x.com (Twitter) Grok может обрабатывать изображения, но API — это в основном чат-эндпоинт без файлов.\n     - Если xAI обновит (проверьте docs), возможно, добавят vision как в OpenAI.\n   - **Поддерживаемые типы файлов**:\n     - **Изображения**: PNG, JPEG, GIF (base64 или URL; до 10MB, в vision-режиме).\n     - **Документы/Аудио/Видео**: Не поддерживается напрямую. Для таблиц — только текст (CSV как строка).\n   - **Лимиты**: Небольшой размер (до 5–10 изображений на запрос). API молодой, так что фокусируется на скорости, а не на файлах.\n   - **Реализация**: Если vision доступно, используйте параметр `images` в запросе, аналогично OpenAI.\n   - **Документация**: grok.x.ai/docs (или developers.x.ai). Если нужно, интегрируйте через HTTP-запросы с base64.\n\n### 3. **Gemini (Google Gemini API или Vertex AI)**\n   - **Поддержка файлов**: Отличная мультимодальная поддержка. Через Generative AI API (gemini-pro-vision, gemini-1.5-pro) можно отправлять файлы напрямую в запросе. Vertex AI позволяет интегрировать с Google Cloud Storage для больших файлов.\n     - Поддержка для анализа изображений, видео, аудио и текста. Идеально для таблиц в PDF/изображениях.\n   - **Поддерживаемые типы файлов**:\n     - **Изображения**: JPEG, PNG, WebP, BMP, GIF, ICO (до 30 изображений на запрос, до 20MB каждое; base64 или URL).\n     - **Видео**: MP4, MPEG, MOV, AVI, FLV, WebM (до 2GB, длительностью до 1 часа; для анализа кадров/аудио).\n     - **Аудио**: WAV, MP3, AAC, FLAC, OGG (до 2GB; для транскрипции).\n     - **Документы**: PDF, TXT (до 30MB; текст извлекается автоматически). Для таблиц — можно отправить скриншот Excel как изображение или PDF.\n     - **Другие**: Кодовые файлы как текст.\n   - **Лимиты**: До 10 файлов на запрос (зависит от модели). В Vertex AI — интеграция с GCS (Google Cloud Storage) для файлов до 100GB.\n   - **Пример (Python с google-generativeai)**:\n     ```python\n     import google.generativeai as genai\n     from google.generativeai.types import File\n\n     genai.configure(api_key="your_key")\n     model = genai.GenerativeModel('gemini-1.5-pro')\n\n     # Для изображения\n     img = genai.upload_file(path="example.jpg")\n     response = model.generate_content(["Опиши таблицу на изображении.", img])\n\n     # Для видео/аудио аналогично\n     video = genai.upload_file(path="example.mp4")\n     response = model.generate_content(["Проанализируй видео.", video])\n     ```\n   - **Документация**: ai.google.dev/gemini-api/docs/vision или cloud.google.com/vertex-ai/docs/generative-ai/multimodal.\n\n### 4. **DeepSeek (DeepSeek API)**\n   - **Поддержка файлов**: Нет. DeepSeek — это в основном текстовые модели (DeepSeek-V2, DeepSeek-Coder), оптимизированные для кода и чата. API совместимо с OpenAI-форматом, но без мультимодальности.\n     - Нет vision, аудио или файловой загрузки. Для анализа файлов (например, таблиц) отправляйте содержимое как текст (скопируйте из Excel в запрос).\n     - Если используете через Hugging Face (где DeepSeek хостится), там может быть поддержка изображений в некоторых пайплайнах, но не в базовом API.\n   - **Поддерживаемые типы файлов**: Только текст (как строка в сообщении). Нет бинарных файлов.\n   - **Лимиты**: Не применимо.\n   - **Реализация**: Парсите файл на клиенте (например, прочитайте CSV и вставьте в prompt) перед отправкой.\n   - **Документация**: platform.deepseek.com/docs (или huggingface.co/deepseek-ai).\n\n### Общие рекомендации\n- **Форматы отправки**: \n  - Base64: Для маленьких файлов (вставьте в JSON как data URI: "data:image/jpeg;base64,...").\n  - Multipart: Для больших (используйте SDK или HTTP POST).\n  - URL: Если файл публичный (но учтите приватность).\n- **Безопасность**: Не отправляйте конфиденциальные данные — API могут хранить/логировать файлы. Используйте токены с минимальными правами.\n- **Лимиты и стоимость**: Файлы увеличивают токены (например, изображение 1024x1024 ~ 85k токенов в OpenAI). Стоимость растёт с размером.\n- **Альтернативы**: Если нужны продвинутые файлы, рассмотрите Anthropic Claude (поддержка изображений/PDF) или Llama через Groq/Replicate (ограниченная мультимодальность).\n- **Для вашего приложения**: Внедряйте обработку файлов на бэкенде (например, с Multer в Node.js или Flask в Python), чтобы избежать перегрузки API. Тестируйте на примерах: загрузите PDF с таблицей и попросите "извлеки данные в JSON".\n\nЕсли нужны примеры кода для конкретной модели, интеграции или обработки ошибок — дайте знать!	grok-4-fast	\N	2025-10-27 06:28:05.725115+00
4b66524a-ba45-4b94-8070-925c5a16b00c	ebcccf6a-9cdf-4b03-bf11-113f88ebff8f	f6979247-726b-487c-8b13-ef5e1ae056d9	user	какие по умолчанию используются температуры в запросах через api	grok-4-fast	\N	2025-10-27 07:35:30.644998+00
2b2248bc-11a6-48b7-8d86-ac4664e646fd	ebcccf6a-9cdf-4b03-bf11-113f88ebff8f	f6979247-726b-487c-8b13-ef5e1ae056d9	assistant	Вот подробный ответ на ваш вопрос о значениях температуры (temperature) по умолчанию в API для упомянутых моделей (ChatGPT/OpenAI, Grok/xAI, Gemini/Google, DeepSeek). Температура — это параметр, который контролирует "случайность" и креативность генерации: значение 0 делает ответы детерминированными (всегда одинаковые при одном промпте), 1.0 — баланс (стандартная креативность), выше 1.0 — более хаотично. Если не указать в запросе, используется значение по умолчанию.\n\nИнформация основана на официальной документации на 2024 год. Все API позволяют переопределить temperature в запросе (обычно от 0 до 2). Я укажу также связанные параметры, как top_p (nucleus sampling), для полноты.\n\n### 1. **ChatGPT (OpenAI API)**\n   - **Температура по умолчанию**: 1.0\n   - **Другие параметры по умолчанию**:\n     - top_p: 1.0 (не ограничивает выбор токенов).\n     - frequency_penalty: 0.0 (не штрафует повторения).\n     - presence_penalty: 0.0 (не поощряет новые темы).\n   - **Где применяется**: В chat.completions.create() и assistants. Для vision-моделей (gpt-4o) то же.\n   - **Пример в запросе (Python)**:\n     ```python\n     response = client.chat.completions.create(\n         model="gpt-4o",\n         messages=[{"role": "user", "content": "Привет!"}],\n         temperature=1.0  # По умолчанию, можно опустить\n     )\n     ```\n   - **Документация**: platform.openai.com/docs/api-reference/chat/create — "temperature (optional, defaults to 1)".\n\n### 2. **Grok (xAI API)**\n   - **Температура по умолчанию**: 1.0\n   - **Другие параметры по умолчанию**:\n     - top_p: 1.0.\n     - frequency_penalty: 0.0.\n     - presence_penalty: 0.0.\n   - **Где применяется**: API xAI совместимо с OpenAI-форматом, так что параметры идентичны. Используется в /chat/completions эндпоинте для моделей вроде grok-beta.\n   - **Пример**: Аналогично OpenAI — используйте openai-python библиотеку с base_url="https://api.x.ai/v1".\n     ```python\n     from openai import OpenAI\n     client = OpenAI(base_url="https://api.x.ai/v1", api_key="your_xai_key")\n     response = client.chat.completions.create(\n         model="grok-beta",\n         messages=[{"role": "user", "content": "Расскажи шутку."}],\n         temperature=1.0  # По умолчанию\n     )\n     ```\n   - **Документация**: developers.x.ai/docs — следует OpenAI spec, default temperature=1.0. (Если обновления, проверьте актуально).\n\n### 3. **Gemini (Google Gemini API или Vertex AI)**\n   - **Температура по умолчанию**: 1.0 (для generate_content в Generative AI SDK).\n   - **Другие параметры по умолчанию**:\n     - top_p: 0.95 (ограничение на вероятностный выбор).\n     - top_k: 40 (выбор из топ-40 токенов).\n     - candidate_count: 1 (один вариант ответа).\n   - **Где применяется**: В мультимодальных запросах (текст, изображения, видео). В Vertex AI — аналогично, но с дополнительными опциями для тюнинга.\n   - **Пример (Python с google-generativeai)**:\n     ```python\n     import google.generativeai as genai\n     genai.configure(api_key="your_key")\n     model = genai.GenerativeModel('gemini-1.5-pro')\n     response = model.generate_content(\n         "Расскажи о AI.",\n         generation_config=genai.types.GenerationConfig(\n             temperature=1.0,  # По умолчанию, можно опустить\n             top_p=0.95\n         )\n     )\n     ```\n   - **Документация**: ai.google.dev/gemini-api/docs/text-generation — "temperature: 1.0 (default)". В Vertex AI: cloud.google.com/vertex-ai/docs/generative-ai/model-reference/gemini — то же.\n\n### 4. **DeepSeek (DeepSeek API)**\n   - **Температура по умолчанию**: 1.0\n   - **Другие параметры по умолчанию**:\n     - top_p: 1.0.\n     - frequency_penalty: 0.0.\n     - presence_penalty: 0.0.\n   - **Где применяется**: API DeepSeek (deepseek-chat или deepseek-coder) полностью совместимо с OpenAI-форматом, так что параметры стандартные. Подходит для текстовых и кодовых запросов.\n   - **Пример**: Используйте openai-python с их эндпоинтом.\n     ```python\n     from openai import OpenAI\n     client = OpenAI(base_url="https://api.deepseek.com/v1", api_key="your_key")\n     response = client.chat.completions.create(\n         model="deepseek-chat",\n         messages=[{"role": "user", "content": "Напиши код."}],\n         temperature=1.0  # По умолчанию\n     )\n     ```\n   - **Документация**: platform.deepseek.com/docs/api — "Compatible with OpenAI API, temperature defaults to 1".\n\n### Общие рекомендации для вашего приложения\n- **Почему 1.0 по умолчанию?** Это баланс между креативностью и coherentностью — подходит для большинства чат-запросов. Для детерминированных ответов (например, генерация таблиц) устанавливайте 0.0–0.2. Для креатива — 0.8–1.2.\n- **Влияние на таблицы/файлы**: При генерации CSV/JSON низкая температура (0.0) даёт более стабильные, повторяемые данные; высокая — варьирует.\n- **Переопределение**: Всегда указывайте temperature в запросе для consistency. В приложении храните его как настройку пользователя (например, слайдер 0–2).\n- **Тестирование**: Два одинаковых запроса с temperature=1.0 дадут разные ответы; с 0.0 — одинаковые (если seed не меняется, но seed по умолчанию random).\n- **Другие параметры**: top_p=1.0 (по умолчанию) — используйте с temperature для тонкой настройки. Если генерируете код или данные, комбинируйте с max_tokens для лимита длины.\n- **Стоимость**: Температура не влияет на цену напрямую, но высокая может привести к более длинным/хаотичным ответам, увеличивая токены.\n\nЕсли нужны примеры с разными температурами, сравнение ответов или интеграция в код вашего приложения — уточните!	grok-4-fast	\N	2025-10-27 07:35:43.333756+00
f021a5e9-2c14-4961-92cd-2258d534d61c	ebcccf6a-9cdf-4b03-bf11-113f88ebff8f	f6979247-726b-487c-8b13-ef5e1ae056d9	user	нужно ли одновременно использовать температуру, top_k и top_p?	grok-4-fast	\N	2025-10-27 07:48:00.217016+00
e807fc54-d529-47d7-92d0-28a358ac1843	ebcccf6a-9cdf-4b03-bf11-113f88ebff8f	f6979247-726b-487c-8b13-ef5e1ae056d9	assistant	Нет, не обязательно использовать температуру (temperature), top_k и top_p одновременно в запросах через API. Эти параметры предназначены для тонкой настройки "случайности" и разнообразия генерации текста, но они работают независимо или в комбинациях. Вы можете использовать только один (или ни одного — тогда применятся значения по умолчанию), чтобы добиться нужного баланса между креативностью и предсказуемостью. Однако комбинирование их часто рекомендуется для более точного контроля, особенно в приложениях, где важна consistency (например, при генерации таблиц или кода).\n\nЯ разберу по моделям, как это работает, когда стоит комбинировать и примеры. Параметры влияют на выбор следующего токена:\n- **Temperature**: Делает распределение вероятностей более "острым" (низкая — детерминировано) или "плоским" (высокая — случайно). Диапазон: 0–2.\n- **top_p (nucleus sampling)**: Ограничивает выбор токенов до тех, чья кумулятивная вероятность ≥ p (например, p=0.9 — 90% вероятного "ядра"). По умолчанию 1.0 (все токены).\n- **top_k**: Ограничивает выбор только топ-k наиболее вероятных токенов (например, k=40). Доступен не во всех API.\n\nЕсли не указать, используются дефолты (см. предыдущий ответ). Для вашего приложения: начните с temperature, добавляйте top_p/top_k для экспериментов.\n\n### 1. **ChatGPT (OpenAI API)**\n   - **Поддержка**: Temperature и top_p — да (top_k — нет, OpenAI не использует top_k в чат-API).\n   - **Нужно ли комбинировать?** Не обязательно, но рекомендуется: temperature=0.7 + top_p=0.9 для баланса (креативно, но без "мусора"). Если только temperature=1.0 — хватит для большинства случаев. Top_p полезен, чтобы избежать редких, бессмысленных токенов в длинных ответах.\n   - **Когда использовать одновременно**:\n     - Для таблиц/данных: temperature=0.2 + top_p=0.95 (стабильно, мало вариаций).\n     - Для креатива: temperature=0.8 + top_p=0.9 (разнообразно, но coherentно).\n   - **Пример (Python)**:\n     ```python\n     response = client.chat.completions.create(\n         model="gpt-4o",\n         messages=[{"role": "user", "content": "Сгенерируй таблицу в CSV."}],\n         temperature=0.7,  # Основной контроль случайности\n         top_p=0.9  # + Ограничение на 90% вероятных токенов (опционально)\n         # top_k не поддерживается\n     )\n     ```\n   - **Документация**: platform.openai.com/docs/api-reference/chat/create — комбинируйте для "fine-grained control".\n\n### 2. **Grok (xAI API)**\n   - **Поддержка**: Temperature и top_p — да (top_k — нет, как в OpenAI-совместимом формате).\n   - **Нужно ли комбинировать?** Аналогично OpenAI: не обязательно, но полезно для снижения "галлюцинаций" в ответах Grok (который склонен к юмору). По умолчанию (temperature=1.0, top_p=1.0) — стандартно, но добавьте top_p=0.95 для стабильности в приложении.\n   - **Когда использовать одновременно**:\n     - Для анализа/таблиц: temperature=0.0 + top_p=1.0 (детерминировано).\n     - Для чата: temperature=1.0 + top_p=0.9 (разнообразно, без отклонений).\n   - **Пример (Python, с openai-совместимостью)**:\n     ```python\n     from openai import OpenAI\n     client = OpenAI(base_url="https://api.x.ai/v1", api_key="your_key")\n     response = client.chat.completions.create(\n         model="grok-beta",\n         messages=[{"role": "user", "content": "Расскажи о AI."}],\n         temperature=0.8,\n         top_p=0.95  # Опционально, для фокуса\n     )\n     ```\n   - **Документация**: developers.x.ai/docs — следует OpenAI, комбинация optional.\n\n### 3. **Gemini (Google Gemini API или Vertex AI)**\n   - **Поддержка**: Temperature, top_p и top_k — все да (уникально для Gemini среди этих моделей).\n   - **Нужно ли комбинировать?** Часто да: Gemini по умолчанию использует top_p=0.95 + top_k=40, что уже даёт хороший баланс. Temperature можно добавить для основной настройки. Если использовать только temperature — модель будет полагаться на дефолты top_p/top_k. Комбо полезно для мультимодальных запросов (с файлами), чтобы избежать случайных интерпретаций.\n   - **Когда использовать одновременно**:\n     - Для таблиц/анализа файлов: temperature=0.1 + top_p=0.8 + top_k=20 (очень стабильно, минимум ошибок).\n     - Для креатива: temperature=1.0 + top_p=1.0 + top_k=50 (широкий выбор).\n     - Совет: Если top_k слишком мал (например, 10), ответы станут предсказуемыми; комбинируйте с top_p для гибкости.\n   - **Пример (Python)**:\n     ```python\n     import google.generativeai as genai\n     genai.configure(api_key="your_key")\n     model = genai.GenerativeModel('gemini-1.5-pro')\n     response = model.generate_content(\n         "Проанализируй таблицу.",\n         generation_config=genai.types.GenerationConfig(\n             temperature=0.5,  # Основное\n             top_p=0.9,        # + Ограничение вероятностей\n             top_k=40          # + Топ-40 токенов (опционально, дефолт)\n         )\n     )\n     ```\n   - **Документация**: ai.google.dev/gemini-api/docs/text-generation — "Combine for nuanced control; defaults are tuned for quality".\n\n### 4. **DeepSeek (DeepSeek API)**\n   - **Поддержка**: Temperature и top_p — да (top_k — нет, OpenAI-совместимо).\n   - **Нужно ли комбинировать?** Не обязательно, особенно для кодинга (DeepSeek-Coder любит низкую temperature). По умолчанию хватит, но top_p=0.9 добавит стабильности при генерации данных/таблиц.\n   - **Когда использовать одновременно**:\n     - Для кода/CSV: temperature=0.2 + top_p=0.95 (минимальные вариации).\n     - Для общего чата: temperature=1.0 + top_p=1.0 (дефолт).\n   - **Пример (Python)**:\n     ```python\n     from openai import OpenAI\n     client = OpenAI(base_url="https://api.deepseek.com/v1", api_key="your_key")\n     response = client.chat.completions.create(\n         model="deepseek-coder",\n         messages=[{"role": "user", "content": "Напиши скрипт для таблицы."}],\n         temperature=0.3,\n         top_p=0.9  # Опционально\n     )\n     ```\n   - **Документация**: platform.deepseek.com/docs — как OpenAI, комбо не обязательно.\n\n### Общие рекомендации для вашего приложения\n- **Не нужно все сразу**: Начните с temperature (самый универсальный). Добавляйте top_p, если ответы слишком "дикие" (высокая temp). Top_k — только если API поддерживает (Gemini) и нужно жёстко ограничить (редко для чата).\n- **Влияние на генерацию файлов/таблиц**: Низкие значения (temp=0.1, top_p=0.9) дают повторяемые CSV/JSON — идеально для вашего случая. Высокие — варьируют данные, что может быть полезно для тестов.\n- **Эксперименты**: В приложении добавьте UI для этих параметров (например, слайдеры). Тестируйте на одном промпте: с разными комбо увидите, как меняется output (используйте seed для reproducibility, если доступно).\n- **Потенциальные проблемы**: Комбо может увеличить время генерации или токены. В Gemini top_k + top_p — это "nucleus with k-cap", так что не переусердствуйте (top_p=0.95 + top_k=40 — золотая середина).\n- **Альтернативы**: Если нужны продвинутые сэмплеры, посмотрите на Hugging Face Transformers (для локальных моделей), где больше опций.\n\nЕсли хотите примеры сравнения ответов с разными параметрами, код для A/B-тестирования или настройку для конкретной модели — скажите!	grok-4-fast	\N	2025-10-27 07:48:09.322074+00
228085e4-9064-4c39-b14e-958188e2eea4	ebcccf6a-9cdf-4b03-bf11-113f88ebff8f	f6979247-726b-487c-8b13-ef5e1ae056d9	user	в каких случаях целесообразно использовать top_k	grok-4-fast	\N	2025-10-27 07:52:40.380563+00
c6730d01-f9c8-4f56-8f96-7b75b87fe6ea	ebcccf6a-9cdf-4b03-bf11-113f88ebff8f	f6979247-726b-487c-8b13-ef5e1ae056d9	assistant	Вот подробный ответ на ваш вопрос о параметре top_k в API моделей AI. Top_k (или top-k sampling) — это метод сэмплинга, который ограничивает выбор следующего токена (слова или части слова) только к k наиболее вероятным вариантам из всего словаря модели. Например, если top_k=40, модель будет выбирать только из топ-40 самых вероятных токенов на каждом шаге, игнорируя менее вероятные (даже если они в принципе возможны). Это снижает "шум" и галлюцинации, делая ответы более предсказуемыми и coherentными, но может уменьшить креативность.\n\nTop_k **не всегда доступен** (в отличие от temperature и top_p). Он полезен в сценариях, где нужно балансировать между разнообразием и стабильностью, особенно в длинных генерациях. Не используйте его по умолчанию — только когда дефолтные параметры (top_p) не дают нужного контроля. Диапазон: обычно 1–100+ (маленький k — очень детерминировано, большой — близко к top_p=1.0).\n\nЯ разберу по моделям из нашего разговора, когда целесообразно использовать top_k, и приведу примеры. Информация на основе docs 2024 года.\n\n### 1. **ChatGPT (OpenAI API)**\n   - **Поддержка**: Нет, top_k не поддерживается в chat.completions или assistants API. OpenAI полагается на top_p (nucleus sampling), который более гибкий и эффективный для их моделей (он динамически выбирает "ядро" вероятностей, а не фиксированное k).\n   - **Когда целесообразно?** Не применимо. Вместо top_k используйте top_p=0.8–0.95 для похожего эффекта (ограничение на 80–95% вероятных токенов). Это даёт то же: снижает редкие токены без жёсткого лимита.\n   - **Альтернатива**: Если нужно "top_k-подобное" поведение, комбинируйте temperature=0.7 + top_p=0.9. Для вашего приложения с таблицами — хватит top_p для стабильных CSV-данных.\n   - **Документация**: platform.openai.com/docs — top_k отсутствует.\n\n### 2. **Grok (xAI API)**\n   - **Поддержка**: Нет, как в OpenAI-совместимом формате (xAI следует spec OpenAI). Только temperature и top_p.\n   - **Когда целесообразно?** Не применимо. Grok (особенно Grok-2) уже настроен на coherentные ответы, так что top_p=0.9 + temperature=0.5 — оптимально для контроля разнообразия. Для анализа файлов или генерации таблиц используйте это, чтобы избежать случайных вариаций в данных.\n   - **Альтернатива**: Если Grok обновит API (проверьте developers.x.ai), то возможно добавят. Пока — полагайтесь на top_p.\n   - **Документация**: developers.x.ai/docs — без top_k.\n\n### 3. **Gemini (Google Gemini API или Vertex AI)**\n   - **Поддержка**: Да, top_k доступен в generation_config (для gemini-pro, gemini-1.5-pro и т.д.). По умолчанию top_k=40 (баланс). Можно установить от 1 до 1024+.\n   - **Когда целесообразно использовать?** Top_k особенно полезен в Gemini, потому что модель мультимодальная (работа с файлами, изображениями, видео) и склонна к более "широкому" словарю. Используйте в случаях:\n     - **Генерация структурированных данных (таблицы, JSON, CSV)**: top_k=20–50 — минимизирует ошибки в форматах, делая вывод стабильным. Например, при анализе PDF с таблицей: низкий top_k предотвратит вставку случайных символов в данные.\n     - **Длинные ответы или цепочки (chain-of-thought)**: top_k=30–60 — снижает "drift" (отклонение от темы) в многошаговых рассуждениях, полезно для вашего приложения с API-цепочками.\n     - **Мультимодальный анализ файлов**: При описании изображений/видео (например, "извлеки таблицу из скриншота Excel") — top_k=40 — фокусирует на релевантных токенах, избегая галлюцинаций о несуществующих деталях.\n     - **Кодогенерация или точные инструкции**: top_k=10–20 — для предсказуемых скриптов (например, Python для обработки Excel), где креативность не нужна.\n     - **Избегать в креативных задачах**: Если генерируете истории или мозговой штурм — установите top_k=100+ или отключите (top_k=0 эквивалентно отсутствию).\n   - **Комбинация**: Часто используйте с top_p и temperature. Пример: temperature=0.5 + top_p=0.9 + top_k=40 — золотая середина для стабильности без скуки.\n   - **Пример (Python)**:\n     ```python\n     import google.generativeai as genai\n     genai.configure(api_key="your_key")\n     model = genai.GenerativeModel('gemini-1.5-pro')\n\n     # Для анализа таблицы в файле (предполагаем загруженный img)\n     response = model.generate_content(\n         ["Извлеки данные таблицы из изображения в JSON.", img],  # img — загруженный файл\n         generation_config=genai.types.GenerationConfig(\n             temperature=0.3,  # Низкая для стабильности\n             top_p=0.95,       # Ограничение вероятностей\n             top_k=30          # Топ-30 токенов: целесообразно для точных данных\n         )\n     )\n     print(response.text)  # Стабильный JSON без случайностей\n     ```\n   - **Лимиты и влияние**: Низкий top_k ускоряет генерацию, но может сделать текст "плоским". В Vertex AI top_k интегрируется с safety-фильтрами.\n   - **Документация**: ai.google.dev/gemini-api/docs/text-generation — "Use top_k for fixed-size filtering in scenarios requiring consistency".\n\n### 4. **DeepSeek (DeepSeek API)**\n   - **Поддержка**: Нет, OpenAI-совместимо (только temperature и top_p). DeepSeek фокусируется на коде/тексте, без мультимодальности.\n   - **Когда целесообразно?** Не применимо. Для генерации кода или таблиц используйте top_p=0.9 + temperature=0.2 — это даст похожий эффект ограничения на "топ-варианты".\n   - **Альтернатива**: Если DeepSeek хостится на Hugging Face, там в Transformers можно вручную реализовать top_k (но это не через их API).\n   - **Документация**: platform.deepseek.com/docs — без top_k.\n\n### Общие случаи, когда целесообразно использовать top_k (если поддерживается)\n- **Высокая точность нужна**: В задачах вроде извлечения данных из файлов (PDF, изображения таблиц) — top_k=20–50 предотвращает вставку редких, неверных токенов (например, "сумма: 1000" не станет "сумма: 1000ззз").\n- **Контроль галлюцинаций**: В моделях с большим словарем (как Gemini) — для фактов, Q&A или анализа, где случайные токены могут искажать информацию.\n- **Эффективность**: Для мобильных/быстрых приложений — низкий top_k (10–30) ускоряет inference, так как меньше вычислений.\n- **Тестирование/производство**: В вашем приложении для API — используйте top_k в "режиме точности" (например, для генерации Excel-данных), чтобы ответы были воспроизводимыми при A/B-тестах.\n- **Когда НЕ использовать**:\n  - Креативный контент (рассказы, идеи) — top_k сделает его скучным.\n  - Короткие ответы — дефолтные параметры хватит.\n  - Если API не поддерживает (OpenAI/Grok) — top_p лучше, так как адаптивен (k динамическое).\n\n### Рекомендации для вашего приложения\n- **Интеграция**: Если вы работаете с Gemini (единственная с top_k здесь), добавьте его как опцию в UI (выпадающий список: "Низкий (20)", "Средний (40)", "Высокий (100)"). Для других моделей — fallback на top_p.\n- **Тестирование**: Сравните ответы: один промпт с top_k=20 vs. без — увидите меньше вариаций в таблицах (идеально для CSV → Excel).\n- **Производительность**: Top_k влияет на токены/время: низкий — дешевле. Мониторьте в логах.\n- **Альтернативы в других API**: В Anthropic Claude или Cohere top_k тоже есть — рассмотрите, если расширяете приложение. Для локальных моделей (Llama) — используйте в libraries вроде vLLM.\n\nЕсли нужны примеры сравнения (с/без top_k), код для экспериментов или настройка для Gemini с файлами — уточните!	grok-4-fast	\N	2025-10-27 07:52:54.317768+00
cb0db396-2860-43f1-a88b-40378a89da82	ebcccf6a-9cdf-4b03-bf11-113f88ebff8f	f6979247-726b-487c-8b13-ef5e1ae056d9	user	теперь расскажи, как совместно использовать температуру и top_p	grok-4-fast	\N	2025-10-27 07:57:38.256479+00
1fdc8945-7dfe-4d35-b339-650c33ce3735	ebcccf6a-9cdf-4b03-bf11-113f88ebff8f	f6979247-726b-487c-8b13-ef5e1ae056d9	assistant	Вот подробный разбор, как совместно использовать параметры temperature и top_p в API моделей AI. Эти два параметра — ключевые для контроля "случайности" генерации: temperature масштабирует распределение вероятностей токенов (низкая — предсказуемо, высокая — креативно), а top_p (nucleus sampling) динамически ограничивает выбор токенов до тех, чья кумулятивная вероятность ≥ p (например, p=0.9 — только 90% "основных" вариантов, отсекая редкие). \n\n**Почему комбинировать?** Они дополняют друг друга: temperature задаёт "температуру" всего распределения (делает его острее или шире), а top_p обрезает "хвост" низковероятных токенов, предотвращая бессмысленные или галлюцинирующие ответы. Без комбо (только temperature=1.0) ответы могут быть слишком хаотичными; с комбо — вы получаете баланс. Рекомендуемая пара: temperature=0.7 + top_p=0.9 (креативно, но coherentно). Диапазоны: temperature 0–2, top_p 0–1 (0.95–0.99 — стандарт для стабильности).\n\nВсе упомянутые модели поддерживают оба параметра (по умолчанию temperature=1.0, top_p=1.0). Я опишу по моделям, с примерами для вашего приложения (генерация таблиц/данных).\n\n### 1. **ChatGPT (OpenAI API)**\n   - **Как работает комбо**: Temperature влияет на вероятности перед сэмплингом, top_p — на выбор. В OpenAI это стандарт для чата и assistants. Используйте для снижения вариаций в структурированных ответах (CSV/JSON).\n   - **Сценарии совместного использования**:\n     - Стабильные данные (таблицы): temperature=0.2 + top_p=0.95 — минимум случайностей, повторяемые результаты.\n     - Креативный анализ файлов: temperature=0.8 + top_p=0.9 — разнообразие интерпретаций, но без "мусора".\n     - Избегайте: temperature>1.0 + top_p=1.0 — может дать нерелевантные токены.\n   - **Пример (Python)**:\n     ```python\n     from openai import OpenAI\n     client = OpenAI(api_key="your_key")\n\n     response = client.chat.completions.create(\n         model="gpt-4o",\n         messages=[{"role": "user", "content": "Сгенерируй CSV-таблицу продаж с 5 строками."}],\n         temperature=0.5,  # Средняя "температура": умеренная креативность в данных\n         top_p=0.95,       # Ограничивает до 95% вероятных токенов: стабильный формат CSV\n         max_tokens=200\n     )\n     csv_data = response.choices[0].message.content\n     print(csv_data)  # Получите предсказуемую таблицу без ошибок в структуре\n     ```\n   - **Документация**: platform.openai.com/docs/api-reference/chat/create — "Use together for nuanced randomness".\n\n### 2. **Grok (xAI API)**\n   - **Как работает комбо**: Аналогично OpenAI (совместимый формат). Grok склонен к юмору, так что top_p помогает "приземлить" ответы, а temperature — регулировать стиль.\n   - **Сценарии**:\n     - Генерация таблиц: temperature=0.3 + top_p=0.98 — фокус на фактах, минимум отклонений.\n     - Чат с анализом (если vision): temperature=0.7 + top_p=0.9 — креативные insights без хаоса.\n     - Для вашего API: Используйте в production для consistent ответов на повторные запросы.\n   - **Пример (Python, с openai-совместимостью)**:\n     ```python\n     from openai import OpenAI\n     client = OpenAI(base_url="https://api.x.ai/v1", api_key="your_xai_key")\n\n     response = client.chat.completions.create(\n         model="grok-beta",\n         messages=[{"role": "user", "content": "Проанализируй данные: продажи 100, 200, 300."}],\n         temperature=0.6,  # Лёгкая креативность в интерпретации\n         top_p=0.92,       # Обрезает редкие токены: coherentный анализ\n         max_tokens=150\n     )\n     analysis = response.choices[0].message.content\n     print(analysis)  # Стабильный вывод, подходящий для таблицы\n     ```\n   - **Документация**: developers.x.ai/docs — как OpenAI, комбо рекомендуется для контроля.\n\n### 3. **Gemini (Google Gemini API или Vertex AI)**\n   - **Как работает комбо**: В Gemini temperature применяется к распределению, top_p — динамически (дефолт top_p=0.95). Идеально для мультимодальных запросов с файлами, где нужно избежать случайных интерпретаций.\n   - **Сценарии**:\n     - Анализ файлов (PDF/изображения таблиц): temperature=0.1 + top_p=0.8 — высокая точность, минимум галлюцинаций.\n     - Генерация/модификация данных: temperature=0.7 + top_p=0.95 — баланс для креативных таблиц (например, "добавь прогнозы").\n     - В Vertex AI: Комбо с safety-settings для enterprise-приложений.\n     - Совет: Если top_p низкий (0.7), комбинируйте с низкой temperature, чтобы не "задушить" креативность.\n   - **Пример (Python)**:\n     ```python\n     import google.generativeai as genai\n     genai.configure(api_key="your_key")\n     model = genai.GenerativeModel('gemini-1.5-pro')\n\n     # Предполагаем загруженный файл (img — изображение таблицы)\n     img = genai.upload_file(path="table_image.jpg")\n     response = model.generate_content(\n         ["Извлеки таблицу в JSON и добавь расчёты.", img],\n         generation_config=genai.types.GenerationConfig(\n             temperature=0.4,  # Низкая: фокус на точности извлечения\n             top_p=0.9,        # 90% вероятностей: избегает ошибок в числах/структуре\n             max_output_tokens=300\n         )\n     )\n     json_data = response.text\n     print(json_data)  # Точный JSON для вашего Excel-конвертера\n     ```\n   - **Документация**: ai.google.dev/gemini-api/docs/text-generation — "Temperature scales the logits, top_p samples from the nucleus; combine for quality control".\n\n### 4. **DeepSeek (DeepSeek API)**\n   - **Как работает комбо**: OpenAI-совместимо, фокус на коде/тексте. Temperature для стиля кода, top_p — для стабильности в данных.\n   - **Сценарии**:\n     - Код для таблиц (Python с pandas): temperature=0.2 + top_p=0.95 — предсказуемый код без багов.\n     - Генерация CSV: temperature=0.5 + top_p=0.98 — лёгкие вариации в примерах данных.\n     - Идеально для вашего приложения: Низкие значения для reproducible скриптов обработки API-ответов.\n   - **Пример (Python)**:\n     ```python\n     from openai import OpenAI\n     client = OpenAI(base_url="https://api.deepseek.com/v1", api_key="your_key")\n\n     response = client.chat.completions.create(\n         model="deepseek-coder",\n         messages=[{"role": "user", "content": "Напиши код для создания Excel из CSV."}],\n         temperature=0.3,  # Низкая: точный, функциональный код\n         top_p=0.95,       # Ограничение: без случайных библиотек/ошибок\n         max_tokens=400\n     )\n     code = response.choices[0].message.content\n     print(code)  # Готовый скрипт для вашего приложения\n     ```\n   - **Документация**: platform.deepseek.com/docs — совместимо с OpenAI, используйте комбо для precision.\n\n### Общие рекомендации для вашего приложения\n- **Как настроить**: В UI добавьте слайдеры (temperature 0–1.5, top_p 0.8–1.0) с пресетами: "Точный" (0.2 + 0.95), "Креативный" (0.8 + 0.9), "Стандарт" (1.0 + 1.0). Для таблиц/файлов — всегда "Точный", чтобы избежать искажений в данных (например, неверные числа в CSV).\n- **Влияние на генерацию**: Комбо снижает вариации: два запроса с temp=0.7 + top_p=0.9 дадут похожие ответы (в 80–90% случаев), в отличие от дефолта. Для файлов — помогает в извлечении (меньше ошибок в OCR/анализе).\n- **Тестирование и влияние**: \n  - Низкая temp + средний top_p: Стабильно, быстро, дешево (меньше токенов).\n  - Высокая temp + низкий top_p: Креативно, но рискованно (может "срезать" хорошие идеи).\n  - Экспериментируйте: Отправьте один промпт 5 раз и сравните (используйте seed, если API поддерживает, для reproducibility).\n- **Проблемы**: Высокая temp + top_p<0.8 может сделать ответы слишком узкими (скучными). Стоимость не меняется, но мониторьте длину output.\n- **Совет**: В цепочках (chain-of-thought) используйте разные комбо: низкое для фактов, выше для идей.\n\nЕсли нужны сравнения ответов с разными комбо, полный код для A/B-тестирования или настройка для конкретного сценария (например, с файлами) — дайте знать!	grok-4-fast	\N	2025-10-27 07:57:54.086539+00
1621ca01-a617-4a4f-a703-767e90664522	036c01d3-10c3-4861-896f-e30139ee5230	702cf750-b8ea-4bb9-b553-c8eabda2dd9d	user	gpt при работе через api использует сервис Assistants API для работы с файлами, которые прилагает пользователь к запросу. А есть ли такие же сервисы у deepseek, gemini, grok?	grok-4-fast	\N	2025-10-27 08:43:51.03885+00
4c67392f-9444-43b2-ad7f-80a06a85b921	036c01d3-10c3-4861-896f-e30139ee5230	702cf750-b8ea-4bb9-b553-c8eabda2dd9d	assistant	Да, я разберу ваш вопрос по порядку. Вы имеете в виду OpenAI Assistants API, который позволяет загружать файлы (например, PDF, изображения, код) и работать с ними через инструменты вроде Retrieval (поиск по файлам) или Code Interpreter (анализ и выполнение кода). Это часть OpenAI API для создания ассистентов, которые обрабатывают файлы в контексте беседы.\n\nТеперь о других моделях/сервисах. Я опираюсь на актуальную информацию на момент моего последнего обновления (2024 год); рекомендую проверить официальную документацию, так как API эволюционируют быстро.\n\n### DeepSeek\n- **Поддержка файлов через API**: DeepSeek (deepseek.com) предоставляет API, похожий на OpenAI (chat completions), но **нет эквивалента Assistants API с полноценной работой с файлами**. \n  - Вы можете отправлять текст файлов в запросе (например, содержимое PDF как строку), но прямой загрузки файлов (upload) и их обработки (как Retrieval или интерпретация) нет. API фокусируется на текстовых и кодовых задачах, с поддержкой мультимодальности в некоторых моделях (например, DeepSeek-V2), но это в основном для изображений через vision-модели.\n  - Если нужно работать с файлами, придётся вручную извлекать содержимое (например, с помощью библиотек вроде PyPDF2) и вставлять в промпт. Нет встроенных инструментов для хранения/поиска по файлам.\n- **Альтернативы**: DeepSeek больше ориентирован на разработчиков для кодирования; для файлов лучше комбинировать с внешними сервисами.\n\n### Gemini (Google)\n- **Поддержка файлов через API**: Да, есть похожие возможности, но не точный аналог Assistants API. Google предоставляет Gemini API через Google AI Studio (для тестов) или Vertex AI (для продакшена).\n  - **Загрузка и обработка файлов**: Поддерживается прямой upload файлов (PDF, изображения, аудио, видео) для мультимодальных моделей (Gemini 1.5 Pro/Flash). Вы можете анализировать содержимое файлов в одном запросе — например, суммировать PDF, описывать изображения или извлекать данные из таблиц.\n  - **Инструменты**: В Vertex AI есть "Generative AI Studio" и "function calling" для интеграции с внешними инструментами. Для Retrieval-подобной функциональности можно использовать Google Cloud Storage + embeddings (через Vertex AI Search and Conversation). Нет "ассистентов" как в OpenAI, но вы можете строить цепочки запросов для обработки файлов.\n  - **Ограничения**: Файлы до 2 ГБ (в Gemini 1.5), но контекст ограничен (до 1 млн токенов). Поддержка через REST API или SDK (Python, Node.js).\n- **Альтернативы**: Если нужно что-то вроде ассистентов, посмотрите на Google Cloud's Agent Builder или интеграцию с LangChain для кастомных workflow.\n\n### Grok (xAI)\n- **Поддержка файлов через API**: Пока **ограниченная**, и нет полноценного эквивалента Assistants API. xAI API (api.x.ai) в бета-версии (на 2024 год) и фокусируется на базовых чат-комплетициях с Grok-1 или Grok-2.\n  - **Загрузка файлов**: Поддержка vision (изображения) есть — вы можете отправлять base64-encoded изображения для анализа (например, описать фото). Для других файлов (PDF, документы) прямой upload нет; придётся конвертировать в текст или изображения вручную.\n  - **Инструменты**: Есть function calling для интеграции с внешними API, но нет встроенных инструментов для файлов вроде Retrieval или интерпретации кода. Grok на платформе x.com (Twitter) может обрабатывать изображения, но API более базовый.\n  - **Ограничения**: API ещё развивается; на момент релиза (ноябрь 2023) акцент на текст и изображения, без хранения файлов или долгосрочных ассистентов.\n- **Альтернативы**: Для продвинутой работы с файлами интегрируйте с внешними библиотеками. xAI обещает расширения, так что следите за обновлениями.\n\n### Итог\n- **Ближе всего к Assistants API**: Gemini (Google) — с хорошей поддержкой мультимодальных файлов и инструментами в Vertex AI.\n- **Менее развито**: DeepSeek и Grok — они больше для текстовых/кодовых задач, без native file handling. Для них часто нужно предобработка файлов.\n- Если вы строите приложение, рассмотрите фреймворки вроде LangChain или LlamaIndex, которые позволяют добавлять file upload ко всем этим API.\n\nЕсли нужны детали по коду или примерам, уточните!	grok-4-fast	\N	2025-10-27 08:44:09.083691+00
5acc1d2d-dd64-4c9b-90be-93911847443b	036c01d3-10c3-4861-896f-e30139ee5230	702cf750-b8ea-4bb9-b553-c8eabda2dd9d	user	возможно, более продуктивным будет решение на базе LlamaIndex?	grok-4-fast	\N	2025-10-27 11:46:30.103099+00
f7a223ab-bf0a-4343-9f93-3116f65b46e9	036c01d3-10c3-4861-896f-e30139ee5230	702cf750-b8ea-4bb9-b553-c8eabda2dd9d	assistant	Да, решение на базе LlamaIndex (ранее известного как GPT Index) действительно может быть более продуктивным и гибким подходом, особенно если вы хотите работать с файлами в API разных моделей (DeepSeek, Gemini, Grok и других), без сильной зависимости от одного провайдера вроде OpenAI. Давайте разберём, почему это хорошая идея, и как это реализовать.\n\n### Почему LlamaIndex продуктивен для вашей задачи?\n- **Универсальность**: LlamaIndex — это open-source фреймворк для RAG (Retrieval-Augmented Generation), который позволяет загружать, индексировать и искать по файлам (PDF, DOCX, TXT, изображения с OCR, даже базы данных). Он интегрируется с **более 100 LLM-провайдерами**, включая:\n  - DeepSeek (через их API).\n  - Gemini (Google Vertex AI или Google AI Studio).\n  - Grok (xAI API).\n  - Плюс OpenAI, Anthropic, Hugging Face и локальные модели (например, Llama 3).\n  Это решает проблему отсутствия native file handling в DeepSeek/Grok — вы можете использовать их как "мозг" для генерации, а LlamaIndex как "хранилище и поисковик".\n  \n- **Похожесть на Assistants API**: LlamaIndex предоставляет функционал вроде Retrieval (поиск по векторным embeddings файлов), Query Engine (цепочки запросов) и даже инструменты для code interpretation (через интеграцию с LangChain). Вы можете строить "ассистентов", которые обрабатывают файлы в контексте беседы, без необходимости вручную парсить содержимое.\n\n- **Преимущества по сравнению с native API**:\n  - **Кросс-платформенность**: Не привязаны к одному API — легко переключаться между моделями (например, DeepSeek для дешёвого кодирования, Gemini для мультимодальности).\n  - **Масштабируемость**: Индексация файлов может быть локальной (на вашем сервере) или в облаке (с векторными БД вроде Pinecone, Weaviate или FAISS). Поддержка больших объёмов данных (миллионы документов).\n  - **Эффективность**: Автоматическая chunking (разделение файлов на части), embedding (векторизация) и релевантный поиск — это снижает токены в промптах и делает ответы точнее.\n  - **Открытость**: Бесплатно, кастомизируется, и вы контролируете данные (в отличие от OpenAI, где файлы хранятся на их серверах).\n\n- **Ограничения**:\n  - Требует больше разработки: Нужно установить библиотеку (`pip install llama-index`), настроить API-ключи и написать код. Не "из коробки" как Assistants API.\n  - Для мультимодальности (изображения/видео) нужны дополнительные интеграции (например, с Gemini для vision).\n  - Хостинг: Если файлы большие, понадобится векторная БД (бесплатные опции есть, но для продакшена — платные).\n  - Стоимость: Зависит от LLM (DeepSeek дешёвый, Gemini/Grok — средние), плюс embeddings (можно использовать бесплатные модели вроде sentence-transformers).\n\n### Как это реализовать: Краткий обзор\n1. **Установка и базовая настройка**:\n   ```bash\n   pip install llama-index llama-index-embeddings-huggingface llama-index-llms-openai  # Для OpenAI; аналогично для других\n   # Для DeepSeek: pip install llama-index-llms-deepseek\n   # Для Gemini: pip install llama-index-llms-google\n   # Для Grok: Пока интеграция через кастомный LLM wrapper (или OpenAI-совместимый endpoint).\n   ```\n\n2. **Пример кода для индексации и запроса (Python)**:\n   Предположим, у вас есть PDF-файл. Вот простой workflow с DeepSeek (адаптируйте для других).\n\n   ```python\n   from llama_index.core import VectorStoreIndex, SimpleDirectoryReader, Settings\n   from llama_index.llms.deepseek import DeepSeek  # Или другой LLM\n   from llama_index.embeddings.huggingface import HuggingFaceEmbedding\n\n   # Настройка LLM и embeddings\n   llm = DeepSeek(api_key="your_deepseek_api_key", model="deepseek-chat")\n   embed_model = HuggingFaceEmbedding(model_name="sentence-transformers/all-MiniLM-L6-v2")  # Бесплатные embeddings\n\n   Settings.llm = llm\n   Settings.embed_model = embed_model\n\n   # Загрузка файлов (из директории или конкретного файла)\n   documents = SimpleDirectoryReader("path/to/your/files").load_data()  # Поддержка PDF, DOCX и т.д.\n\n   # Индексация (создание векторного индекса)\n   index = VectorStoreIndex.from_documents(documents)\n\n   # Создание query engine (как "ассистент")\n   query_engine = index.as_query_engine()\n\n   # Запрос\n   response = query_engine.query("Что сказано в файле о [тема]?")\n   print(response)\n   ```\n\n   - Для Gemini: Замените `llm = ...` на `from llama_index.llms.google import Gemini; llm = Gemini(api_key=...)`.\n   - Для Grok: Используйте `from llama_index.llms.openai import OpenAI` с endpoint xAI (если совместим), или кастомный класс.\n   - Если файлы включают изображения: Добавьте `from llama_index.readers.file import ImageReader` и интегрируйте vision-модель (Gemini подойдёт лучше).\n\n3. **Расширения**:\n   - **Хранение**: Для persistent индекса используйте `VectorStoreIndex.from_vector_store()` с БД вроде Chroma (локально) или Pinecone (облако).\n   - **Чат-ассистент**: `from llama_index.core.agent import ReActAgent` для conversational интерфейса с файлами.\n   - **Интеграция с другими фреймворками**: Комбинируйте с LangChain для function calling (например, вызов внешних API из Grok).\n\n### Рекомендации\n- **Начните с документации**: Официальный сайт llama-index.ai — там туториалы для каждого LLM. Для DeepSeek/Gemini/Grok проверьте integrations в их repo на GitHub.\n- **Тестирование**: Попробуйте на маленьком датасете. Если бюджет важен, DeepSeek + бесплатные embeddings = низкая стоимость.\n- **Альтернативы LlamaIndex**: Если нужно проще — LangChain (более общий, но сложнее для RAG) или Haystack (фокус на поиске). Для enterprise — Vertex AI Pipelines (Google) или Amazon Bedrock.\n\nЕсли вы опишете конкретный сценарий (тип файлов, объём, предпочитаемая модель), я могу дать более детальный пример кода или архитектуру. Это звучит как шаг к кастомному решению!	grok-4-fast	\N	2025-10-27 11:46:41.849866+00
9e6abd02-1f31-4409-933a-681804c104a2	036c01d3-10c3-4861-896f-e30139ee5230	702cf750-b8ea-4bb9-b553-c8eabda2dd9d	user	зачем в этой структуре LangChain?	grok-4-fast	\N	2025-10-27 13:28:45.191071+00
07237efa-8a94-4cae-be8a-1d2536014b41	036c01d3-10c3-4861-896f-e30139ee5230	702cf750-b8ea-4bb9-b553-c8eabda2dd9d	assistant	Ваш вопрос касается упоминания LangChain в моём предыдущем ответе как "расширения" для LlamaIndex. Давайте разберём это шаг за шагом — LangChain **не обязателен** в базовой структуре на LlamaIndex, и для многих задач (особенно чистого RAG с файлами) его можно опустить. Я упомянул его как опцию для более сложных сценариев. Вот почему и когда он может быть полезен.\n\n### Почему LangChain в этой структуре (и когда он не нужен)?\n- **LlamaIndex самодостаточен для вашей основной задачи**: LlamaIndex отлично справляется с загрузкой файлов, индексацией, поиском (Retrieval) и генерацией ответов на их основе. Он уже имеет встроенные "агенты" (например, `ReActAgent` или `OpenAIAgent`), query engines и даже базовый function calling для интеграции с LLM вроде DeepSeek, Gemini или Grok. Если вы просто хотите "прикрепить" файлы к запросам и получать ответы (аналог Assistants API), LlamaIndex — это всё, что нужно. Нет смысла добавлять LangChain для простоты.\n\n- **Когда LangChain добавляет ценность (опционально)**:\n  LangChain — это более общий фреймворк для построения LLM-приложений, с акцентом на **цепочки (chains)**, **агенты** и **инструменты (tools)**. Он полезен, если ваша структура выходит за рамки чистого file retrieval:\n  - **Function calling и внешние инструменты**: Если нужно, чтобы ассистент (на базе Grok или DeepSeek) вызывал внешние API (например, поиск в Google, расчёт в Wolfram Alpha, или обработку изображений через Gemini), LangChain упрощает это. LlamaIndex имеет базовый support для tools, но LangChain более зрелый в этом (с готовыми интеграциями для 100+ сервисов).\n  - **Сложные workflows**: Для multi-step цепочек — например, "извлечь данные из PDF → проанализировать в коде → отправить в базу данных → сгенерировать отчёт". LangChain позволяет строить такие пайплайны визуально или в коде.\n  - **Интеграция с другими компонентами**: LlamaIndex легко экспортирует индексы в LangChain (через `as_langchain_retriever()`), так что вы можете комбинировать: LlamaIndex для файлов + LangChain для агентов. Это особенно актуально для Grok/DeepSeek, где native tools слабы — LangChain "добавляет мозги" для динамических действий.\n  - **Мультимодальность и кастомизация**: Если файлы включают изображения/аудио, LangChain лучше интегрируется с vision-моделями (например, Gemini) и позволяет добавлять кастомные промпты/парсеры.\n\n  В итоге, LangChain — это "надстройка" для масштабирования от простого RAG к полноценному агенту. Без него структура остаётся лёгкой и фокусированной.\n\n- **Минусы добавления LangChain**:\n  - Увеличивает сложность: Больше зависимостей (`pip install langchain`), код становится verbose.\n  - Дублирование: Оба фреймворка пересекаются (оба используют embeddings, retrievers), так что комбо может быть избыточным.\n  - Если вы новичок, начните без него — LlamaIndex проще для file-centric задач.\n\n### Пример: Когда LangChain полезен (с LlamaIndex)\nПредположим, вы хотите, чтобы ассистент на Grok не только искал по файлам, но и вызывал внешний API (например, погоду для анализа данных из PDF).\n\n```python\nfrom llama_index.core import VectorStoreIndex, SimpleDirectoryReader\nfrom langchain.agents import create_react_agent, AgentExecutor\nfrom langchain.tools import Tool\nfrom langchain_openai import OpenAI  # Адаптируйте для Grok (через custom LLM)\n\n# Шаг 1: LlamaIndex для файлов (как раньше)\ndocuments = SimpleDirectoryReader("path/to/files").load_data()\nindex = VectorStoreIndex.from_documents(documents)\nretriever = index.as_retriever()  # Экспорт в LangChain-совместимый retriever\n\n# Шаг 2: LangChain для агента с tools\ndef file_search(query):\n    return retriever.retrieve(query)  # Поиск по файлам\n\ntools = [\n    Tool(name="FileSearch", func=file_search, description="Search in uploaded files"),\n    # Добавьте другие tools, напр. weather API\n]\n\nllm = OpenAI(temperature=0)  # Замените на Grok/DeepSeek wrapper\nagent = create_react_agent(llm, tools, prompt="You are a helpful assistant with access to files and external tools.")\nagent_executor = AgentExecutor(agent=agent, tools=tools)\n\n# Запрос\nresponse = agent_executor.invoke({"input": "На основе файла PDF, проверь погоду в Москве и обнови прогноз."})\nprint(response)\n```\n\nЗдесь LlamaIndex обрабатывает файлы, а LangChain — логику агента и вызовы tools. Без LangChain это можно сделать в LlamaIndex с `CustomAgent`, но с большим кодом.\n\n### Рекомендация\n- **Для базового случая (файлы + запросы)**: Только LlamaIndex — продуктивно и минималистично.\n- **Если нужны агенты/tools**: Добавьте LangChain как "плагин". Альтернативы — Semantic Kernel (Microsoft, проще для .NET) или чистый код без фреймворков (если объём мал).\n- Если ваш сценарий не требует внешних вызовов, игнорируйте LangChain — это сэкономит время.\n\nРасскажите больше о вашем use case (например, нужны ли внешние API?), и я уточню, стоит ли его добавлять!	grok-4-fast	\N	2025-10-27 13:28:56.461694+00
a8e9c46e-aff7-4b4b-966e-6ca4e14234bf	b90d21b0-68f1-4d86-a47e-c5fddbf00937	f6979247-726b-487c-8b13-ef5e1ae056d9	user	какие самые дальние из соседних?	grok-4-fast	\N	2025-10-28 06:26:09.934813+00
194be321-f3f7-4c79-8d10-c7dd5efe05e8	b90d21b0-68f1-4d86-a47e-c5fddbf00937	f6979247-726b-487c-8b13-ef5e1ae056d9	assistant	Среди **соседних планет** Солнечной системы (то есть последовательных по орбитам от Солнца), самая дальняя пара — это **Уран** и **Нептун**.\n\n- **Среднее расстояние между их орбитами**: примерно **1,63 миллиарда километров** (или около 10,9 астрономических единиц, АЕ). Это разница в их среднем расстоянии от Солнца: Уран — ~2,87 млрд км (19,2 АЕ), Нептун — ~4,5 млрд км (30,1 АЕ).\n- **Минимальное расстояние**: около 1,5–1,6 млрд км (когда они на одной стороне от Солнца).\n- **Максимальное расстояние**: до 3 млрд км (на противоположных сторонах).\n\nЭто самая удалённая соседняя пара из-за их положения на краю Солнечной системы. Для сравнения, ближайшая соседняя пара — Меркурий и Венера (~41 млн км). Данные основаны на измерениях NASA и Международной астрономической ассоциации (IAU). Если вы имеете в виду другой контекст (например, экзопланеты или "соседние" в смысле к Земле), уточните!	grok-4-fast	\N	2025-10-28 06:26:14.554211+00
9e50eebc-944e-4321-bf8a-41944011ac3c	9f543d24-126b-40f9-a428-f954b19c4548	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	user	какие еще есть страны с заморскими провинциями?	\N	\N	2025-10-28 11:48:26.467718+00
35c34798-1a79-4dd9-9c78-171cca50c0c2	9f543d24-126b-40f9-a428-f954b19c4548	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	assistant	Помимо Франции, несколько стран имеют заморские территории, которые являются частью их суверенитета, но географически отделены от основной территории. Эти территории могут иметь разный статус: от полностью интегрированных регионов (как во Франции) до самоуправляющихся территорий с высокой степенью автономии.\n\nВот некоторые из таких стран и их заморские владения:\n\n1.  **Великобритания (Соединенное Королевство)**\n    *   **Заморские территории Великобритании (British Overseas Territories):** Это 14 территорий, которые находятся под суверенитетом Великобритании, но не являются частью самой Великобритании. К ним относятся:\n        *   Гибралтар\n        *   Фолклендские острова\n        *   Бермудские острова\n        *   Каймановы острова\n        *   Британские Виргинские острова\n        *   Теркс и Кайкос\n        *   Ангилья\n        *   Монтсеррат\n        *   Остров Святой Елены, Вознесения и Тристан-да-Кунья\n        *   Южная Георгия и Южные Сандвичевы острова\n        *   Британская территория в Индийском океане\n        *   База Суверенных территорий Акротири и Декелия (на Кипре)\n        *   Питкэрн\n        *   Острова Теркс и Кайкос\n        *   Южная Георгия и Южные Сандвичевы острова\n\n2.  **США (Соединенные Штаты Америки)**\n    *   **Инсулярные территории (Insular Areas):** Территории, находящиеся под суверенитетом США, но не являющиеся частью какого-либо штата. Статус этих территорий может варьироваться.\n        *   **Организованные, включенные территории** (нет таких)\n        *   **Организованные, невключенные территории** (большинство)\n            *   Пуэрто-Рико (содружество)\n            *   Гуам (организованная территория)\n            *   Виргинские острова США (организованная территория)\n            *   Северные Марианские острова (содружество)\n            *   Американское Самоа (неорганизованная территория)\n        *   **Неорганизованные, невключенные территории** (малые острова и атоллы, не имеющие постоянного населения, например, атолл Мидуэй, остров Уэйк).\n\n3.  **Нидерланды**\n    *   **Карибские Нидерланды (Карибский регион):**\n        *   Аруба (федеративная единица)\n        *   Кюрасао (федеративная единица)\n        *   Синт-Мартен (федеративная единица)\n        *   Бонайре, Синт-Эстатиус, Саба (так называемые "особые общины" или муниципалитеты, которые являются прямыми частями Нидерландов, но имеют особый статус).\n    *   Эти территории вместе с европейскими Нидерландами образуют **Королевство Нидерландов**.\n\n4.  **Дания**\n    *   **Фарерские острова:** Самоуправляемая территория в Северной Атлантике.\n    *   **Гренландия:** Крупнейший остров в мире, обладающий широкой автономией.\n    *   Обе территории имеют статус "части королевства" с широким самоуправлением.\n\n5.  **Норвегия**\n    *   Имеет несколько **зависимых территорий** в полярных регионах, которые не являются частью Королевства Норвегии, а находятся под ее суверенитетом:\n        *   Шпицберген (имеет особый статус в соответствии с международным договором)\n        *   Ян-Майен (интегрированная, но удаленная территория)\n        *   Остров Буве (необитаемый)\n        *   Остров Петра I (необитаемый)\n        *   Земля Королевы Мод (территориальные претензии в Антарктике)\n\n6.  **Новая Зеландия**\n    *   **Свободно ассоциированные государства:**\n        *   Острова Кука\n        *   Ниуэ\n    *   Они являются самоуправляющимися, но Новая Зеландия отвечает за их оборону и внешнюю политику (по их запросу).\n    *   **Зависимые территории:**\n        *   Токелау (несамоуправляющаяся территория)\n        *   Территория Росса (антарктическая претензия)\n\nЭти примеры показывают, что концепция "заморских провинций" может иметь множество форм, от полностью интегрированных регионов (как Французская Гвиана) до практически независимых самоуправляющихся территорий, которые сохраняют символические или функциональные связи с метрополией.	\N	\N	2025-10-28 11:48:33.801086+00
0c8c547c-d1bd-4257-9cc6-f4e4b2135004	153b06f9-02e7-4271-b828-f5108f85c2f9	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	user	динамика добываемого газа в сша	\N	\N	2025-10-28 12:31:06.557204+00
ca96d9b3-f1c8-4c7b-8237-5c9f9ead9d57	153b06f9-02e7-4271-b828-f5108f85c2f9	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	assistant	### Динамика добычи природного газа в США\n\nСША являются крупнейшим производителем природного газа в мире, и их добыча демонстрирует значительный рост в последние десятилетия, в основном благодаря технологическому прорыву в гидроразрыве пласта (fracking) и горизонтальному бурению. Я опишу ключевые тенденции на основе данных U.S. Energy Information Administration (EIA), которая является основным источником статистики по энергетике США. Данные обновляются регулярно, так что для самых свежих цифр рекомендую проверить сайт EIA.\n\n#### Историческая динамика\n- **До 2000-х годов**: Добыча была относительно стабильной, но с тенденцией к снижению. В 1990-х она составляла около 17–19 трлн кубических футов (Tcf) в год. Основные месторождения — в Техасе, Оклахоме и на шельфе Мексиканского залива. Зависимость от импорта росла, что создавало уязвимости.\n  \n- **Сланцевая революция (2008–2015)**: Это период взрывного роста. Благодаря технологиям добычи сланцевого газа (например, в формациях Марселлус, Пермиан и Баккен) производство удвоилось. \n  - 2005: ~18 Tcf/год.\n  - 2010: ~21 Tcf/год.\n  - 2015: ~28 Tcf/год.\n  США стали нетто-экспортером газа, обогнав Россию и Иран по объёмам добычи.\n\n- **Пик роста (2016–2020)**: Добыча продолжала увеличиваться, несмотря на колебания цен. В 2019 году достигнуто 33 Tcf/год. Пандемия COVID-19 в 2020 слегка замедлила рост (32,4 Tcf), из-за снижения спроса.\n\n- **Недавние годы (2021–2023)**: Восстановление и новые рекорды.\n  - 2021: 34,5 Tcf/год.\n  - 2022: 36,4 Tcf/год (рост на 5%).\n  - 2023: Около 37,2 Tcf/год (или ~103 млрд куб. футов в день, Bcf/d). Производство выросло на 3–4% по сравнению с 2022-м, в основном за счёт бассейна Пермиан (Техас и Нью-Мексико), где приходится ~50% всей добычи.\n  \n  В 2024 году EIA прогнозирует дальнейший рост до 105 Bcf/d (рост на 2%), но с рисками из-за волатильности цен и регуляторных ограничений на экспорт СПГ.\n\n#### Ключевые факторы динамики\n- **Позитивные**: \n  - Технологии: Fracking позволил доступ к огромным запасам (оценочно 2,5 трлн Tcf технически извлекаемых).\n  - Спрос: Внутренний (электроэнергетика, отопление) и экспорт СПГ (США стали топ-экспортёром в 2023, ~12 Bcf/d).\n  - Регионы: Техас (лидер), Пенсильвания (Марселлус), Оклахома, Луизиана.\n\n- **Негативные/риски**:\n  - Цены: Низкие цены в 2012 и 2020 замедляли инвестиции.\n  - Экология: Давление от "зелёной" политики (Biden administration ограничивает новые лицензии на федеральных землях). Переход к ВИЭ (солнечная, ветровая) может снизить спрос к 2030-м.\n  - Геополитика: Санкции на Россию увеличили роль США как поставщика в Европу.\n  - Инфраструктура: Бутылочные горлышки в трубопроводах и терминалах СПГ.\n\n#### График тенденций (упрощённо, в Tcf/год)\n- 2000: 19,3\n- 2005: 18,1\n- 2010: 21,0\n- 2015: 27,1\n- 2020: 32,4\n- 2023: 37,2 (прогноз)\n\n#### Прогноз на будущее\nEIA ожидает, что к 2050 году добыча стабилизируется на уровне 35–40 Tcf/год, с пиком в середине 2020-х, после чего возможен спад из-за декарбонизации. Однако газ останется ключевым "переходным" топливом.\n\nЕсли вам нужны более детальные данные (по штатам, ценам или сравнение с другими странами), графики или источники, уточните! Основные ресурсы: [EIA Natural Gas](https://www.eia.gov/naturalgas/) или их отчёты вроде Annual Energy Outlook.	\N	\N	2025-10-28 12:31:16.888283+00
4d96a86e-4513-46f6-aa38-e76b651ba57a	7cc5a4dd-9c87-4f60-af17-522a59c05c66	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	user	динамика добываемого газа в сша	\N	\N	2025-10-28 12:32:39.90579+00
f1e8f529-3461-4ee0-8d0b-a9e08e3a6fd3	7cc5a4dd-9c87-4f60-af17-522a59c05c66	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	assistant	## Динамика добычи газа в США: Обзор и ключевые моменты\n\nСоединенные Штаты Америки стали одним из крупнейших производителей природного газа в мире, значительно изменив глобальный энергетический ландшафт. Динамика добычи газа в США не просто впечатляет, но и имеет глубокие экономические, геополитические и экологические последствия.\n\n**Основные тенденции и история:**\n\n*   **"Сланцевая революция" - переломный момент:** До начала 2000-х годов добыча газа в США находилась на относительно стабильном уровне или даже демонстрировала некоторое снижение. Однако все изменилось с развитием и широким применением технологий горизонтального бурения и гидравлического разрыва пласта (фрекинга). Эти технологии позволили эффективно извлекать газ и нефть из плотных сланцевых пород, которые ранее считались нерентабельными для разработки.\n*   **Стремительный рост с 2005 года:** С середины 2000-х годов добыча природного газа в США начала экспоненциально расти. Ежегодные темпы роста часто исчислялись двузначными числами.\n*   **Лидерство в мире:** К концу 2010-х годов США прочно закрепили за собой статус крупнейшего мирового производителя природного газа, обогнав Россию и другие традиционные газодобывающие страны.\n*   **"Газовое изобилие":** Сланцевый газ привел к значительному увеличению внутренних запасов газа, снижению цен на газ на внутреннем рынке и уменьшению зависимости от импорта энергоресурсов.\n*   **Рост экспорта СПГ:** Избыток газа внутри страны создал предпосылки для развития индустрии сжиженного природного газа (СПГ). США быстро нарастили мощность терминалов для сжижения газа и стали одним из ведущих мировых экспортеров СПГ, что позволило им влиять на мировые цены и обеспечивать энергетическую безопасность партнеров.\n\n**Ключевые факторы, влияющие на динамику:**\n\n1.  **Технологический прогресс:** Усовершенствование технологий бурения и фрекинга, снижение их стоимости и повышение эффективности.\n2.  **Экономическая эффективность:** Относительно низкая себестоимость добычи сланцевого газа в сравнении с другими источниками или импортом.\n3.  **Рыночные цены:** Колебания цен на природный газ (как на внутреннем, так и на мировом рынках) напрямую влияют на инвестиции в разработку новых месторождений и объемы добычи. Высокие цены стимулируют добычу, низкие - могут вызвать сокращение.\n4.  **Регуляторная политика:** Государственная политика, касающаяся разрешений на бурение, экологических стандартов и налогообложения, влияет на инвестиционный климат.\n5.  **Инфраструктура:** Развитие трубопроводной сети, компрессорных станций и терминалов СПГ играет критическую роль в транспортировке и экспорте добытого газа.\n6.  **Геополитические факторы:** События, влияющие на мировые энергетические рынки (например, конфликты, санкции), могут увеличивать спрос на американский газ.\n\n**Текущее состояние и перспективы:**\n\n*   **Высокие объемы добычи сохраняются:** Несмотря на временные спады, вызванные низкими ценами (например, в период пандемии COVID-19 или в начале 2020-х из-за ценовых колебаний), США продолжают добывать огромные объемы газа.\n*   **Значительный экспорт СПГ:** США по-прежнему остаются ведущим экспортером СПГ, и ожидается дальнейшее расширение экспортных мощностей.\n*   **Сложности и вызовы:**\n    *   **Экологические опасения:** Дебаты вокруг воздействия фрекинга на окружающую среду (загрязнение воды, выбросы метана) продолжаются.\n    *   **Истощение "легких" сланцевых пластов:** Возможное истощение наиболее продуктивных и легкодоступных участков сланцевых месторождений может привести к увеличению себестоимости добычи.\n    *   **Волатильность цен:** Непредсказуемость мировых цен на газ остается серьезным вызовом для производителей.\n    *   **Политическое давление:** Растущее давление со стороны экологических активистов и некоторых политических кругов, направленное на сокращение использования ископаемого топлива, может повлиять на долгосрочные перспективы добычи газа.\n\n**В заключение:**\n\nДинамика добычи газа в США является ярким примером трансформации энергетического сектора благодаря технологическим инновациям. От страны, сталкивающейся с потенциальным дефицитом газа, США превратились в мирового лидера в производстве и экспорте. Эта динамика оказала и продолжает оказывать значительное влияние на мировые энергетические рынки, геополитику и усилия по борьбе с изменением климата. Будущее этой динамики будет зависеть от сочетания технологического развития, рыночных сил, регуляторной политики и глобальных энергетических тенденций.	\N	\N	2025-10-28 12:32:47.24838+00
c4ce5ccc-5784-4a4c-85b6-0efc00ac84b9	47a900ad-270e-44f4-a50d-0d1ffc20c65f	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	user	самые простые модели rag для анализа документации, находящейся в облаке, с учетом свобственного портала с чатом для ai моделей с развитой админкой и статистикой	\N	\N	2025-10-28 12:40:43.060985+00
a1b9ed40-42ef-4331-a44e-c2a75e9f5d49	47a900ad-270e-44f4-a50d-0d1ffc20c65f	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	assistant	### Простые модели и реализации RAG для анализа облачной документации\n\nПривет! Ваш запрос касается простых подходов к Retrieval-Augmented Generation (RAG) для анализа документации, хранящейся в облаке (например, Google Drive, AWS S3 или Azure Blob). Я учту, что вы хотите интегрировать это с собственным порталом, включающим чат для AI-моделей, развитую админ-панель (для управления пользователями, контентом и настройками) и статистику (логи использования, метрики производительности). \n\nRAG — это комбинация поиска (retrieval) релевантных фрагментов из документов и генерации (generation) ответов на их основе с помощью LLM (Large Language Model). Для простоты я сосредоточусь на open-source инструментах, минимальном стеке и облачных опциях, чтобы избежать сложности. Начнём с базовых шагов, а потом перейдём к интеграции с порталом.\n\n#### 1. **Базовая архитектура простой RAG-системы**\nСамый простой способ — использовать фреймворк **LangChain** (Python), который упрощает RAG. Он поддерживает embeddings (векторизацию текста), векторные хранилища и LLM. Вот ключевые компоненты:\n\n- **Embeddings (векторизация документов)**: \n  - Простая модель: `sentence-transformers/all-MiniLM-L6-v2` из Hugging Face. Это лёгкая (80 MB), быстрая модель, которая превращает текст в векторы для поиска. Не требует GPU.\n  - Почему простая? Работает локально или в облаке, точность ~85% для общих текстов (документация, инструкции).\n\n- **Векторное хранилище (для поиска)**:\n  - Локально/просто: **FAISS** (Facebook AI Similarity Search) — бесплатное, быстрое, хранит векторы в памяти или файле. Идеально для прототипа.\n  - Облачно: **Pinecone** или **Chroma** (бесплатный tier). Pinecone — managed сервис, интегрируется с AWS/GCP, масштабируется автоматически. Загружайте документы из облака, и оно индексирует их.\n\n- **LLM для генерации**:\n  - Простая: **OpenAI GPT-3.5-turbo** (API, дешево ~$0.002/1k токенов) или open-source **Llama-2-7B** из Hugging Face (бесплатно, но требует ~8 GB RAM/GPU).\n  - RAG-логика: Извлекаем топ-3-5 фрагментов из векторного хранилища, подаём их в промпт LLM как контекст.\n\n**Шаги реализации (код на Python, ~100 строк)**:\n1. Установите: `pip install langchain sentence-transformers faiss-cpu openai` (или pinecone-client для облака).\n2. Загрузка документов из облака:\n   - Для Google Drive: Используйте `google-api-python-client` + OAuth.\n   - Для AWS S3: `boto3` для скачивания файлов (PDF, DOCX, TXT).\n   - Парсинг: LangChain имеет loaders для PDF (`PyPDFLoader`), TXT и т.д.\n3. Индексация:\n   ```python\n   from langchain.embeddings import HuggingFaceEmbeddings\n   from langchain.vectorstores import FAISS\n   from langchain.document_loaders import PyPDFLoader  # Пример для PDF\n\n   # Загрузка и разбиение на чанки (по 500-1000 символов)\n   loader = PyPDFLoader("path/to/cloud_downloaded.pdf")\n   docs = loader.load_and_split()\n\n   # Embeddings\n   embeddings = HuggingFaceEmbeddings(model_name="sentence-transformers/all-MiniLM-L6-v2")\n\n   # Создание векторного хранилища\n   vectorstore = FAISS.from_documents(docs, embeddings)\n   vectorstore.save_local("faiss_index")  # Сохранить локально или в облаке\n   ```\n4. Поиск и генерация:\n   ```python\n   from langchain.llms import OpenAI\n   from langchain.chains import RetrievalQA\n\n   llm = OpenAI(temperature=0.1)  # Или HuggingFaceHub для open-source\n   qa_chain = RetrievalQA.from_chain_type(llm, retriever=vectorstore.as_retriever(search_kwargs={"k": 3}))\n   \n   response = qa_chain.run("Что такое API в этой документации?")  # Пример запроса\n   print(response)\n   ```\n   - Это анализирует документацию: ищет релевантные части и генерирует ответ на основе них.\n\n**Облачная адаптация**:\n- Храните индекс в S3 или Google Cloud Storage.\n- Для обновлений: Периодически сканируйте облако (cron-job) и переиндексируйте.\n- Масштаб: Если документов много (>10k), перейдите на Pinecone — оно обрабатывает миллионы векторов без сервера.\n\n**Плюсы простоты**: Время на запуск — 1-2 дня. Точность — 80-90% для тематической документации (IT, юридическая). Минусы: Для очень больших документов нужны чанки (chunking).\n\n#### 2. **Интеграция с собственным порталом (чат, админка, статистика)**\nВы упомянули портал с чатом для AI-моделей. Для простоты используйте **Streamlit** или **Gradio** — они позволяют быстро создать веб-интерфейс с чатом. Для развитой админки и статистики добавьте backend на **FastAPI** или **Django**.\n\n- **Чат для AI**:\n  - **Streamlit** (самый простой, Python-only): Создаёт чат за 20 строк кода.\n    ```python\n    import streamlit as st\n    from langchain.chains import RetrievalQA  # Ваш RAG из шага 1\n\n    st.title("RAG-Чат для документации")\n    if "messages" not in st.session_state:\n        st.session_state.messages = []\n\n    for message in st.session_state.messages:\n        with st.chat_message(message["role"]):\n            st.markdown(message["content"])\n\n    if prompt := st.chat_input("Задайте вопрос о документации"):\n        st.session_state.messages.append({"role": "user", "content": prompt})\n        with st.chat_message("user"):\n            st.markdown(prompt)\n        \n        with st.chat_message("assistant"):\n            response = qa_chain.run(prompt)  # RAG-запрос\n            st.markdown(response)\n            st.session_state.messages.append({"role": "assistant", "content": response})\n    ```\n    - Разверните на Heroku или Vercel (бесплатно). Интегрируйте аутентификацию (Streamlit-Authenticator).\n    - Поддержка AI-моделей: Легко переключать между GPT, Llama и т.д. через LangChain.\n\n- **Развитая админ-панель**:\n  - **Django** (Python): Встроенная админка (admin.py) для управления пользователями, документами, индексами RAG. Добавьте кастомные views для загрузки файлов в облако.\n    - Пример: Модели для Document (с полями: file_path, cloud_url, status).\n    - Интеграция: Celery для фоновой индексации документов из облака.\n  - Альтернатива: **FastAPI** с **SQLAlchemy** + **AdminLTE** шаблоном. Админка для CRUD операций над векторным индексом (добавление/удаление документов).\n  - Функции: Управление доступом (роли: admin/user), мониторинг чатов, ручное обновление RAG.\n\n- **Статистика**:\n  - Простой вариант: **Streamlit Metrics** или **Plotly** для дашборда (кол-во запросов, топ-темы, время ответа).\n  - Продвинутый: **Prometheus + Grafana** (интегрируйте с FastAPI/Django). Логируйте метрики в RAG (e.g., LangChain callbacks для времени поиска/генерации).\n    - Пример метрик: \n      - Кол-во чат-сессий/день.\n      - Точность RAG (с фидбеком пользователей: thumbs up/down).\n      - Использование облака (объём скачанных файлов).\n  - Хранение: PostgreSQL (с TimescaleDB для time-series) или MongoDB для логов чатов.\n\n**Полный стек для портала**:\n- Backend: FastAPI + LangChain (RAG) + Celery (задачи).\n- Frontend: Streamlit/Gradio для чата + React для админки (если нужно кастом).\n- Облако: AWS/GCP для хостинга (EC2/ECS), S3 для документов.\n- Безопасность: API-ключи для LLM, HTTPS, rate-limiting для чата.\n\n**Время на реализацию**: Прототип портала — 3-5 дней. Полная версия с админкой — 1-2 недели.\n\n#### 3. **Рекомендации и улучшения**\n- **Альтернативы LangChain**: Если хотите ещё проще — **Haystack** (от deepset) или **LlamaIndex**. Они тоже RAG-focused, но LangChain универсальнее.\n- **Тестирование**: Начните с 10-20 документов. Используйте RAGAS (метрика оценки RAG) для проверки качества.\n- **Стоимость**: Бесплатно для open-source. Облако: Pinecone ~$50/мес для малого трафика, OpenAI — по использованию.\n- **Ограничения**: Для конфиденциальной документации — self-hosted LLM (Ollama). Если портал публичный, соблюдайте GDPR (анонимизация логов).\n- **Ресурсы**: Доки LangChain (langchain.com), туториал по RAG на YouTube ("LangChain RAG Tutorial").\n\nЕсли нужно углубить (код, схемы, конкретное облако) или уточнить (например, тип документов), дайте знать! 😊	\N	\N	2025-10-28 12:41:00.453519+00
42ae33ba-afdd-4771-a9f6-354acd211380	968ae644-b82a-4e62-af4f-9da78340ce3d	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	user	самые простые модели rag для анализа документации, находящейся в облаке, с учетом свобственного портала с чатом для ai моделей с развитой админкой и статистикой	\N	\N	2025-10-28 12:42:16.535358+00
6425552d-65ac-4b22-a6dd-ec5e094dc52d	968ae644-b82a-4e62-af4f-9da78340ce3d	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	assistant	Самые простые модели RAG (Retrieval Augmented Generation) для анализа документации в облаке, которые можно интегрировать с собственным порталом с чатом, развитой админкой и статистикой, обычно опираются на:\n\n1. **Векторизацию документации**: Превращение текста документов в числовые векторы (эмбеддинги) с помощью моделей типа Word2Vec, GloVe, или более современных, таких как Sentence-BERT (SBERT) или OpenAI Embeddings.\n2. **Векторную базу данных**: Хранение этих векторов и быстрое извлечение наиболее релевантных по запросу. Популярные варианты: Pinecone, Weaviate, Chroma, Qdrant, или даже просто Postgres с расширением `pgvector`.\n3. **Генеративную языковую модель (LLM)**: Для ответа на вопросы пользователя, используя извлеченные фрагменты документации как контекст. Это могут быть модели от OpenAI (GPT-3.5, GPT-4), Anthropic (Claude), Google (PaLM 2), или открытые модели (Llama-2, Mistral).\n\nВот несколько простых архитектур и подходов:\n\n---\n\n### **1. Базовая RAG (Векторный поиск + LLM API)**\n\n**Как это работает:**\n*   **Индексация данных:**\n    *   Документы из облака (S3, GCS, Azure Blob Storage и т.д.) скачиваются или напрямую читаются.\n    *   Документы разбиваются на более мелкие "чанки" (фрагменты) текста.\n    *   Каждый чанк векторизуется с помощью эмбеддинг-модели.\n    *   Векторы и соответствующие им чанки текста сохраняются в векторной базе данных.\n*   **Пользовательский запрос (через чат):**\n    *   Запрос пользователя также векторизуется.\n    *   Вектор запроса используется для поиска наиболее похожих векторов (и, соответственно, чанков текста) в векторной базе данных.\n    *   Эти релевантные чанки отправляются LLM как контекст вместе с оригинальным запросом пользователя.\n    *   LLM генерирует ответ на основе контекста и запроса.\n\n**Преимущества:**\n*   **Простота реализации:** С готовыми библиотеками типа `LangChain` или `LlamaIndex` можно быстро поднять прототип.\n*   **Гибкость:** Можно легко менять эмбеддинг-модели и LLM.\n*   **Хорошая база:** Отличный старт для дальнейшей доработки.\n\n**Минусы:**\n*   **Качество разбиения на чанки:** От этого сильно зависит качество поиска.\n*   **Hallucinations LLM:** LLM может иногда "придумывать" ответы, даже с контекстом.\n*   **Стоимость LLM API:** Зависит от количества запросов.\n\n**Технологии для реализации:**\n*   **Облачное хранилище:** Amazon S3, Google Cloud Storage, Azure Blob Storage.\n*   **Парсинг документов:** `Unstructured.io`, `Apache Tika`, `PyPDF2`, `python-docx` для разных форматов.\n*   **Разбиение на чанки и векторизация:** `LangChain` или `LlamaIndex` с использованием эмбеддинг-моделей (OpenAI Embeddings, Google's `text-embedding-gecko`, `HuggingFaceEmbeddings` с `Sentence-BERT`).\n*   **Векторная база данных:** Pinecone (управляемый сервис), Chroma (легко поднять локально или в докере), Weaviate (управляемый сервис/самостоятельный хостинг), `pgvector` для Postgres.\n*   **LLM:** OpenAI GPT-3.5/GPT-4 API, Anthropic Claude, Google PaLM/Gemini API, или самохостинговые/Hugging Face модели.\n*   **Фреймворки:** `LangChain`, `LlamaIndex` значительно упрощают сборку RAG-пайплайна.\n\n---\n\n### **2. RAG с улучшенным извлечением (с учетом метаданных и фильтрации)**\n\nЭта модель является усовершенствованием базовой RAG.\n\n**Как это работает:**\n*   **Индексация данных:** Дополнительно к векторизации, при индексации в векторную БД сохраняются **метаданные** о каждом чанке (например, название документа, автор, дата, теги, тип документа, раздел).\n*   **Пользовательский запрос:**\n    *   Система пытается извлечь из запроса пользователя не только семантический смысл, но и намерения, связанные с метаданными. Например: "Найди документы по безопасности, опубликованные после 2023 года".\n    *   При поиске в векторной базе данных добавляются **фильтры по метаданным**, которые сужают круг поиска еще до сравнения векторов.\n    *   Дальнейшие шаги аналогичны базовой RAG.\n\n**Преимущества:**\n*   **Повышенная точность извлечения:** Особенно для больших объемов документации, где обычный семантический поиск может быть слишком широким.\n*   **Контролируемость:** Админ может добавлять и управлять метаданными, улучшая качество поиска.\n\n**Минусы:**\n*   **Сложность индексации:** Требует более продуманной схемы метаданных.\n*   **Обработка запросов:** Нужен более умный парсер запросов, возможно, с LLM-помощью для извлечения фильтров.\n\n**Технологии для реализации:**\n*   **Векторные базы данных с поддержкой метаданных:** Pinecone, Weaviate, Chroma, Qdrant, Solr/Elasticsearch с гибридным поиском.\n*   **Frameworks:** `LangChain` и `LlamaIndex` имеют встроенную поддержку извлечения фильтров из запросов и их применения.\n\n---\n\n### **3. RAG с гибридным поиском (Keyword + Semantic)**\n\nСочетает традиционный поиск по ключевым словам с семантическим поиском.\n\n**Как это работает:**\n*   **Индексация:** Документы индексируются как в векторную базу данных (для семантики), так и в традиционный поисковый движок (для ключевых слов) типа Elasticsearch, Apache Solr, или OpenSearch.\n*   **Пользовательский запрос:**\n    *   Запрос одновременно отправляется в векторную БД (для семантического поиска) и в поисковый движок (для поиска по ключевым словам).\n    *   Результаты из обоих источников комбинируются (например, путем ранжирования или переранжирования). Это может быть простая сумма релевантности или более сложные алгоритмы (например, RRF - Reciprocal Rank Fusion).\n    *   Объединенные релевантные чанки отправляются LLM.\n\n**Преимущества:**\n*   **Лучшая надежность:** Исправляет слабые стороны чисто семантического или чисто ключевого поиска. Например, термины, которые не имеют синонимов, лучше находятся по ключевым словам.\n*   **Хорошо для точных запросов:** Отлично подходит, когда пользователь знает точные названия или термины.\n\n**Минусы:**\n*   **Увеличение сложности архитектуры:** Требует поддержания двух индексаторов.\n*   **Проблема слияния результатов:** Настройка весов и алгоритмов слияния может быть нетривиальной.\n\n**Технологии для реализации:**\n*   **Поисковый движок:** Elasticsearch, Apache Solr, OpenSearch.\n*   **"Адаптеры" для гибридного поиска:** `LangChain` и `LlamaIndex` имеют интеграции для этого.\n\n---\n\n### **Архитектура Портала с Чатом, Админкой и Статистикой**\n\n**1. Фронтенд (React, Vue, Angular):**\n*   Интерфейс чата.\n*   Панель администратора для управления документацией, LLM-моделями, пользователями, просмотра статистики.\n\n**2. Бэкенд API (Python/FastAPI, Node.js/Express, Go/Gin):**\n*   **API для чата:** Принимает запросы пользователя, вызывает RAG-пайплайн, возвращает ответы.\n*   **API для админки:**\n    *   Загрузка/удаление документов.\n    *   Управление источниками данных (облачные хранилища).\n    *   Настройка LLM-моделей (ключи API, параметры).\n    *   Управление пользователями и правами доступа.\n    *   Просмотр метрик и статистики.\n*   **RAG-сервис:** Отдельный модуль/микросервис, реализующий логику RAG (индексация, поиск, генерация).\n\n**3. База данных (PostgreSQL, MongoDB):**\n*   Хранение информации о пользователях, документах, конфигурации, логах запросов/ответов, статистике.\n\n**4. Облачная инфраструктура:**\n*   **Вычисления (VMs/Serverless):** AWS EC2/Lambda, Google Cloud Run/Compute Engine, Azure Container Instances/App Service.\n*   **Облачное хранилище:** AWS S3, Google Cloud Storage, Azure Blob Storage (для исходных документов).\n*   **Векторная база данных:** Pinecone, Weaviate (как PaaS) или самохостинговая Chroma, Qdrant.\n*   **Система очередей (для асинхронных задач):** AWS SQS, Google Cloud Pub/Sub, RabbitMQ (для индексации новых документов).\n*   **Мониторинг и логирование:** Prometheus/Grafana, ELK Stack, облачные сервисы (CloudWatch, Stackdriver).\n\n**5. Админка и Статистика:**\n*   **Админка:** Позволяет администраторам:\n    *   **Добавлять/управлять документами:** Загрузка, удаление, просмотр статуса индексации, назначение метаданных.\n    *   **Настраивать LLM:** Выбор модели, температура, максимальная длина ответа.\n    *   **Управлять пользователями и правами.**\n    *   **Мониторинг:** Статус RAG-компонентов, доступность LLM-сервисов.\n*   **Статистика:**\n    *   **Использование:** Количество запросов, уникальных пользователей, загрузка системы.\n    *   **Производительность:** Время ответа RAG, LLM-модели.\n    *   **Качество:** Оценка ответов (например, "понравился/не понравился" от пользователя), количество "hallucinations", частота использования определенных документов.\n    *   **Затраты:** Отслеживание расходов на LLM API и облачные ресурсы.\n\n---\n\n### **Рекомендации для начала:**\n\n1.  **Начните с LangChain/LlamaIndex:** Эти фреймворки значительно сокращают время разработки RAG-пайплайна.\n2.  **Выбор LLM:** Для начала, API OpenAI (GPT-3.5) — это золотой стандарт по соотношению цена/качество/доступность.\n3.  **Выбор эмбеддинг-модели:** OpenAI `text-embedding-ada-002` (или более новые, если доступны) очень хорош. Для открытых моделей, `Sentence-BERT` семейства `all-MiniLM-L6-v2` или `e5-large-v2`.\n4.  **Векторная база данных:** Для прототипа и небольших объемов: `Chroma` (локально или в докере) или `pgvector` в Postgres. Для масштабирования: `Pinecone`, `Weaviate`, `Qdrant` (управляемые сервисы).\n5.  **Разбиение на чанки:** Экспериментируйте с размером чанков и перекрытием. Часто 200-500 токенов с перекрытием 50-100 токенов дают хорошие результаты.\n\nПомните, что качество RAG-системы сильно зависит от качества ваших данных, их обработки (парсинг, очистка, разбиение на чанки) и выбора релевантных моделей.	\N	\N	2025-10-28 12:42:37.757353+00
4c3aac92-f349-4a0e-8b1a-a2a5778dd73f	b069a442-77a9-4f39-a25c-b56ceab770ac	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	user	самые простые модели rag для анализа документации, находящейся в облаке, с учетом свобственного портала с чатом для ai моделей с развитой админкой и статистикой	\N	\N	2025-10-28 12:43:23.151442+00
283de1d3-64ec-4693-9f54-5d04c9365bcf	b069a442-77a9-4f39-a25c-b56ceab770ac	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	assistant	Коротко и по делу — набор простых, надёжных RAG‑вариантов и практических советов для быстрого запуска портала с чатом, админкой и статистикой для анализа облачной документации.\n\n1) Базовая архитектура RAG (минимум компонентов)\n- Источник: файлы в облаке (S3, GCS, SharePoint, Confluence, PDF/HTML).\n- Препроцессинг: разбиение на чанки (300–800 токенов) с overlap 50–200 токенов, извлечение метаданных (путь, тип документа, дата, владелец).\n- Эмбеддинги: модель эмбеддингов (managed или self‑hosted).\n- Векторное хранилище (retriever): FAISS/Chroma/Milvus/Weaviate/Pinecone.\n- Ранжирование/фильтрация: по метаданным (проект/доступ), BM25/keyword fallback.\n- Генерация: LLM (на месте или API) + prompt template, конкатенация top‑k релевантных чанков.\n- UI чат: фронт с потоковой выдачей, хранением контекста.\n- Админка/статистика: логирование запросов, метрик, управление индексом и доступами.\n\n2) Самые простые (быстро запустить) стеки\n\nA. Самый быстрый MVP (managed)\n- Эмбеддинги: OpenAI embeddings (text-embedding-3-small).\n- Векторная БД: Pinecone или Weaviate Cloud.\n- LLM: OpenAI GPT‑4/GPT‑3.5 (Retrieval through prompt).\n- Обвязка: LangChain или LlamaIndex (быстрое прототипирование).\n- Плюсы: минимум инфраструктуры, быстрое развертывание.\n- Минусы: стоимость, данные в облаке третьей стороны.\n\nB. Simple self‑hosted (минимальные зависимые компоненты)\n- Эмбеддинги: sentence-transformers (all-MiniLM-L6-v2) или Cohere/hf модели.\n- Векторная БД: Chroma (локально) или Milvus (k8s).\n- LLM: локальный Llama 2‑chat (7B/13B) через Hugging Face/autoGPTQ/ggml.\n- Обвязка: Haystack / LangChain + кастомный UI.\n- Плюсы: контроль над данными, дешевле на больших объёмах.\n- Минусы: нужно поддерживать infra и inference.\n\nC. Гибрид (managed vector + локальный LLM)\n- Pinecone/Weaviate для поиска + локальный Llama 2 для генерации.\n- Хороший компромисс: быстрый поиск + приватная генерация.\n\n3) Практические детали индексации и retrieval\n- Chunking: 500 токенов ± overlap 50–150 — проверять качество ответов.\n- Top‑k для генерации: 3–8 (экспериментировать).\n- Метаданные: хранить источник, offset, hash, access_level — для ссылок и атрибуции.\n- Обновления: инкрементальные upsert'ы, versioning документов.\n- Фильтрация: прежде чем отдавать чанки LLM, фильтровать по правам доступа и релевантности (score threshold).\n\n4) Безопасность и управление доступом (важно для портала)\n- Аутентификация: OIDC/SAML, SSO.\n- Ролевой доступ (RBAC): кто видит какие источники/логи/инструменты админа.\n- Шифрование: TLS + шифрование at‑rest (S3/KMS).\n- Маскировка и DLP: обнаружение PII, правила ретенции, redaction.\n- Защита от prompt injection: очистка/белый список, не доверять внешним метаданным.\n\n5) Админка и статистика (ключевые фичи)\n- Управление индексом: реиндекс, view index stats, удалить/обновить документы.\n- Мониторинг: запросы/мин, latency, средний score, процент повторов, ошибки.\n- Биллинг/usage: токены/запросы/стоимость по проектам.\n- Качество: feedback loop (лайк/дислайк) + ретроспективная оценка ответов, метрики точности/ответов с источниками.\n- Поисковые метрики: recall/precision (на тест наборе запросов).\n- Логи и трассировка: user query -> retrieved chunks -> prompt -> model response.\n- Панели: Grafana/Prometheus + ELK/Splunk для логов; Metabase/Superset для бизнес‑метрик.\n\n6) Инструменты/фреймворки, которые ускоряют разработку\n- LangChain, LlamaIndex (GPT‑Index) — для orchestration RAG.\n- Haystack — больше enterprise, поддержка многих бэкендов.\n- Milvus, Chroma, Weaviate, Pinecone — выбор векторного слоя.\n- SentenceTransformers, OpenAI embeddings, Cohere — эмбеддинги.\n- Streamlit/React/Next.js + WebSocket для чата.\n- Observability: Prometheus + Grafana, Sentry.\n\n7) Примеры на Python (очень простой пример концепта)\n- Псевдокод:\n  1) загрузить документы, разбить на чанки;\n  2) получить эмбеддинги (sentence-transformers/OpenAI) и upsert в Pinecone/Chroma;\n  3) на запрос: получить embedding запроса -> nearest neighbors -> передать top_k чанков в prompt -> LLM.generate -> вернуть ответ + источники.\n\n8) Рекомендация для MVP (порядок действий)\n- 1 неделя: собрать pipeline импорта документов + chunking.\n- 2 неделя: настроить embeddings + простой векторный поиск (Pinecone или Chroma).\n- 3 неделя: собрать простую чат‑страницу, интегрировать RetrievalQA (LangChain).\n- 4 неделя: базовая админка (reindex, просмотры запросов) + метрики (Prometheus/Grafana).\n- Параллельно: продумать auth и политику безопасности.\n\n9) Дополнительные фичи, которые стоит заложить сразу\n- Источники в ответе (citation) и ссылка на исходный документ/параграф.\n- Кнопка «показать источники/оригинал».\n- Сохранение сессий и экспорт чатов.\n- Feedback loop (пользователь помечает полезность), чтобы потом улучшать retrieval или fine‑tune.\n\nЕсли нужно — могу:\n- предложить конкретный стек под ваш бюджет/требования (полностью managed vs self‑hosted);\n- написать минимальный скрипт на Python для импорта документов и индексации в выбранную векторную БД;\n- нарисовать простую структуру админки и метрик.\n\nСкажите, какой облачный провайдер/векторную БД и LLM вы предпочитаете, и я подготовлю конкретный пример развертывания для вашего случая.	\N	\N	2025-10-28 12:44:10.503584+00
a2e86f72-380c-4437-812c-107bc8b717ad	7dd7535a-dc9b-4b4b-9c1f-a6dcc1eab666	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	user	формулы воды	\N	\N	2025-10-28 12:45:00.525225+00
21f4a56c-2ef2-49f4-adc6-d15cd0f1f58d	7dd7535a-dc9b-4b4b-9c1f-a6dcc1eab666	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	assistant	### Химическая формула воды\n\nВода (H₂O) — это простейшее соединение, состоящее из двух атомов водорода (H) и одного атома кислорода (O), связанных ковалентными связями.\n\n#### Основные характеристики:\n- **Молекулярная формула**: H₂O (емпирическая формула такая же, поскольку это простая молекула).\n- **Структурная формула**:  \n  ```\n     H\n     |\n  H-O\n  ```\n  (Молекула воды имеет угловую форму с углом между связями около 104,5° из-за lone pairs на кислороде.)\n- **Молярная масса**: 18,015 г/моль (2 × 1,008 + 15,999).\n- **Физические свойства**: Жидкость при комнатной температуре, температура кипения 100°C, замерзания 0°C.\n\nЕсли вы имеете в виду что-то другое (например, формулы для расчёта плотности воды, уравнения реакций или что-то из физики/математики), уточните! 😊	\N	\N	2025-10-28 12:45:07.881765+00
b0c28929-0a52-4749-98cb-5daae57e10e9	66120a41-f14c-4a55-b871-a16ebcf3db2e	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	user	состав воздуха	\N	\N	2025-10-28 12:46:35.925331+00
3ed0f38a-24ae-498d-93e1-071873891b1e	66120a41-f14c-4a55-b871-a16ebcf3db2e	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	assistant	### Состав воздуха\n\nВоздух на Земле — это смесь газов, которая составляет атмосферу. Его состав (в объёмных процентах на уровне моря в сухом воздухе) примерно следующий:\n\n- **Азот (N₂)**: 78,08% — основной газ, инертный, важен для жизни (компонент белков).\n- **Кислород (O₂)**: 20,95% — необходим для дыхания и окислительных процессов.\n- **Аргон (Ar)**: 0,93% — инертный газ, не участвует в химических реакциях.\n- **Углекислый газ (CO₂)**: 0,0407% (около 0,04%) — растёт из-за антропогенной активности, влияет на климат.\n- **Неон (Ne)**: 0,0018% — редкий газ.\n- **Метан (CH₄)**: 0,00018% — парниковый газ.\n- **Криптон (Kr)**: 0,00011% — инертный.\n- **Водород (H₂)**: 0,00005% — очень мало.\n- **Другие газы** (ксенон, озон, оксид азота и т.д.): менее 0,001%.\n\nКроме газов, воздух содержит:\n- **Водяной пар (H₂O)**: переменная величина, от 0 до 4% в зависимости от влажности.\n- **Аэрозоли и примеси**: пыль, сажа, соли — зависят от места и загрязнения.\n\nСостав может немного варьироваться в зависимости от высоты, местности и загрязнения. Например, в городах больше CO₂ и вредных веществ. Если нужны детали или расчёты, уточните!	\N	\N	2025-10-28 12:46:45.144082+00
4ba1980f-234c-40fb-a7f5-17fce989cde3	72ced4b4-cb9a-4abb-a4f8-10d25c73a1b8	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	user	состав воды	\N	\N	2025-10-28 12:53:11.901109+00
88e3f733-a520-485f-9025-daa09ec9c3e0	72ced4b4-cb9a-4abb-a4f8-10d25c73a1b8	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	assistant	### Состав воды\n\nВода (H₂O) — это химическое соединение, состоящее из:\n\n- **Двух атомов водорода (H)** и **одного атома кислорода (O)**.\n- Атомы соединены ковалентными связями, образуя полярную молекулу.\n\n#### Основные свойства:\n- **Молекулярная масса**: Около 18 а.е.м. (2 × 1 + 16 = 18).\n- В чистой воде нет других элементов; примеси (например, минералы в водопроводной воде) добавляются извне.\n- Вода — универсальный растворитель, и её состав делает её ключевым для жизни на Земле.\n\nЕсли вы имеете в виду состав воды в каком-то конкретном контексте (например, морской, питьевой или химический анализ), уточните!	\N	\N	2025-10-28 12:53:15.281582+00
72532d31-cb44-474c-9edf-8a429991df14	43d3c3d0-9208-42be-bfb2-ffc68641e068	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	user	состав лавы	\N	\N	2025-10-28 12:58:02.78586+00
89796a08-6bbf-42ae-9aaf-cb878ca190fb	43d3c3d0-9208-42be-bfb2-ffc68641e068	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	assistant	### Состав лавы\n\nЛава — это расплавленная магма, которая выходит на поверхность Земли во время извержений вулканов. Её химический состав может варьироваться в зависимости от типа вулкана, региона и глубины происхождения, но в целом лава состоит из силикатов (соединений кремния и кислорода) и других минералов. Большинство элементов в лаве присутствуют в виде оксидов.\n\n#### Основные компоненты лавы\nХимический состав лавы обычно выражается в процентах по массе оксидов. Вот типичный диапазон для основных элементов (данные основаны на вулканических породах, так как лава затвердевает в них):\n\n- **SiO₂ (диоксид кремния, кремнезём)**: 45–75%. Это основной компонент, определяющий вязкость лавы. \n  - В базальтовых лавах (низковязких, как на Гавайях) — 45–52%.\n  - В андезитовых — 52–63%.\n  - В риолитовых (высоковязких, как в Йеллоустоуне) — 63–75%.\n- **O (кислород)**: Около 45–50% (входит в оксиды).\n- **Al₂O₃ (оксид алюминия)**: 10–20%.\n- **FeO/Fe₂O₃ (оксиды железа)**: 5–15% (железо придаёт лаве цвет и способствует магнитным свойствам пород).\n- **CaO (оксид кальция)**: 5–12%.\n- **MgO (оксид магния)**: 3–10% (больше в базальтах).\n- **Na₂O (оксид натрия) и K₂O (оксид калия)**: 1–5% (влияют на щелочность; больше в риолитах).\n- **TiO₂ (оксид титана)**: 0.5–3%.\n- **Прочие элементы**: MnO, P₂O₅, следы тяжёлых металлов (например, вулканические газы могут включать S, Cl, F).\n\n#### Минералогический состав\nПри затвердевании лава формирует вулканические породы с кристаллами:\n- **Оливин, пироксен, плагиоклаз** — в базальтах (тёмные, плотные породы).\n- **Роговые обманки, биотит, кварц** — в риолитах (светлые, стекловидные).\n\n#### Влияние на свойства\n- **Низкий SiO₂** → текучая лава (базальтовая), течет далеко, как река.\n- **Высокий SiO₂** → вязкая лава, образует купола или взрывные извержения.\nЛава также выделяет газы (H₂O, CO₂, SO₂), которые влияют на климат и окружающую среду.\n\nЕсли вы имеете в виду конкретный тип лавы (например, извержение Этны или Килауэа) или больше деталей (геохимия, примеры), уточните! Источники: данные из USGS и вулканологии.	\N	\N	2025-10-28 12:58:13.195907+00
300acdb1-ced3-40f7-ab25-01aa7e3c75de	43d3c3d0-9208-42be-bfb2-ffc68641e068	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	user	чтобы лава была более вязкой - SiO₂  должно быть меньше или больше	\N	\N	2025-10-28 13:36:31.688781+00
6db34de3-eb55-4670-832a-c717f3363d1b	43d3c3d0-9208-42be-bfb2-ffc68641e068	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	assistant	### Вязкость лавы и содержание SiO₂\n\nЧтобы лава была **более вязкой** (т.е. менее текучей, трудно текущей, склонной к образованию куполов или взрывных извержений), содержание **SiO₂ (диоксида кремния)** должно быть **больше**.\n\n#### Краткое объяснение:\n- **Высокий SiO₂** (>63%, например, в риолитовых лавах): Увеличивает вязкость за счёт образования длинных полимерных цепочек кремния и кислорода, что делает лаву "густой" и медленно текущей.\n- **Низкий SiO₂** (<52%, например, в базальтовых лавах): Делает лаву более текучей, как реку, она легко распространяется на большие расстояния.\n\nПример: Вулканы вроде Везувия или Йеллоустоуна извергают вязкие, кремнезёмные лавы, вызывая мощные взрывы. Если нужно больше деталей или примеры, спрашивайте!	\N	\N	2025-10-28 13:36:37.585172+00
5f90135b-7cab-4814-b52d-58618a4a2447	43d3c3d0-9208-42be-bfb2-ffc68641e068	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	user	можно ли из лавы извлечь алюминий?	\N	\N	2025-10-28 13:46:48.635408+00
d007bca5-7ea2-4599-b54f-5d2339b35452	43d3c3d0-9208-42be-bfb2-ffc68641e068	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	user	можно ли из лавы извлечь алюминий	\N	\N	2025-10-28 13:50:15.240629+00
18ba3e23-c541-4c80-8850-1d60fac88625	43d3c3d0-9208-42be-bfb2-ffc68641e068	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	assistant	Короткий ответ: теоретически — да, алюминий можно получить из любого материала, содержащего Al, но практически из лавы это крайне невыгодно и технически очень сложно.\n\nПочему:\n- В лаве (и вулканических породах) алюминий в основном присутствует в виде оксидов и, что важнее, связан в силикатных минералах (плагиоклаз, полевые шпаты, глина и т. п.). Типичный диапазон Al2O3 в лаве ≈ 10–20% (то есть элементный Al теоретически ≈ 5–11% массы), но он химически «заперт» в прочной кристаллической решётке силикатов.\n- Промышленное получение алюминия требует сначала выделить оксид алюминия (Al2O3, «глинозём») в относительно чистом виде, затем восстановить его электролизом (процесс Холла–Эру). Для лавы этап извлечения Al2O3 был бы намного сложнее и дороже, чем для обычного сырья (бокситы), потому что нужно разрушить силикатную матрицу.\n\nКакие методы возможны в принципе (на высоком уровне):\n- Химическое расщепление силикатов: кислотное (например, агрессивные фториды) или щелочное (плавление с NaOH/Na2CO3 с последующим выщелачиванием) — затем осаждение Al(OH)3 и прокаливание до Al2O3. Эти методы требуют сильных реагентов, высоких температур и дают много побочных продуктов/отходов.\n- Механико-химические методы: тонкое измельчение + активация, затем химическая обработка — энергозатратно.\n- Прямой электролиз расплава силикатной массы — теоретически возможен, но требует очень высокой температуры и экстремального коррозионного материала и пока не применим в промышленности.\n\nПрактические проблемы:\n- Очень высокая энергозатратность и стоимость реагентов.\n- Трудности с разделением кремния и алюминия/Al2O3.\n- Коррозия и безопасность (агрессивные фторсодержащие соединения, высокие температуры).\n- Конкуренция с доступным и дешевым сырьём — боксит + процесс Байера гораздо эффективнее.\n\nИтог: извлекать алюминий прямо из лавы технически возможно, но экономически и экологически нецелесообразно. Гораздо рациональнее использовать традиционные источники (бокситы) или искать алюминиевые руды/осадочные отложения с более удобным химическим составом.\n\nЕсли нужно — могу:\n- кратко описать схему «от лавы до металла» на уровне технологических этапов;\n- сравнить энергозатраты/стоимость с добычей из бокситов;\n- рассказать о лабораторных методах выщелачивания алюминия (без подробных опасных инструкций). Какой вариант вам интересен?	\N	\N	2025-10-28 13:50:42.871397+00
2c138ebd-5829-4ec2-b1fe-1b4b9b08cc79	43d3c3d0-9208-42be-bfb2-ffc68641e068	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	user	сравни энергозатраты	\N	\N	2025-10-28 13:55:04.812172+00
25c4206d-3609-4069-a3ac-999c69e5689b	43d3c3d0-9208-42be-bfb2-ffc68641e068	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	assistant	Коротко — извлечение алюминия из лавы потребует значительно больше энергии, чем из обычного сырья (бокситов). Ниже — обоснование с прикидочными цифрами и причинами.\n\n1) Энергозатраты при обычном пути (боксит → Al)\n- Процесс Байера (получение глинозёма, Al2O3): ≈ 2–6 GJ на 1 т Al2O3 (в разных источниках разброс). Поскольку для 1 т Al нужно ≈1,89 т Al2O3, это даёт ≈4–11 GJ/т Al.\n- Электролиз Холла–Эру (Al2O3 → Al): ≈ 12–16 kWh/кг Al ≈ 43–58 GJ/т Al (в электроэнергии).  \n- Прочие операции (аноды, обжиг, транспорт и т.п.): ещё несколько ГДж/т.\n\nИтого для первичного алюминия из бокситов типично ≈ 50–65 GJ на 1 тонну Al (порядок ~50 GJ/т, в зависимости от региона и эффективности).\n\n2) Почему «лава» (вулканические силикатные породы) хуже\n- Алюминий в лаве связан в силикатных минералах (полевые шпаты, плагиоклазы и т. п.). Нужно разрушить Si–O сетку — это энергетически и химически дорого.\n- В лаве Al2O3 может быть ~10–20% (в зависимости от породы). Но это «встроенный» алюминий, а не свободный оксид, как в бокситах.\n\n3) Примерные энергозатраты при извлечении из лавы (приблизительно, порядок величин)\n- Добыча/измельчение/сушка: 1–5 GJ/т Al (зависит от концентрации Al2O3).\n- Химическая/термическая обработка для разрушения силикатов (плавление с NaOH/фторидная обработка/щелочное выщелачивание или высокая температура плавления силкатов): это ключевой и очень энергозатратный этап — порядка десятков–сотен GJ/т Al в зависимости от метода. Оценочно: 50–300+ GJ/т Al (в реальных исследованиях для силкатов цифры обычно значительно выше, чем для гидроксидов/оксидов).\n- Очищение, осаждение и прокаливание гидроксидов до Al2O3: ещё несколько ГДж/т.\n- Электролиз Холла–Эру (тот же этап) ≈ 43–58 GJ/т Al.\n\nСуммарно: извлечение алюминия из лавы по реальным технологическим схемам, скорее всего, потребует порядка сотен GJ/т Al (приблизительно 100–400 GJ/т), то есть как минимум в 2–10 раз больше энергии, чем классический маршрут из бокситов. Для некоторых способов (например, прямой электролиз расплава силикатов) оценка может быть ещё хуже из‑за очень высоких температур и коррозионных проблем.\n\n4) Заключение\n- Технически возможно, но экономически и энергетически нецелесообразно: энергозатраты значительно выше (обычно кратно) по сравнению с бокситовым маршрутом.  \n- Точная цифра зависит от содержания Al2O3 в лавах и выбранной технологии (щелочное выщелачивание, фторидная обработка, плавление и т. п.).  \n\nЕсли хотите, могу:\n- сделать более точную прикидку энергии по вашей конкретной породе (укажите % Al2O3, % SiO2 и массу обрабатываемого материала), или\n- описать возможные методы извлечения и их плюсы/минусы.	\N	\N	2025-10-28 13:55:51.173193+00
c51b3fbf-84c9-46e8-b8a2-e7de8404f919	43d3c3d0-9208-42be-bfb2-ffc68641e068	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	user	сделай примерное сравнение - во сколько рах	\N	\N	2025-10-28 13:57:00.053802+00
2d29c659-ae1a-43dd-ae92-396a58269ca1	43d3c3d0-9208-42be-bfb2-ffc68641e068	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	assistant	### Примерное сравнение энергозатрат: во сколько раз?\n\nЧтобы извлечь 1 тонну алюминия (Al), энергозатраты из лавы (вулканических силикатных пород) будут **примерно в 2–8 раз выше**, чем из традиционного сырья (бокситов). Это грубая оценка на основе типичных химических процессов; точная цифра зависит от состава лавы, выбранного метода и эффективности установки. Ниже — breakdown.\n\n#### Ключевые цифры (приблизительно, в GJ/т Al)\n- **Из бокситов (стандартный промышленный путь)**:\n  - Общие энергозатраты: 50–65 GJ/т Al.\n    - Байеринг (очистка Al(OH)₃ → Al₂O₃): ~10–15 GJ/т.\n    - Электролиз (Al₂O₃ → Al): ~45–55 GJ/т (в основном электричество, 13–15 kWh/кг Al).\n  - Преимущества: Al в бокситах уже в форме гидроксидов/оксидов, легко очищается.\n\n- **Из лавы (силікатные породы, ~10–20% Al₂O₃)**:\n  - Общие энергозатраты: 100–400+ GJ/т Al (оценка на основе лабораторных и промышленных аналогов для силикатов).\n    - Измельчение и подготовка: ~5–10 GJ/т.\n    - Разрушение силикатной матрицы (выщелачивание/плавление/фторидная обработка): ~50–300 GJ/т — это основной "пожиратель" энергии, так как нужно отделить Al от SiO₂ (кремнезём) при высоких температурах (800–1500°C) или с агрессивными реагентами.\n    - Очистка и электролиз: ~50–70 GJ/т (плюс потери на примеси).\n  - Почему так много: Алюминий "запер" в прочной Si–O–Al-сети; её разрушение требует в 5–20 раз больше энергии/реагентов, чем для бокситов.\n\n#### Во сколько раз больше?\n- **Минимальный сценарий** (оптимизированная лава с высоким % Al, мягкий метод выщелачивания): ~2 раз (100 GJ/т vs. 50 GJ/т).\n- **Типичный сценарий** (обычная базальтовая/андезитовая лава, стандартная химия): ~4–6 раз (200–300 GJ/т vs. 50–65 GJ/т).\n- **Пессимистичный сценарий** (низкий % Al, сложные примеси, прямой электролиз расплава): ~8–10+ раз (400+ GJ/т), из-за потерь на нагрев и очистку.\n\n#### Почему разброс?\n- Состав лавы варьируется (больше SiO₂ — сложнее извлекать).\n- Методы: щелочное выщелачивание — дешевле в энергии, но ниже выход; фторидные — эффективнее, но дороже и токсичнее.\n- Сравнение основано на данных из вулканологии, металлургии (например, исследования по извлечению Al из глин/глинистых сланцев, аналогичных силикатам) и отчётах USGS/IEA. В реальности никто не делает это промышленно из-за этих затрат.\n\nИтог: даже в лучшем случае лава — в 2+ раза менее эффективна энергетически, что делает её неконкурентоспособной. Если у вас есть данные о конкретной лаве (% Al₂O₃, SiO₂), могу уточнить расчёт!	\N	\N	2025-10-28 13:57:11.087847+00
2c1c55f3-f537-48f2-9634-f7d6f9a9b996	43d3c3d0-9208-42be-bfb2-ffc68641e068	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	user	а целесообразно ли извлекать титан?	\N	\N	2025-10-28 14:02:41.13838+00
7dc3de21-67fe-4ff6-ad26-69899d8e141e	43d3c3d0-9208-42be-bfb2-ffc68641e068	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	assistant	Коротко — в большинстве случаев извлечение титана из обычной лавы нецелесообразно. Теоретически титан там есть (в виде оксидов/титансодержащих минералов), но на практике он обычно слишком разбросан и в недостаточных концентрациях, чтобы конкурировать с обычными рудными источниками (пески тяжёлых минералов, титано‑магнетитовые залежи).\n\nКлючевые моменты:\n\n- Форма титана в породе: в вулканических породах Ti обычно содержится как TiO2 в минералах рутила и/или как титанит/титановая магнитная фаза (илменит, титаномагнетит) в виде аксессорных (мелких) зерен. Общий TiO2 в базальтах ≈ 0.5–3% — часто слишком мало и распределён неравномерно.\n- Необходимость обогащения: чтобы сделать переработку экономически оправданной, надо сначала обогатить минералы (вращающиеся концентрационные установки, магнитная/электростатическая сепарация, гравитационное обогащение). Это возможно для осадочных месторождений тяжёлых минералов (пески), где рутила/илменит концентрируются естественно. Для разрозненной лавы — дорого и энергоёмко.\n- Дальнейшая переработка: из концентрата получают TiO2 (для пигментов) или переводят в TiCl4 и затем металл (Kroll-процесс). Производство титана‑металла очень энергозатратно и дорого по сравнению с большинством металлов.\n- Экономика: извлекать металл из сырья с низким содержанием титана почти всегда невыгодно. Экономически целесообразны месторождения, где титан сосредоточен в виде рудной сети или плацера (heavy mineral sands) с высокой долей илменита/рутила, либо крупные пласты титано‑магнетитовой руды.\n- Экологические/технические проблемы: обогащение пород с низкой концентрацией требует большого объёма воды/химии, образует хвосты; производство TiCl4 связано с хлорированием и требует контроля выбросов; Kroll‑процесс использует восстановление Mg/Na и требует высоких температур.\n\nВывод: если у вас просто необработанная лава/вулканическая порода — нет, почти всегда нецелесообразно. Если же в районе имеются явно обогащённые слои (концентрации илменита/рутила, плацеры или магматические скопления титано‑магнетита), то переработка может быть оправдана и в промышленности такие месторождения разрабатываются.\n\nЕсли хотите, могу:\n- оценить экономическую целесообразность по вашим данным (укажите %TiO2, форму минералов, объёмы и местные условия), или\n- описать технологическую цепочку от породы к TiO2 и до металла с примерными энергозатратами и затратами.	\N	\N	2025-10-28 14:03:11.309602+00
77e84701-8d6b-46f3-a538-198e68c7949d	43d3c3d0-9208-42be-bfb2-ffc68641e068	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	user	оцени, что целесообразно извлекать из лавы	\N	\N	2025-10-28 14:43:52.575471+00
4b197bd3-5928-4096-abc1-e00d045cd601	43d3c3d0-9208-42be-bfb2-ffc68641e068	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	assistant	Короткий ответ: из «лавы» (и продуктов вулканизма) чаще всего целесообразно добывать строительные и технологические материалы, а металлы — только там, где они природно сконцентрированы. Ниже — по приоритетам.\n\nЧто обычно целесообразно\n- Щебень и инертные материалы из базальтов/андезитов: дешёво добывать, большой рынок (дороги, бетон).\n- Пемза и шлаковая лава (скория): лёгкие заполнители для бетонов, абразивы, фильтры.\n- Пуццоланы (вулканический пепел/туф) для цемента: снижают CO2 и улучшают свойства цемента.\n- Перлит (риолитовое стекло, вспучивание при нагреве): теплоизоляция, кухни/гидропоника.\n- Базальтовая вата и базальтовые волокна: тепло/звукоизоляция, арматура и композиты.\n- Обсидиан и декоративный камень: облицовка, ландшафт.\n\nЧто целесообразно при благоприятных условиях (локально)\n- Железо/титан из ильменит‑магнетитовых концентратов (чёрные пески, титано‑магнетитовые базальты): работает там, где природа уже «обогатила» (пример — ironsand Новой Зеландии). Часто сопутствует ванадий.\n- Цеолиты из гидротермально изменённых туфов (клиноптилолит): сорбенты, агро/ОЧВ.\n- Перлит/перлитовые туфы с хорошей вспучиваемостью (контроль по LOI, индекс вспучивания).\n- Оливин (перидот) и гранат из россыпей как абразив/декор — нишево.\n- Сера из фумарол (исторически) и полезные компоненты геотермальных рассолов (Li, B, Ge) в активных геотермических полях.\n\nЧто обычно нецелесообразно из лавы\n- Алюминий: химически «заперт» в силикатах; энергоёмкость в разы выше, чем у боксита.\n- Титан из обычных лав: концентрации низкие; экономичен только в природно обогащённых песках/рудных телах.\n- Cu/Ni/PGM: экономичны главным образом в древних ультрамафитовых потоках/интрузиях, не в типичных современных лавах.\n- Кремний высокой чистоты (для электроники): слишком много примесей.\n\nНематериальный, но ключевой ресурс\n- Геотермальная энергия в вулканических районах часто ценнее любых «металлических» проектов.\n\nЕсли дадите конкретику (тип породы, %TiO2, %Fe2O3, %Al2O3, наличие магнитных фракций/пемзы/перлита, местоположение), могу прикинуть, какие направления у вас наиболее рентабельны и какие пороговые показатели стоит проверить в поле/лаборатории.	\N	\N	2025-10-28 14:44:50.8762+00
\.


--
-- Data for Name: model_routing_config; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.model_routing_config (id, model_id, use_openrouter, openrouter_model_id, created_at, updated_at) FROM stdin;
6a45d986-143c-456d-aa2a-802d9ebdfd19	gpt-5	t	openai/gpt-5	2025-10-28 08:42:30.821422+00	2025-10-28 11:20:57.808727+00
7f43a97b-9a1f-4ae5-bf59-e5c68f1f6b15	gemini-2.5-flash	t	google/gemini-2.5-flash	2025-10-28 08:42:30.821422+00	2025-10-28 11:41:46.412813+00
684a4b6f-29f8-4fa5-a89e-a20d54cefe72	gemini-2.5-pro	t	google/gemini-2.5-pro	2025-10-28 08:42:30.821422+00	2025-10-28 11:54:15.94073+00
203311f4-0ca6-4762-8362-bc3f579a085b	gpt-5-mini	t	openai/gpt-5-mini	2025-10-28 08:42:30.821422+00	2025-10-28 11:54:20.796019+00
d505c8fa-934d-40bc-8915-0c6f66fa340d	grok-4-fast	t	x-ai/grok-4-fast	2025-10-28 08:42:30.821422+00	2025-10-28 11:56:41.722172+00
db615f99-fd74-48a9-92fd-a8fa3851fb5a	deepseek-chat	t	deepseek/deepseek-chat-v3.1	2025-10-28 08:42:30.821422+00	2025-10-28 11:56:43.567793+00
\.


--
-- Data for Name: models; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.models (id, model_id, display_name, provider, temperature, is_default_access, created_at) FROM stdin;
c6d7edb7-9be9-4781-8aba-f438c80d2000	gpt-5	GPT-5	openai	0.7	f	2025-10-27 06:56:40.569305+00
e4460b2c-1a82-4ee9-9ea9-5be42dbbfcee	gpt-5-mini	GPT-5 Mini	openai	0.7	t	2025-10-27 06:56:40.569305+00
0d845b93-4c24-4147-a285-4334c07e1a50	deepseek-chat	DeepSeek Chat	deepseek	0.7	f	2025-10-27 06:56:40.569305+00
9a8995fc-5c17-4ef9-b716-dcc76869da75	gemini-2.5-pro	Google Gemini 2.5 Pro	gemini	0.7	f	2025-10-27 06:56:40.569305+00
44db19dd-0380-4648-b7da-8befb6031073	gemini-2.5-flash	Google Gemini 2.5 Flash	gemini	0.7	f	2025-10-27 06:56:40.569305+00
2cb9ae31-6c99-4b5c-af42-efb210ecabce	grok-4-fast	Grok 4 Fast	grok	0.7	t	2025-10-27 06:56:40.569305+00
\.


--
-- Data for Name: test_table; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.test_table (id, content) FROM stdin;
\.


--
-- Data for Name: usage_logs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usage_logs (id, user_id, model, prompt_tokens, completion_tokens, total_tokens, status, created_at, error_details, message_id) FROM stdin;
7b0a4654-48fe-4ade-96f0-f577cadb6855	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	deepseek-chat	20	1202	1222	success	2025-10-24 13:14:53.478314+00	\N	\N
b8e21351-9f29-42fe-8653-45c3123b8a79	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	deepseek-chat	1245	470	1715	success	2025-10-24 13:50:52.384021+00	\N	\N
cdac1155-6c56-4363-9be5-c28e4cb6c4c8	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	gpt-4o	0	0	0	error	2025-10-24 13:56:30.969754+00	\N	\N
a758e627-1ea9-4d8a-9fde-d118c2f748f8	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	gemini-1.5-pro-latest	0	0	0	error	2025-10-24 14:04:18.86939+00	\N	\N
f342ba85-ee3a-46ce-9959-69736c89df5e	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	gemini-1.5-pro-latest	0	0	0	error	2025-10-24 14:04:28.267592+00	\N	\N
94b958c2-1680-49f4-906b-78d63608377c	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	gemini-pro	0	0	0	error	2025-10-24 14:08:08.838979+00	\N	\N
a83f37ae-59a4-4656-82e3-32f3e5f38902	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	gemini-pro	0	0	0	error	2025-10-24 14:08:14.391458+00	\N	\N
c918fc4a-f482-4891-a9b5-5558fdc166e5	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	gemini-pro	0	0	0	error	2025-10-24 14:15:44.504888+00	\N	\N
197ed174-4e6d-4acc-9133-cc1077907083	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	gemini-pro	0	0	0	error	2025-10-24 14:22:48.133968+00	\N	\N
0d88e726-58bf-4a15-a704-72934eb50353	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	gemini-pro	0	0	0	error	2025-10-24 14:34:18.241699+00	\N	\N
fbb50e8a-e549-4057-bc1d-74a9c10b07e2	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	gemini-pro	0	0	0	error	2025-10-24 14:34:26.490876+00	\N	\N
94f040eb-ab32-4904-8298-60e74b21200e	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	gemini-pro	0	0	0	error	2025-10-24 14:36:10.84518+00	\N	\N
3eb0e04d-73ae-4f4a-beba-1dbe35a01c42	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	gemini-pro	0	0	0	error	2025-10-24 14:36:46.71618+00	\N	\N
0be30a22-8913-4f59-adb1-781f814cc8d9	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	deepseek-chat	210	841	1051	success	2025-10-24 14:36:57.377263+00	\N	\N
6faea5d8-0af3-4eaf-8370-8cbf00109416	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	deepseek-chat	42	960	1002	success	2025-10-24 14:45:07.130672+00	\N	\N
2afed444-db02-47c9-9e92-041adbf90271	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	gemini-1.5-pro-latest	0	0	0	error	2025-10-24 14:45:22.182026+00	\N	\N
20c4aaa1-4739-4d67-8c8a-72be2b96b047	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	gemini-2.5-flash	6	1450	1456	success	2025-10-24 14:51:24.199784+00	\N	\N
ebb3e3d9-4a7d-4537-aef0-e2841bec1c53	f6979247-726b-487c-8b13-ef5e1ae056d9	gemini-2.5-flash	18	4875	4893	success	2025-10-25 07:22:48.374933+00	\N	\N
d3da576c-ec75-46f8-a0be-1b532c930f5f	f6979247-726b-487c-8b13-ef5e1ae056d9	gemini-2.5-flash	4915	236	5151	success	2025-10-25 07:25:44.808168+00	\N	\N
6080473d-9066-4e69-89a1-e139e378227e	f6979247-726b-487c-8b13-ef5e1ae056d9	gemini-2.5-flash	5175	524	5699	success	2025-10-25 07:27:27.100839+00	\N	\N
480ee700-8f64-46f1-b81e-60a45d834287	f6979247-726b-487c-8b13-ef5e1ae056d9	gemini-2.5-flash	5723	1087	6810	success	2025-10-25 07:30:35.25149+00	\N	\N
4ce66e6d-ba49-4491-886d-5a6af0bc06de	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	deepseek-chat	9	511	520	success	2025-10-25 10:36:49.714868+00	\N	\N
5ddad9bc-ed52-417d-b4ad-2f3e017785e9	f6979247-726b-487c-8b13-ef5e1ae056d9	gemini-2.5-flash	7	43	50	success	2025-10-25 10:37:51.246357+00	\N	\N
fe4bb178-4796-4676-9a63-cc0c18e50d84	f6979247-726b-487c-8b13-ef5e1ae056d9	deepseek-chat	0	0	0	error	2025-10-25 10:54:38.15811+00	\N	\N
a5649378-7f5f-4cf2-9f6c-399e93d6565d	f6979247-726b-487c-8b13-ef5e1ae056d9	deepseek-chat	0	0	0	error	2025-10-25 11:08:05.127102+00	Дневной лимит запросов исчерпан.	\N
1a4e55e0-94d3-495a-bf4d-52fc826684c6	f6979247-726b-487c-8b13-ef5e1ae056d9	deepseek-chat	10	240	250	success	2025-10-25 11:09:15.028558+00	\N	\N
78a94f4a-a2b3-49be-95d5-6810c45df2af	f6979247-726b-487c-8b13-ef5e1ae056d9	deepseek-chat	0	0	0	error	2025-10-25 11:09:29.232967+00	Дневной лимит запросов исчерпан.	\N
a09053e0-dab9-4f65-ba0f-54b5e9d8f044	f6979247-726b-487c-8b13-ef5e1ae056d9	deepseek-chat	269	111	380	success	2025-10-25 11:12:26.949172+00	\N	\N
2d1bd0d0-f055-4f68-8684-05e57fbfe509	f6979247-726b-487c-8b13-ef5e1ae056d9	deepseek-chat	0	0	0	error	2025-10-25 11:13:00.766299+00	Дневной лимит запросов исчерпан.	\N
066771da-9b6a-4dd8-8812-c363000d196d	f6979247-726b-487c-8b13-ef5e1ae056d9	deepseek-chat	0	0	0	error	2025-10-25 11:14:08.814686+00	Дневной лимит запросов исчерпан.	\N
f731bc61-ca4f-4844-9906-e2b18229aa85	f6979247-726b-487c-8b13-ef5e1ae056d9	deepseek-chat	414	109	523	success	2025-10-25 11:16:34.980495+00	\N	\N
21c41a0b-2ed9-4752-b648-2ee6eb0a0996	f6979247-726b-487c-8b13-ef5e1ae056d9	gemini-2.5-flash	522	88	610	success	2025-10-25 11:16:56.823498+00	\N	\N
554c75df-8f1b-4f1f-9302-429fd221f5bb	f6979247-726b-487c-8b13-ef5e1ae056d9	gemini-2.5-flash	0	0	0	error	2025-10-25 11:17:29.668794+00	Дневной лимит запросов исчерпан.	\N
08efd8d1-d8c9-4e3c-8b76-6ccef0ed6838	f6979247-726b-487c-8b13-ef5e1ae056d9	deepseek-chat	629	139	768	success	2025-10-25 11:19:46.111482+00	\N	\N
7a1d61c3-c501-4337-a691-3861abe2936d	f6979247-726b-487c-8b13-ef5e1ae056d9	gemini-2.5-flash	762	125	887	success	2025-10-25 11:20:15.015531+00	\N	\N
38046711-f10d-4839-9b68-1d131641ff2e	f6979247-726b-487c-8b13-ef5e1ae056d9	gemini-2.5-flash	0	0	0	error	2025-10-25 11:20:24.726873+00	Дневной лимит запросов исчерпан.	\N
47185102-d657-4333-8e6b-4dfa7270a7e9	f6979247-726b-487c-8b13-ef5e1ae056d9	deepseek-chat	911	118	1029	success	2025-10-25 11:36:48.971699+00	\N	\N
8b16d45c-e191-4c69-8302-7b879010a286	f6979247-726b-487c-8b13-ef5e1ae056d9	deepseek-chat	1054	368	1422	success	2025-10-25 11:37:25.381064+00	\N	\N
c840dabe-0510-4a40-8b48-28a670f24c5b	f6979247-726b-487c-8b13-ef5e1ae056d9	deepseek-chat	1439	313	1752	success	2025-10-25 11:38:07.135171+00	\N	\N
090448aa-2f46-413d-9651-7f889006cede	f6979247-726b-487c-8b13-ef5e1ae056d9	gemini-2.5-flash	0	0	0	error	2025-10-25 11:38:15.870162+00	Дневной лимит запросов исчерпан.	\N
1779035f-a0b5-4b33-93ae-4ecbd8fbfbd2	f6979247-726b-487c-8b13-ef5e1ae056d9	gemini-2.5-flash	1803	340	2143	success	2025-10-25 12:55:39.140393+00	\N	31639d0b-8dcb-4d6b-870b-8be863637f25
adfa88b4-84dd-433e-8764-1433f235abd5	f6979247-726b-487c-8b13-ef5e1ae056d9	gemini-2.5-pro	2151	330	2481	success	2025-10-25 12:56:03.656284+00	\N	a8640f88-6b47-487d-b9fb-45de277202b9
ac010f3d-be6f-46e7-bf53-59003ba7ecd1	f6979247-726b-487c-8b13-ef5e1ae056d9	deepseek-chat	10	222	232	success	2025-10-25 13:29:35.142828+00	\N	40e978c4-a2c8-4ead-a3be-210230c0646d
3d2c137c-86f1-4103-91f3-8d721fa33c0c	f6979247-726b-487c-8b13-ef5e1ae056d9	gpt-5-mini	0	0	0	error	2025-10-25 13:29:53.470116+00	OpenAI API error: 429	5a3a9a5e-88f1-4fc5-8a46-b34677e87262
f37119df-7db2-4390-bfca-824959384ed6	f6979247-726b-487c-8b13-ef5e1ae056d9	grok-4-fast	0	0	0	error	2025-10-25 14:26:55.508293+00	Дневной лимит запросов исчерпан.	8a5f3345-c1c2-49eb-9e07-71751b638ad0
3446e440-1978-4c32-a00c-bb7a03eeb6a4	f6979247-726b-487c-8b13-ef5e1ae056d9	grok-4-fast	184	260	1036	success	2025-10-25 14:29:50.672606+00	\N	e612db7e-97fa-4727-9ba5-996e818ba04c
94c235bd-541c-4a4e-b8e7-a3feec9924c1	f6979247-726b-487c-8b13-ef5e1ae056d9	grok-4-fast	163	105	449	success	2025-10-25 17:48:47.368964+00	\N	2939713f-ebdd-4486-9ce8-8d5071505f58
ebfe9a85-1c14-464b-b0e2-5a197d19d5ab	f6979247-726b-487c-8b13-ef5e1ae056d9	grok-4-fast	545	891	1799	success	2025-10-25 17:57:50.202734+00	\N	0a159840-e354-4edc-b30e-321678cc8f6c
a188f23f-b7e9-4ddc-8e7a-66ecc1545e35	f6979247-726b-487c-8b13-ef5e1ae056d9	grok-4-fast	286	122	582	success	2025-10-25 20:18:02.065207+00	\N	2b9d6e3a-afa7-4fea-b30f-2a8052f86980
2ad32af3-4c1e-4e11-b938-bbeac65aba64	f6979247-726b-487c-8b13-ef5e1ae056d9	grok-4-fast	426	170	1040	success	2025-10-25 20:22:47.508193+00	\N	dffb1561-1826-42b9-88f3-eb41b2b4b0a7
2115e3af-562a-4ab1-a047-86fe96eb6e76	f6979247-726b-487c-8b13-ef5e1ae056d9	grok-4-fast	622	159	1070	success	2025-10-25 20:25:09.550564+00	\N	965037a0-2ae2-43ff-8add-84848513d568
1db8d456-3326-4a20-8384-5cd1762f3a17	f6979247-726b-487c-8b13-ef5e1ae056d9	grok-4-fast	835	229	1654	success	2025-10-25 20:46:56.585237+00	\N	87fbb45d-23df-4e0f-8777-7c104fd28779
3523fdb7-416d-4525-b4ad-531b0c1208cb	f6979247-726b-487c-8b13-ef5e1ae056d9	grok-4-fast	1077	264	1840	success	2025-10-25 20:47:46.176204+00	\N	bcf1985d-f644-4469-a076-87be402fa678
cb2fad2e-8595-48e9-875c-1024c1749621	b207c1f2-dd20-4e5d-b01f-59d972cec30e	grok-4-fast	173	849	1394	success	2025-10-25 21:30:48.851949+00	\N	3d15dba8-d301-4e08-b6e2-22f3cab9b5eb
8406a0b2-81f0-4702-abbc-24da17d9b761	f6979247-726b-487c-8b13-ef5e1ae056d9	grok-4-fast	202	1450	2151	success	2025-10-27 06:21:34.270371+00	\N	d93f3fb5-605a-4d01-b09e-173109a852db
0320c973-6061-404c-b9df-3e2a3c092683	f6979247-726b-487c-8b13-ef5e1ae056d9	grok-4-fast	1677	2116	4349	success	2025-10-27 06:28:05.838465+00	\N	74f010da-08f3-4508-8b3e-5e146c45a934
2cf772f4-48ef-4b68-b648-c30a04742691	f6979247-726b-487c-8b13-ef5e1ae056d9	grok-4-fast	3811	1526	5754	success	2025-10-27 07:35:43.491572+00	\N	4b66524a-ba45-4b94-8070-925c5a16b00c
8983998f-2353-431d-8361-4105bc0d0add	f6979247-726b-487c-8b13-ef5e1ae056d9	grok-4-fast	5358	2012	7714	success	2025-10-27 07:48:09.428152+00	\N	f021a5e9-2c14-4961-92cd-2258d534d61c
5f758cb8-2f4d-4916-8bd2-fe522eca3058	f6979247-726b-487c-8b13-ef5e1ae056d9	grok-4-fast	7388	2109	9835	success	2025-10-27 07:52:54.423104+00	\N	228085e4-9064-4c39-b14e-958188e2eea4
6ff0a6e1-2e29-4d49-a868-618b01552874	f6979247-726b-487c-8b13-ef5e1ae056d9	grok-4-fast	9517	2290	12308	success	2025-10-27 07:57:54.210311+00	\N	cb0db396-2860-43f1-a88b-40378a89da82
c1859102-1f58-4a53-90d8-2315087c0020	702cf750-b8ea-4bb9-b553-c8eabda2dd9d	grok-4-fast	199	1072	1929	success	2025-10-27 08:44:09.167759+00	\N	1621ca01-a617-4a4f-a703-767e90664522
4dacdbca-5ee7-4e2e-b7b8-5d1d19f903f8	702cf750-b8ea-4bb9-b553-c8eabda2dd9d	grok-4-fast	1292	1541	3209	success	2025-10-27 11:46:42.022389+00	\N	5acc1d2d-dd64-4c9b-90be-93911847443b
9b80278a-bbe5-494c-b451-80aefbe9abcc	702cf750-b8ea-4bb9-b553-c8eabda2dd9d	grok-4-fast	2849	1289	4502	success	2025-10-27 13:28:56.555026+00	\N	9e6abd02-1f31-4409-933a-681804c104a2
3bb1132c-dd4e-426b-bedb-d2e8842b2f2e	f6979247-726b-487c-8b13-ef5e1ae056d9	grok-4-fast	1366	273	2146	success	2025-10-28 06:26:14.706317+00	\N	a8e9c46e-aff7-4b4b-966e-6ca4e14234bf
0443c605-a4e4-409c-9494-da29bf688a51	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	gpt-5-mini	1026	1442	2468	success	2025-10-28 13:50:43.041916+00	\N	\N
ca395947-d340-43ac-beb5-33476a90ec24	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	gpt-5-mini	3496	1268	4764	success	2025-10-28 14:03:11.580287+00	\N	2c1c55f3-f537-48f2-9634-f7d6f9a9b996
ce3e7656-d58c-49d6-8fcb-4bd55cc37e5f	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	gpt-5	4207	2629	6836	success	2025-10-28 14:44:51.103709+00	\N	77e84701-8d6b-46f3-a538-198e68c7949d
\.


--
-- Data for Name: user_model_access; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_model_access (user_id, model_id, created_at) FROM stdin;
f6979247-726b-487c-8b13-ef5e1ae056d9	44db19dd-0380-4648-b7da-8befb6031073	2025-10-27 07:55:12.188119+00
8537c87c-44d7-450e-b1b0-498ae7ddd3f6	e4460b2c-1a82-4ee9-9ea9-5be42dbbfcee	2025-10-27 08:39:34.094917+00
8537c87c-44d7-450e-b1b0-498ae7ddd3f6	2cb9ae31-6c99-4b5c-af42-efb210ecabce	2025-10-27 08:39:34.094917+00
f6979247-726b-487c-8b13-ef5e1ae056d9	e4460b2c-1a82-4ee9-9ea9-5be42dbbfcee	2025-10-27 08:39:34.094917+00
f6979247-726b-487c-8b13-ef5e1ae056d9	2cb9ae31-6c99-4b5c-af42-efb210ecabce	2025-10-27 08:39:34.094917+00
b207c1f2-dd20-4e5d-b01f-59d972cec30e	e4460b2c-1a82-4ee9-9ea9-5be42dbbfcee	2025-10-27 08:39:34.094917+00
b207c1f2-dd20-4e5d-b01f-59d972cec30e	2cb9ae31-6c99-4b5c-af42-efb210ecabce	2025-10-27 08:39:34.094917+00
702cf750-b8ea-4bb9-b553-c8eabda2dd9d	e4460b2c-1a82-4ee9-9ea9-5be42dbbfcee	2025-10-27 08:41:07.243653+00
702cf750-b8ea-4bb9-b553-c8eabda2dd9d	2cb9ae31-6c99-4b5c-af42-efb210ecabce	2025-10-27 08:41:07.243653+00
8537c87c-44d7-450e-b1b0-498ae7ddd3f6	0d845b93-4c24-4147-a285-4334c07e1a50	2025-10-27 08:59:12.658041+00
8537c87c-44d7-450e-b1b0-498ae7ddd3f6	44db19dd-0380-4648-b7da-8befb6031073	2025-10-27 08:59:13.499777+00
8537c87c-44d7-450e-b1b0-498ae7ddd3f6	9a8995fc-5c17-4ef9-b716-dcc76869da75	2025-10-27 08:59:14.195336+00
8537c87c-44d7-450e-b1b0-498ae7ddd3f6	c6d7edb7-9be9-4781-8aba-f438c80d2000	2025-10-27 08:59:15.083302+00
\.


--
-- Data for Name: user_profiles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_profiles (id, email, daily_request_limit, created_at, updated_at, role, display_name) FROM stdin;
8537c87c-44d7-450e-b1b0-498ae7ddd3f6	eugsu10@gmail.com	100	2025-10-24 13:09:54.861618+00	2025-10-25 09:43:28.712129+00	admin	\N
f6979247-726b-487c-8b13-ef5e1ae056d9	mosgate@gmail.com	25	2025-10-25 07:20:34.044915+00	2025-10-25 20:37:53.938174+00	user	\N
b207c1f2-dd20-4e5d-b01f-59d972cec30e	postoev.e.v@su10.ru	20	2025-10-25 21:29:19.864705+00	2025-10-27 13:29:24.338454+00	user	Постоев
702cf750-b8ea-4bb9-b553-c8eabda2dd9d	flowvector@proton.me	30	2025-10-27 08:41:07.243653+00	2025-10-27 13:29:46.066054+00	user	dfdf
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: realtime; Owner: supabase_admin
--

COPY realtime.schema_migrations (version, inserted_at) FROM stdin;
20211116024918	2025-10-23 06:56:34
20211116045059	2025-10-23 06:56:36
20211116050929	2025-10-23 06:56:38
20211116051442	2025-10-23 06:56:40
20211116212300	2025-10-23 06:56:42
20211116213355	2025-10-23 06:56:44
20211116213934	2025-10-23 06:56:46
20211116214523	2025-10-23 06:56:48
20211122062447	2025-10-23 06:56:50
20211124070109	2025-10-23 06:56:52
20211202204204	2025-10-23 06:56:54
20211202204605	2025-10-23 06:56:56
20211210212804	2025-10-23 06:57:01
20211228014915	2025-10-23 06:57:03
20220107221237	2025-10-23 06:57:05
20220228202821	2025-10-23 06:57:07
20220312004840	2025-10-23 06:57:09
20220603231003	2025-10-23 06:57:12
20220603232444	2025-10-23 06:57:13
20220615214548	2025-10-23 06:57:15
20220712093339	2025-10-23 06:57:17
20220908172859	2025-10-23 06:57:19
20220916233421	2025-10-23 06:57:21
20230119133233	2025-10-23 06:57:23
20230128025114	2025-10-23 06:57:25
20230128025212	2025-10-23 06:57:27
20230227211149	2025-10-23 06:57:29
20230228184745	2025-10-23 06:57:31
20230308225145	2025-10-23 06:57:33
20230328144023	2025-10-23 06:57:34
20231018144023	2025-10-23 06:57:37
20231204144023	2025-10-23 06:57:39
20231204144024	2025-10-23 06:57:41
20231204144025	2025-10-23 06:57:43
20240108234812	2025-10-23 06:57:45
20240109165339	2025-10-23 06:57:47
20240227174441	2025-10-23 06:57:50
20240311171622	2025-10-23 06:57:52
20240321100241	2025-10-23 06:57:56
20240401105812	2025-10-23 06:58:01
20240418121054	2025-10-23 06:58:04
20240523004032	2025-10-23 06:58:10
20240618124746	2025-10-23 06:58:12
20240801235015	2025-10-23 06:58:14
20240805133720	2025-10-23 06:58:16
20240827160934	2025-10-23 06:58:18
20240919163303	2025-10-23 06:58:20
20240919163305	2025-10-23 06:58:22
20241019105805	2025-10-23 06:58:24
20241030150047	2025-10-23 06:58:31
20241108114728	2025-10-23 06:58:33
20241121104152	2025-10-23 06:58:35
20241130184212	2025-10-23 06:58:37
20241220035512	2025-10-23 06:58:39
20241220123912	2025-10-23 06:58:41
20241224161212	2025-10-23 06:58:43
20250107150512	2025-10-23 06:58:44
20250110162412	2025-10-23 06:58:46
20250123174212	2025-10-23 06:58:48
20250128220012	2025-10-23 06:58:50
20250506224012	2025-10-23 06:58:52
20250523164012	2025-10-23 06:58:54
20250714121412	2025-10-23 06:58:55
20250905041441	2025-10-23 06:58:57
\.


--
-- Data for Name: subscription; Type: TABLE DATA; Schema: realtime; Owner: supabase_admin
--

COPY realtime.subscription (id, subscription_id, entity, filters, claims, created_at) FROM stdin;
\.


--
-- Data for Name: buckets; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.buckets (id, name, owner, created_at, updated_at, public, avif_autodetection, file_size_limit, allowed_mime_types, owner_id, type) FROM stdin;
\.


--
-- Data for Name: buckets_analytics; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.buckets_analytics (id, type, format, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.migrations (id, name, hash, executed_at) FROM stdin;
0	create-migrations-table	e18db593bcde2aca2a408c4d1100f6abba2195df	2025-10-23 06:56:31.227123
1	initialmigration	6ab16121fbaa08bbd11b712d05f358f9b555d777	2025-10-23 06:56:31.236429
2	storage-schema	5c7968fd083fcea04050c1b7f6253c9771b99011	2025-10-23 06:56:31.245185
3	pathtoken-column	2cb1b0004b817b29d5b0a971af16bafeede4b70d	2025-10-23 06:56:31.269681
4	add-migrations-rls	427c5b63fe1c5937495d9c635c263ee7a5905058	2025-10-23 06:56:31.330713
5	add-size-functions	79e081a1455b63666c1294a440f8ad4b1e6a7f84	2025-10-23 06:56:31.337577
6	change-column-name-in-get-size	f93f62afdf6613ee5e7e815b30d02dc990201044	2025-10-23 06:56:31.346042
7	add-rls-to-buckets	e7e7f86adbc51049f341dfe8d30256c1abca17aa	2025-10-23 06:56:31.352943
8	add-public-to-buckets	fd670db39ed65f9d08b01db09d6202503ca2bab3	2025-10-23 06:56:31.359619
9	fix-search-function	3a0af29f42e35a4d101c259ed955b67e1bee6825	2025-10-23 06:56:31.367161
10	search-files-search-function	68dc14822daad0ffac3746a502234f486182ef6e	2025-10-23 06:56:31.375024
11	add-trigger-to-auto-update-updated_at-column	7425bdb14366d1739fa8a18c83100636d74dcaa2	2025-10-23 06:56:31.383251
12	add-automatic-avif-detection-flag	8e92e1266eb29518b6a4c5313ab8f29dd0d08df9	2025-10-23 06:56:31.39283
13	add-bucket-custom-limits	cce962054138135cd9a8c4bcd531598684b25e7d	2025-10-23 06:56:31.39974
14	use-bytes-for-max-size	941c41b346f9802b411f06f30e972ad4744dad27	2025-10-23 06:56:31.407122
15	add-can-insert-object-function	934146bc38ead475f4ef4b555c524ee5d66799e5	2025-10-23 06:56:31.433393
16	add-version	76debf38d3fd07dcfc747ca49096457d95b1221b	2025-10-23 06:56:31.440356
17	drop-owner-foreign-key	f1cbb288f1b7a4c1eb8c38504b80ae2a0153d101	2025-10-23 06:56:31.447142
18	add_owner_id_column_deprecate_owner	e7a511b379110b08e2f214be852c35414749fe66	2025-10-23 06:56:31.454476
19	alter-default-value-objects-id	02e5e22a78626187e00d173dc45f58fa66a4f043	2025-10-23 06:56:31.464033
20	list-objects-with-delimiter	cd694ae708e51ba82bf012bba00caf4f3b6393b7	2025-10-23 06:56:31.47099
21	s3-multipart-uploads	8c804d4a566c40cd1e4cc5b3725a664a9303657f	2025-10-23 06:56:31.480131
22	s3-multipart-uploads-big-ints	9737dc258d2397953c9953d9b86920b8be0cdb73	2025-10-23 06:56:31.501545
23	optimize-search-function	9d7e604cddc4b56a5422dc68c9313f4a1b6f132c	2025-10-23 06:56:31.515312
24	operation-function	8312e37c2bf9e76bbe841aa5fda889206d2bf8aa	2025-10-23 06:56:31.522299
25	custom-metadata	d974c6057c3db1c1f847afa0e291e6165693b990	2025-10-23 06:56:31.530264
26	objects-prefixes	ef3f7871121cdc47a65308e6702519e853422ae2	2025-10-23 06:56:31.537052
27	search-v2	33b8f2a7ae53105f028e13e9fcda9dc4f356b4a2	2025-10-23 06:56:31.552649
28	object-bucket-name-sorting	ba85ec41b62c6a30a3f136788227ee47f311c436	2025-10-23 06:56:31.606399
29	create-prefixes	a7b1a22c0dc3ab630e3055bfec7ce7d2045c5b7b	2025-10-23 06:56:31.614709
30	update-object-levels	6c6f6cc9430d570f26284a24cf7b210599032db7	2025-10-23 06:56:31.622154
31	objects-level-index	33f1fef7ec7fea08bb892222f4f0f5d79bab5eb8	2025-10-23 06:56:31.629806
32	backward-compatible-index-on-objects	2d51eeb437a96868b36fcdfb1ddefdf13bef1647	2025-10-23 06:56:31.638087
33	backward-compatible-index-on-prefixes	fe473390e1b8c407434c0e470655945b110507bf	2025-10-23 06:56:31.646162
34	optimize-search-function-v1	82b0e469a00e8ebce495e29bfa70a0797f7ebd2c	2025-10-23 06:56:31.648576
35	add-insert-trigger-prefixes	63bb9fd05deb3dc5e9fa66c83e82b152f0caf589	2025-10-23 06:56:31.65729
36	optimise-existing-functions	81cf92eb0c36612865a18016a38496c530443899	2025-10-23 06:56:31.66392
37	add-bucket-name-length-trigger	3944135b4e3e8b22d6d4cbb568fe3b0b51df15c1	2025-10-23 06:56:31.673401
38	iceberg-catalog-flag-on-buckets	19a8bd89d5dfa69af7f222a46c726b7c41e462c5	2025-10-23 06:56:31.681399
39	add-search-v2-sort-support	39cf7d1e6bf515f4b02e41237aba845a7b492853	2025-10-23 06:56:31.695793
40	fix-prefix-race-conditions-optimized	fd02297e1c67df25a9fc110bf8c8a9af7fb06d1f	2025-10-23 06:56:31.702907
41	add-object-level-update-trigger	44c22478bf01744b2129efc480cd2edc9a7d60e9	2025-10-23 06:56:31.713728
42	rollback-prefix-triggers	f2ab4f526ab7f979541082992593938c05ee4b47	2025-10-23 06:56:31.721341
43	fix-object-level	ab837ad8f1c7d00cc0b7310e989a23388ff29fc6	2025-10-23 06:56:31.729347
\.


--
-- Data for Name: objects; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.objects (id, bucket_id, name, owner, created_at, updated_at, last_accessed_at, metadata, version, owner_id, user_metadata, level) FROM stdin;
\.


--
-- Data for Name: prefixes; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.prefixes (bucket_id, name, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: s3_multipart_uploads; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.s3_multipart_uploads (id, in_progress_size, upload_signature, bucket_id, key, version, owner_id, created_at, user_metadata) FROM stdin;
\.


--
-- Data for Name: s3_multipart_uploads_parts; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.s3_multipart_uploads_parts (id, upload_id, size, part_number, bucket_id, key, etag, owner_id, version, created_at) FROM stdin;
\.


--
-- Data for Name: hooks; Type: TABLE DATA; Schema: supabase_functions; Owner: supabase_functions_admin
--

COPY supabase_functions.hooks (id, hook_table_id, hook_name, created_at, request_id) FROM stdin;
1	16495	on_user_created_hook	2025-10-23 16:25:08.089531+00	1
\.


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: supabase_functions; Owner: supabase_functions_admin
--

COPY supabase_functions.migrations (version, inserted_at) FROM stdin;
initial	2025-10-23 16:01:55.019335+00
20210809183423_update_grants	2025-10-23 16:01:55.019335+00
\.


--
-- Data for Name: secrets; Type: TABLE DATA; Schema: vault; Owner: supabase_admin
--

COPY vault.secrets (id, name, description, secret, key_id, nonce, created_at, updated_at) FROM stdin;
\.


--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE SET; Schema: auth; Owner: supabase_auth_admin
--

SELECT pg_catalog.setval('auth.refresh_tokens_id_seq', 80, true);


--
-- Name: subscription_id_seq; Type: SEQUENCE SET; Schema: realtime; Owner: supabase_admin
--

SELECT pg_catalog.setval('realtime.subscription_id_seq', 1, false);


--
-- Name: hooks_id_seq; Type: SEQUENCE SET; Schema: supabase_functions; Owner: supabase_functions_admin
--

SELECT pg_catalog.setval('supabase_functions.hooks_id_seq', 1, true);


--
-- Name: mfa_amr_claims amr_id_pk; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT amr_id_pk PRIMARY KEY (id);


--
-- Name: audit_log_entries audit_log_entries_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.audit_log_entries
    ADD CONSTRAINT audit_log_entries_pkey PRIMARY KEY (id);


--
-- Name: flow_state flow_state_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.flow_state
    ADD CONSTRAINT flow_state_pkey PRIMARY KEY (id);


--
-- Name: identities identities_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_pkey PRIMARY KEY (id);


--
-- Name: identities identities_provider_id_provider_unique; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_provider_id_provider_unique UNIQUE (provider_id, provider);


--
-- Name: instances instances_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.instances
    ADD CONSTRAINT instances_pkey PRIMARY KEY (id);


--
-- Name: mfa_amr_claims mfa_amr_claims_session_id_authentication_method_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT mfa_amr_claims_session_id_authentication_method_pkey UNIQUE (session_id, authentication_method);


--
-- Name: mfa_challenges mfa_challenges_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_challenges
    ADD CONSTRAINT mfa_challenges_pkey PRIMARY KEY (id);


--
-- Name: mfa_factors mfa_factors_last_challenged_at_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_factors
    ADD CONSTRAINT mfa_factors_last_challenged_at_key UNIQUE (last_challenged_at);


--
-- Name: mfa_factors mfa_factors_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_factors
    ADD CONSTRAINT mfa_factors_pkey PRIMARY KEY (id);


--
-- Name: oauth_authorizations oauth_authorizations_authorization_code_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_authorizations
    ADD CONSTRAINT oauth_authorizations_authorization_code_key UNIQUE (authorization_code);


--
-- Name: oauth_authorizations oauth_authorizations_authorization_id_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_authorizations
    ADD CONSTRAINT oauth_authorizations_authorization_id_key UNIQUE (authorization_id);


--
-- Name: oauth_authorizations oauth_authorizations_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_authorizations
    ADD CONSTRAINT oauth_authorizations_pkey PRIMARY KEY (id);


--
-- Name: oauth_clients oauth_clients_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_clients
    ADD CONSTRAINT oauth_clients_pkey PRIMARY KEY (id);


--
-- Name: oauth_consents oauth_consents_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_consents
    ADD CONSTRAINT oauth_consents_pkey PRIMARY KEY (id);


--
-- Name: oauth_consents oauth_consents_user_client_unique; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_consents
    ADD CONSTRAINT oauth_consents_user_client_unique UNIQUE (user_id, client_id);


--
-- Name: one_time_tokens one_time_tokens_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.one_time_tokens
    ADD CONSTRAINT one_time_tokens_pkey PRIMARY KEY (id);


--
-- Name: refresh_tokens refresh_tokens_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_pkey PRIMARY KEY (id);


--
-- Name: refresh_tokens refresh_tokens_token_unique; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_token_unique UNIQUE (token);


--
-- Name: saml_providers saml_providers_entity_id_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_entity_id_key UNIQUE (entity_id);


--
-- Name: saml_providers saml_providers_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_pkey PRIMARY KEY (id);


--
-- Name: saml_relay_states saml_relay_states_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: sso_domains sso_domains_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sso_domains
    ADD CONSTRAINT sso_domains_pkey PRIMARY KEY (id);


--
-- Name: sso_providers sso_providers_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sso_providers
    ADD CONSTRAINT sso_providers_pkey PRIMARY KEY (id);


--
-- Name: users users_phone_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.users
    ADD CONSTRAINT users_phone_key UNIQUE (phone);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: conversations conversations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.conversations
    ADD CONSTRAINT conversations_pkey PRIMARY KEY (id);


--
-- Name: messages messages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_pkey PRIMARY KEY (id);


--
-- Name: model_routing_config model_routing_config_model_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.model_routing_config
    ADD CONSTRAINT model_routing_config_model_id_key UNIQUE (model_id);


--
-- Name: model_routing_config model_routing_config_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.model_routing_config
    ADD CONSTRAINT model_routing_config_pkey PRIMARY KEY (id);


--
-- Name: models models_model_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.models
    ADD CONSTRAINT models_model_id_key UNIQUE (model_id);


--
-- Name: models models_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.models
    ADD CONSTRAINT models_pkey PRIMARY KEY (id);


--
-- Name: test_table test_table_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.test_table
    ADD CONSTRAINT test_table_pkey PRIMARY KEY (id);


--
-- Name: usage_logs usage_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usage_logs
    ADD CONSTRAINT usage_logs_pkey PRIMARY KEY (id);


--
-- Name: user_model_access user_model_access_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_model_access
    ADD CONSTRAINT user_model_access_pkey PRIMARY KEY (user_id, model_id);


--
-- Name: user_profiles user_profiles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_profiles
    ADD CONSTRAINT user_profiles_pkey PRIMARY KEY (id);


--
-- Name: messages messages_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER TABLE ONLY realtime.messages
    ADD CONSTRAINT messages_pkey PRIMARY KEY (id, inserted_at);


--
-- Name: subscription pk_subscription; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.subscription
    ADD CONSTRAINT pk_subscription PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: buckets_analytics buckets_analytics_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.buckets_analytics
    ADD CONSTRAINT buckets_analytics_pkey PRIMARY KEY (id);


--
-- Name: buckets buckets_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.buckets
    ADD CONSTRAINT buckets_pkey PRIMARY KEY (id);


--
-- Name: migrations migrations_name_key; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.migrations
    ADD CONSTRAINT migrations_name_key UNIQUE (name);


--
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- Name: objects objects_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.objects
    ADD CONSTRAINT objects_pkey PRIMARY KEY (id);


--
-- Name: prefixes prefixes_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.prefixes
    ADD CONSTRAINT prefixes_pkey PRIMARY KEY (bucket_id, level, name);


--
-- Name: s3_multipart_uploads_parts s3_multipart_uploads_parts_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads_parts
    ADD CONSTRAINT s3_multipart_uploads_parts_pkey PRIMARY KEY (id);


--
-- Name: s3_multipart_uploads s3_multipart_uploads_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads
    ADD CONSTRAINT s3_multipart_uploads_pkey PRIMARY KEY (id);


--
-- Name: hooks hooks_pkey; Type: CONSTRAINT; Schema: supabase_functions; Owner: supabase_functions_admin
--

ALTER TABLE ONLY supabase_functions.hooks
    ADD CONSTRAINT hooks_pkey PRIMARY KEY (id);


--
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: supabase_functions; Owner: supabase_functions_admin
--

ALTER TABLE ONLY supabase_functions.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (version);


--
-- Name: audit_logs_instance_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX audit_logs_instance_id_idx ON auth.audit_log_entries USING btree (instance_id);


--
-- Name: confirmation_token_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX confirmation_token_idx ON auth.users USING btree (confirmation_token) WHERE ((confirmation_token)::text !~ '^[0-9 ]*$'::text);


--
-- Name: email_change_token_current_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX email_change_token_current_idx ON auth.users USING btree (email_change_token_current) WHERE ((email_change_token_current)::text !~ '^[0-9 ]*$'::text);


--
-- Name: email_change_token_new_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX email_change_token_new_idx ON auth.users USING btree (email_change_token_new) WHERE ((email_change_token_new)::text !~ '^[0-9 ]*$'::text);


--
-- Name: factor_id_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX factor_id_created_at_idx ON auth.mfa_factors USING btree (user_id, created_at);


--
-- Name: flow_state_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX flow_state_created_at_idx ON auth.flow_state USING btree (created_at DESC);


--
-- Name: identities_email_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX identities_email_idx ON auth.identities USING btree (email text_pattern_ops);


--
-- Name: INDEX identities_email_idx; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON INDEX auth.identities_email_idx IS 'Auth: Ensures indexed queries on the email column';


--
-- Name: identities_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX identities_user_id_idx ON auth.identities USING btree (user_id);


--
-- Name: idx_auth_code; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX idx_auth_code ON auth.flow_state USING btree (auth_code);


--
-- Name: idx_user_id_auth_method; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX idx_user_id_auth_method ON auth.flow_state USING btree (user_id, authentication_method);


--
-- Name: mfa_challenge_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX mfa_challenge_created_at_idx ON auth.mfa_challenges USING btree (created_at DESC);


--
-- Name: mfa_factors_user_friendly_name_unique; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX mfa_factors_user_friendly_name_unique ON auth.mfa_factors USING btree (friendly_name, user_id) WHERE (TRIM(BOTH FROM friendly_name) <> ''::text);


--
-- Name: mfa_factors_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX mfa_factors_user_id_idx ON auth.mfa_factors USING btree (user_id);


--
-- Name: oauth_auth_pending_exp_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX oauth_auth_pending_exp_idx ON auth.oauth_authorizations USING btree (expires_at) WHERE (status = 'pending'::auth.oauth_authorization_status);


--
-- Name: oauth_clients_deleted_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX oauth_clients_deleted_at_idx ON auth.oauth_clients USING btree (deleted_at);


--
-- Name: oauth_consents_active_client_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX oauth_consents_active_client_idx ON auth.oauth_consents USING btree (client_id) WHERE (revoked_at IS NULL);


--
-- Name: oauth_consents_active_user_client_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX oauth_consents_active_user_client_idx ON auth.oauth_consents USING btree (user_id, client_id) WHERE (revoked_at IS NULL);


--
-- Name: oauth_consents_user_order_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX oauth_consents_user_order_idx ON auth.oauth_consents USING btree (user_id, granted_at DESC);


--
-- Name: one_time_tokens_relates_to_hash_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX one_time_tokens_relates_to_hash_idx ON auth.one_time_tokens USING hash (relates_to);


--
-- Name: one_time_tokens_token_hash_hash_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX one_time_tokens_token_hash_hash_idx ON auth.one_time_tokens USING hash (token_hash);


--
-- Name: one_time_tokens_user_id_token_type_key; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX one_time_tokens_user_id_token_type_key ON auth.one_time_tokens USING btree (user_id, token_type);


--
-- Name: reauthentication_token_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX reauthentication_token_idx ON auth.users USING btree (reauthentication_token) WHERE ((reauthentication_token)::text !~ '^[0-9 ]*$'::text);


--
-- Name: recovery_token_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX recovery_token_idx ON auth.users USING btree (recovery_token) WHERE ((recovery_token)::text !~ '^[0-9 ]*$'::text);


--
-- Name: refresh_tokens_instance_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_instance_id_idx ON auth.refresh_tokens USING btree (instance_id);


--
-- Name: refresh_tokens_instance_id_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_instance_id_user_id_idx ON auth.refresh_tokens USING btree (instance_id, user_id);


--
-- Name: refresh_tokens_parent_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_parent_idx ON auth.refresh_tokens USING btree (parent);


--
-- Name: refresh_tokens_session_id_revoked_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_session_id_revoked_idx ON auth.refresh_tokens USING btree (session_id, revoked);


--
-- Name: refresh_tokens_updated_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_updated_at_idx ON auth.refresh_tokens USING btree (updated_at DESC);


--
-- Name: saml_providers_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_providers_sso_provider_id_idx ON auth.saml_providers USING btree (sso_provider_id);


--
-- Name: saml_relay_states_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_relay_states_created_at_idx ON auth.saml_relay_states USING btree (created_at DESC);


--
-- Name: saml_relay_states_for_email_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_relay_states_for_email_idx ON auth.saml_relay_states USING btree (for_email);


--
-- Name: saml_relay_states_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_relay_states_sso_provider_id_idx ON auth.saml_relay_states USING btree (sso_provider_id);


--
-- Name: sessions_not_after_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sessions_not_after_idx ON auth.sessions USING btree (not_after DESC);


--
-- Name: sessions_oauth_client_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sessions_oauth_client_id_idx ON auth.sessions USING btree (oauth_client_id);


--
-- Name: sessions_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sessions_user_id_idx ON auth.sessions USING btree (user_id);


--
-- Name: sso_domains_domain_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX sso_domains_domain_idx ON auth.sso_domains USING btree (lower(domain));


--
-- Name: sso_domains_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sso_domains_sso_provider_id_idx ON auth.sso_domains USING btree (sso_provider_id);


--
-- Name: sso_providers_resource_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX sso_providers_resource_id_idx ON auth.sso_providers USING btree (lower(resource_id));


--
-- Name: sso_providers_resource_id_pattern_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sso_providers_resource_id_pattern_idx ON auth.sso_providers USING btree (resource_id text_pattern_ops);


--
-- Name: unique_phone_factor_per_user; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX unique_phone_factor_per_user ON auth.mfa_factors USING btree (user_id, phone);


--
-- Name: user_id_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX user_id_created_at_idx ON auth.sessions USING btree (user_id, created_at);


--
-- Name: users_email_partial_key; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX users_email_partial_key ON auth.users USING btree (email) WHERE (is_sso_user = false);


--
-- Name: INDEX users_email_partial_key; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON INDEX auth.users_email_partial_key IS 'Auth: A partial unique index that applies only when is_sso_user is false';


--
-- Name: users_instance_id_email_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX users_instance_id_email_idx ON auth.users USING btree (instance_id, lower((email)::text));


--
-- Name: users_instance_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX users_instance_id_idx ON auth.users USING btree (instance_id);


--
-- Name: users_is_anonymous_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX users_is_anonymous_idx ON auth.users USING btree (is_anonymous);


--
-- Name: conversations_user_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX conversations_user_id_idx ON public.conversations USING btree (user_id);


--
-- Name: idx_model_routing_model_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_model_routing_model_id ON public.model_routing_config USING btree (model_id);


--
-- Name: idx_user_model_access_model_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_user_model_access_model_id ON public.user_model_access USING btree (model_id);


--
-- Name: idx_user_model_access_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_user_model_access_user_id ON public.user_model_access USING btree (user_id);


--
-- Name: ix_usage_logs_user_id_created_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_usage_logs_user_id_created_at ON public.usage_logs USING btree (user_id, created_at);


--
-- Name: messages_conversation_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX messages_conversation_id_idx ON public.messages USING btree (conversation_id);


--
-- Name: ix_realtime_subscription_entity; Type: INDEX; Schema: realtime; Owner: supabase_admin
--

CREATE INDEX ix_realtime_subscription_entity ON realtime.subscription USING btree (entity);


--
-- Name: messages_inserted_at_topic_index; Type: INDEX; Schema: realtime; Owner: supabase_realtime_admin
--

CREATE INDEX messages_inserted_at_topic_index ON ONLY realtime.messages USING btree (inserted_at DESC, topic) WHERE ((extension = 'broadcast'::text) AND (private IS TRUE));


--
-- Name: subscription_subscription_id_entity_filters_key; Type: INDEX; Schema: realtime; Owner: supabase_admin
--

CREATE UNIQUE INDEX subscription_subscription_id_entity_filters_key ON realtime.subscription USING btree (subscription_id, entity, filters);


--
-- Name: bname; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE UNIQUE INDEX bname ON storage.buckets USING btree (name);


--
-- Name: bucketid_objname; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE UNIQUE INDEX bucketid_objname ON storage.objects USING btree (bucket_id, name);


--
-- Name: idx_multipart_uploads_list; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX idx_multipart_uploads_list ON storage.s3_multipart_uploads USING btree (bucket_id, key, created_at);


--
-- Name: idx_name_bucket_level_unique; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE UNIQUE INDEX idx_name_bucket_level_unique ON storage.objects USING btree (name COLLATE "C", bucket_id, level);


--
-- Name: idx_objects_bucket_id_name; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX idx_objects_bucket_id_name ON storage.objects USING btree (bucket_id, name COLLATE "C");


--
-- Name: idx_objects_lower_name; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX idx_objects_lower_name ON storage.objects USING btree ((path_tokens[level]), lower(name) text_pattern_ops, bucket_id, level);


--
-- Name: idx_prefixes_lower_name; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX idx_prefixes_lower_name ON storage.prefixes USING btree (bucket_id, level, ((string_to_array(name, '/'::text))[level]), lower(name) text_pattern_ops);


--
-- Name: name_prefix_search; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX name_prefix_search ON storage.objects USING btree (name text_pattern_ops);


--
-- Name: objects_bucket_id_level_idx; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE UNIQUE INDEX objects_bucket_id_level_idx ON storage.objects USING btree (bucket_id, level, name COLLATE "C");


--
-- Name: supabase_functions_hooks_h_table_id_h_name_idx; Type: INDEX; Schema: supabase_functions; Owner: supabase_functions_admin
--

CREATE INDEX supabase_functions_hooks_h_table_id_h_name_idx ON supabase_functions.hooks USING btree (hook_table_id, hook_name);


--
-- Name: supabase_functions_hooks_request_id_idx; Type: INDEX; Schema: supabase_functions; Owner: supabase_functions_admin
--

CREATE INDEX supabase_functions_hooks_request_id_idx ON supabase_functions.hooks USING btree (request_id);


--
-- Name: users on_auth_user_created; Type: TRIGGER; Schema: auth; Owner: supabase_auth_admin
--

CREATE TRIGGER on_auth_user_created AFTER INSERT ON auth.users FOR EACH ROW EXECUTE FUNCTION public.handle_new_user();


--
-- Name: user_profiles on_user_profiles_updated; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER on_user_profiles_updated BEFORE UPDATE ON public.user_profiles FOR EACH ROW EXECUTE FUNCTION public.handle_updated_at();


--
-- Name: model_routing_config trigger_update_model_routing_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trigger_update_model_routing_updated_at BEFORE UPDATE ON public.model_routing_config FOR EACH ROW EXECUTE FUNCTION public.update_model_routing_updated_at();


--
-- Name: subscription tr_check_filters; Type: TRIGGER; Schema: realtime; Owner: supabase_admin
--

CREATE TRIGGER tr_check_filters BEFORE INSERT OR UPDATE ON realtime.subscription FOR EACH ROW EXECUTE FUNCTION realtime.subscription_check_filters();


--
-- Name: buckets enforce_bucket_name_length_trigger; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER enforce_bucket_name_length_trigger BEFORE INSERT OR UPDATE OF name ON storage.buckets FOR EACH ROW EXECUTE FUNCTION storage.enforce_bucket_name_length();


--
-- Name: objects objects_delete_delete_prefix; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER objects_delete_delete_prefix AFTER DELETE ON storage.objects FOR EACH ROW EXECUTE FUNCTION storage.delete_prefix_hierarchy_trigger();


--
-- Name: objects objects_insert_create_prefix; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER objects_insert_create_prefix BEFORE INSERT ON storage.objects FOR EACH ROW EXECUTE FUNCTION storage.objects_insert_prefix_trigger();


--
-- Name: objects objects_update_create_prefix; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER objects_update_create_prefix BEFORE UPDATE ON storage.objects FOR EACH ROW WHEN (((new.name <> old.name) OR (new.bucket_id <> old.bucket_id))) EXECUTE FUNCTION storage.objects_update_prefix_trigger();


--
-- Name: prefixes prefixes_create_hierarchy; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER prefixes_create_hierarchy BEFORE INSERT ON storage.prefixes FOR EACH ROW WHEN ((pg_trigger_depth() < 1)) EXECUTE FUNCTION storage.prefixes_insert_trigger();


--
-- Name: prefixes prefixes_delete_hierarchy; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER prefixes_delete_hierarchy AFTER DELETE ON storage.prefixes FOR EACH ROW EXECUTE FUNCTION storage.delete_prefix_hierarchy_trigger();


--
-- Name: objects update_objects_updated_at; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER update_objects_updated_at BEFORE UPDATE ON storage.objects FOR EACH ROW EXECUTE FUNCTION storage.update_updated_at_column();


--
-- Name: identities identities_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: mfa_amr_claims mfa_amr_claims_session_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT mfa_amr_claims_session_id_fkey FOREIGN KEY (session_id) REFERENCES auth.sessions(id) ON DELETE CASCADE;


--
-- Name: mfa_challenges mfa_challenges_auth_factor_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_challenges
    ADD CONSTRAINT mfa_challenges_auth_factor_id_fkey FOREIGN KEY (factor_id) REFERENCES auth.mfa_factors(id) ON DELETE CASCADE;


--
-- Name: mfa_factors mfa_factors_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_factors
    ADD CONSTRAINT mfa_factors_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: oauth_authorizations oauth_authorizations_client_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_authorizations
    ADD CONSTRAINT oauth_authorizations_client_id_fkey FOREIGN KEY (client_id) REFERENCES auth.oauth_clients(id) ON DELETE CASCADE;


--
-- Name: oauth_authorizations oauth_authorizations_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_authorizations
    ADD CONSTRAINT oauth_authorizations_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: oauth_consents oauth_consents_client_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_consents
    ADD CONSTRAINT oauth_consents_client_id_fkey FOREIGN KEY (client_id) REFERENCES auth.oauth_clients(id) ON DELETE CASCADE;


--
-- Name: oauth_consents oauth_consents_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_consents
    ADD CONSTRAINT oauth_consents_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: one_time_tokens one_time_tokens_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.one_time_tokens
    ADD CONSTRAINT one_time_tokens_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: refresh_tokens refresh_tokens_session_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_session_id_fkey FOREIGN KEY (session_id) REFERENCES auth.sessions(id) ON DELETE CASCADE;


--
-- Name: saml_providers saml_providers_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;


--
-- Name: saml_relay_states saml_relay_states_flow_state_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_flow_state_id_fkey FOREIGN KEY (flow_state_id) REFERENCES auth.flow_state(id) ON DELETE CASCADE;


--
-- Name: saml_relay_states saml_relay_states_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;


--
-- Name: sessions sessions_oauth_client_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sessions
    ADD CONSTRAINT sessions_oauth_client_id_fkey FOREIGN KEY (oauth_client_id) REFERENCES auth.oauth_clients(id) ON DELETE CASCADE;


--
-- Name: sessions sessions_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sessions
    ADD CONSTRAINT sessions_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: sso_domains sso_domains_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sso_domains
    ADD CONSTRAINT sso_domains_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;


--
-- Name: conversations conversations_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.conversations
    ADD CONSTRAINT conversations_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: messages messages_conversation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_conversation_id_fkey FOREIGN KEY (conversation_id) REFERENCES public.conversations(id) ON DELETE CASCADE;


--
-- Name: messages messages_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: usage_logs usage_logs_message_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usage_logs
    ADD CONSTRAINT usage_logs_message_id_fkey FOREIGN KEY (message_id) REFERENCES public.messages(id) ON DELETE SET NULL;


--
-- Name: usage_logs usage_logs_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usage_logs
    ADD CONSTRAINT usage_logs_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.user_profiles(id) ON DELETE CASCADE;


--
-- Name: user_model_access user_model_access_model_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_model_access
    ADD CONSTRAINT user_model_access_model_id_fkey FOREIGN KEY (model_id) REFERENCES public.models(id) ON DELETE CASCADE;


--
-- Name: user_model_access user_model_access_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_model_access
    ADD CONSTRAINT user_model_access_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.user_profiles(id) ON DELETE CASCADE;


--
-- Name: user_profiles user_profiles_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_profiles
    ADD CONSTRAINT user_profiles_id_fkey FOREIGN KEY (id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: objects objects_bucketId_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.objects
    ADD CONSTRAINT "objects_bucketId_fkey" FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- Name: prefixes prefixes_bucketId_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.prefixes
    ADD CONSTRAINT "prefixes_bucketId_fkey" FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- Name: s3_multipart_uploads s3_multipart_uploads_bucket_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads
    ADD CONSTRAINT s3_multipart_uploads_bucket_id_fkey FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- Name: s3_multipart_uploads_parts s3_multipart_uploads_parts_bucket_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads_parts
    ADD CONSTRAINT s3_multipart_uploads_parts_bucket_id_fkey FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- Name: s3_multipart_uploads_parts s3_multipart_uploads_parts_upload_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads_parts
    ADD CONSTRAINT s3_multipart_uploads_parts_upload_id_fkey FOREIGN KEY (upload_id) REFERENCES storage.s3_multipart_uploads(id) ON DELETE CASCADE;


--
-- Name: audit_log_entries; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.audit_log_entries ENABLE ROW LEVEL SECURITY;

--
-- Name: flow_state; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.flow_state ENABLE ROW LEVEL SECURITY;

--
-- Name: identities; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.identities ENABLE ROW LEVEL SECURITY;

--
-- Name: instances; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.instances ENABLE ROW LEVEL SECURITY;

--
-- Name: mfa_amr_claims; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.mfa_amr_claims ENABLE ROW LEVEL SECURITY;

--
-- Name: mfa_challenges; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.mfa_challenges ENABLE ROW LEVEL SECURITY;

--
-- Name: mfa_factors; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.mfa_factors ENABLE ROW LEVEL SECURITY;

--
-- Name: one_time_tokens; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.one_time_tokens ENABLE ROW LEVEL SECURITY;

--
-- Name: refresh_tokens; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.refresh_tokens ENABLE ROW LEVEL SECURITY;

--
-- Name: saml_providers; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.saml_providers ENABLE ROW LEVEL SECURITY;

--
-- Name: saml_relay_states; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.saml_relay_states ENABLE ROW LEVEL SECURITY;

--
-- Name: schema_migrations; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.schema_migrations ENABLE ROW LEVEL SECURITY;

--
-- Name: sessions; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.sessions ENABLE ROW LEVEL SECURITY;

--
-- Name: sso_domains; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.sso_domains ENABLE ROW LEVEL SECURITY;

--
-- Name: sso_providers; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.sso_providers ENABLE ROW LEVEL SECURITY;

--
-- Name: users; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.users ENABLE ROW LEVEL SECURITY;

--
-- Name: messages; Type: ROW SECURITY; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER TABLE realtime.messages ENABLE ROW LEVEL SECURITY;

--
-- Name: buckets; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.buckets ENABLE ROW LEVEL SECURITY;

--
-- Name: buckets_analytics; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.buckets_analytics ENABLE ROW LEVEL SECURITY;

--
-- Name: migrations; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.migrations ENABLE ROW LEVEL SECURITY;

--
-- Name: objects; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.objects ENABLE ROW LEVEL SECURITY;

--
-- Name: prefixes; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.prefixes ENABLE ROW LEVEL SECURITY;

--
-- Name: s3_multipart_uploads; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.s3_multipart_uploads ENABLE ROW LEVEL SECURITY;

--
-- Name: s3_multipart_uploads_parts; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.s3_multipart_uploads_parts ENABLE ROW LEVEL SECURITY;

--
-- Name: supabase_realtime; Type: PUBLICATION; Schema: -; Owner: postgres
--

CREATE PUBLICATION supabase_realtime WITH (publish = 'insert, update, delete, truncate');


ALTER PUBLICATION supabase_realtime OWNER TO postgres;

--
-- Name: SCHEMA auth; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT USAGE ON SCHEMA auth TO anon;
GRANT USAGE ON SCHEMA auth TO authenticated;
GRANT USAGE ON SCHEMA auth TO service_role;
GRANT ALL ON SCHEMA auth TO supabase_auth_admin;
GRANT ALL ON SCHEMA auth TO dashboard_user;
GRANT USAGE ON SCHEMA auth TO postgres;


--
-- Name: SCHEMA extensions; Type: ACL; Schema: -; Owner: postgres
--

GRANT USAGE ON SCHEMA extensions TO anon;
GRANT USAGE ON SCHEMA extensions TO authenticated;
GRANT USAGE ON SCHEMA extensions TO service_role;
GRANT ALL ON SCHEMA extensions TO dashboard_user;


--
-- Name: SCHEMA net; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT USAGE ON SCHEMA net TO supabase_functions_admin;
GRANT USAGE ON SCHEMA net TO postgres;
GRANT USAGE ON SCHEMA net TO anon;
GRANT USAGE ON SCHEMA net TO authenticated;
GRANT USAGE ON SCHEMA net TO service_role;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO anon;
GRANT ALL ON SCHEMA public TO authenticated;
GRANT ALL ON SCHEMA public TO service_role;


--
-- Name: SCHEMA realtime; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT USAGE ON SCHEMA realtime TO postgres;
GRANT USAGE ON SCHEMA realtime TO anon;
GRANT USAGE ON SCHEMA realtime TO authenticated;
GRANT USAGE ON SCHEMA realtime TO service_role;
GRANT ALL ON SCHEMA realtime TO supabase_realtime_admin;


--
-- Name: SCHEMA storage; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT USAGE ON SCHEMA storage TO postgres WITH GRANT OPTION;
GRANT USAGE ON SCHEMA storage TO anon;
GRANT USAGE ON SCHEMA storage TO authenticated;
GRANT USAGE ON SCHEMA storage TO service_role;
GRANT ALL ON SCHEMA storage TO supabase_storage_admin;
GRANT ALL ON SCHEMA storage TO dashboard_user;


--
-- Name: SCHEMA supabase_functions; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT USAGE ON SCHEMA supabase_functions TO postgres;
GRANT USAGE ON SCHEMA supabase_functions TO anon;
GRANT USAGE ON SCHEMA supabase_functions TO authenticated;
GRANT USAGE ON SCHEMA supabase_functions TO service_role;
GRANT ALL ON SCHEMA supabase_functions TO supabase_functions_admin;


--
-- Name: SCHEMA vault; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT USAGE ON SCHEMA vault TO postgres WITH GRANT OPTION;
GRANT USAGE ON SCHEMA vault TO service_role;


--
-- Name: FUNCTION email(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.email() TO dashboard_user;


--
-- Name: FUNCTION jwt(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.jwt() TO postgres;
GRANT ALL ON FUNCTION auth.jwt() TO dashboard_user;


--
-- Name: FUNCTION role(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.role() TO dashboard_user;


--
-- Name: FUNCTION uid(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.uid() TO dashboard_user;


--
-- Name: FUNCTION armor(bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.armor(bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.armor(bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.armor(bytea) TO dashboard_user;


--
-- Name: FUNCTION armor(bytea, text[], text[]); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.armor(bytea, text[], text[]) FROM postgres;
GRANT ALL ON FUNCTION extensions.armor(bytea, text[], text[]) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.armor(bytea, text[], text[]) TO dashboard_user;


--
-- Name: FUNCTION crypt(text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.crypt(text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.crypt(text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.crypt(text, text) TO dashboard_user;


--
-- Name: FUNCTION dearmor(text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.dearmor(text) FROM postgres;
GRANT ALL ON FUNCTION extensions.dearmor(text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.dearmor(text) TO dashboard_user;


--
-- Name: FUNCTION decrypt(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.decrypt(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.decrypt(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.decrypt(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION decrypt_iv(bytea, bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.decrypt_iv(bytea, bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.decrypt_iv(bytea, bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.decrypt_iv(bytea, bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION digest(bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.digest(bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.digest(bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.digest(bytea, text) TO dashboard_user;


--
-- Name: FUNCTION digest(text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.digest(text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.digest(text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.digest(text, text) TO dashboard_user;


--
-- Name: FUNCTION encrypt(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.encrypt(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.encrypt(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.encrypt(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION encrypt_iv(bytea, bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.encrypt_iv(bytea, bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.encrypt_iv(bytea, bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.encrypt_iv(bytea, bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION gen_random_bytes(integer); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.gen_random_bytes(integer) FROM postgres;
GRANT ALL ON FUNCTION extensions.gen_random_bytes(integer) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.gen_random_bytes(integer) TO dashboard_user;


--
-- Name: FUNCTION gen_random_uuid(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.gen_random_uuid() FROM postgres;
GRANT ALL ON FUNCTION extensions.gen_random_uuid() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.gen_random_uuid() TO dashboard_user;


--
-- Name: FUNCTION gen_salt(text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.gen_salt(text) FROM postgres;
GRANT ALL ON FUNCTION extensions.gen_salt(text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.gen_salt(text) TO dashboard_user;


--
-- Name: FUNCTION gen_salt(text, integer); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.gen_salt(text, integer) FROM postgres;
GRANT ALL ON FUNCTION extensions.gen_salt(text, integer) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.gen_salt(text, integer) TO dashboard_user;


--
-- Name: FUNCTION grant_pg_cron_access(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

REVOKE ALL ON FUNCTION extensions.grant_pg_cron_access() FROM supabase_admin;
GRANT ALL ON FUNCTION extensions.grant_pg_cron_access() TO supabase_admin WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.grant_pg_cron_access() TO dashboard_user;


--
-- Name: FUNCTION grant_pg_graphql_access(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.grant_pg_graphql_access() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION grant_pg_net_access(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

REVOKE ALL ON FUNCTION extensions.grant_pg_net_access() FROM supabase_admin;
GRANT ALL ON FUNCTION extensions.grant_pg_net_access() TO supabase_admin WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.grant_pg_net_access() TO dashboard_user;


--
-- Name: FUNCTION hmac(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.hmac(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.hmac(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.hmac(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION hmac(text, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.hmac(text, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.hmac(text, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.hmac(text, text, text) TO dashboard_user;


--
-- Name: FUNCTION pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT shared_blk_read_time double precision, OUT shared_blk_write_time double precision, OUT local_blk_read_time double precision, OUT local_blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision, OUT jit_deform_count bigint, OUT jit_deform_time double precision, OUT stats_since timestamp with time zone, OUT minmax_stats_since timestamp with time zone); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT shared_blk_read_time double precision, OUT shared_blk_write_time double precision, OUT local_blk_read_time double precision, OUT local_blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision, OUT jit_deform_count bigint, OUT jit_deform_time double precision, OUT stats_since timestamp with time zone, OUT minmax_stats_since timestamp with time zone) FROM postgres;
GRANT ALL ON FUNCTION extensions.pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT shared_blk_read_time double precision, OUT shared_blk_write_time double precision, OUT local_blk_read_time double precision, OUT local_blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision, OUT jit_deform_count bigint, OUT jit_deform_time double precision, OUT stats_since timestamp with time zone, OUT minmax_stats_since timestamp with time zone) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT shared_blk_read_time double precision, OUT shared_blk_write_time double precision, OUT local_blk_read_time double precision, OUT local_blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision, OUT jit_deform_count bigint, OUT jit_deform_time double precision, OUT stats_since timestamp with time zone, OUT minmax_stats_since timestamp with time zone) TO dashboard_user;


--
-- Name: FUNCTION pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone) FROM postgres;
GRANT ALL ON FUNCTION extensions.pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone) TO dashboard_user;


--
-- Name: FUNCTION pg_stat_statements_reset(userid oid, dbid oid, queryid bigint, minmax_only boolean); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pg_stat_statements_reset(userid oid, dbid oid, queryid bigint, minmax_only boolean) FROM postgres;
GRANT ALL ON FUNCTION extensions.pg_stat_statements_reset(userid oid, dbid oid, queryid bigint, minmax_only boolean) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pg_stat_statements_reset(userid oid, dbid oid, queryid bigint, minmax_only boolean) TO dashboard_user;


--
-- Name: FUNCTION pgp_armor_headers(text, OUT key text, OUT value text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_armor_headers(text, OUT key text, OUT value text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_armor_headers(text, OUT key text, OUT value text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_armor_headers(text, OUT key text, OUT value text) TO dashboard_user;


--
-- Name: FUNCTION pgp_key_id(bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_key_id(bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_key_id(bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_key_id(bytea) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt(bytea, bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt(bytea, bytea, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt_bytea(bytea, bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt_bytea(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt_bytea(bytea, bytea, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_encrypt(text, bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_encrypt(text, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_encrypt_bytea(bytea, bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_encrypt_bytea(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_decrypt(bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_decrypt(bytea, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_decrypt_bytea(bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_decrypt_bytea(bytea, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_encrypt(text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_encrypt(text, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_encrypt_bytea(bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_encrypt_bytea(bytea, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgrst_ddl_watch(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgrst_ddl_watch() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgrst_drop_watch(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgrst_drop_watch() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION set_graphql_placeholder(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.set_graphql_placeholder() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION uuid_generate_v1(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_generate_v1() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_generate_v1() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v1() TO dashboard_user;


--
-- Name: FUNCTION uuid_generate_v1mc(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_generate_v1mc() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_generate_v1mc() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v1mc() TO dashboard_user;


--
-- Name: FUNCTION uuid_generate_v3(namespace uuid, name text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_generate_v3(namespace uuid, name text) FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_generate_v3(namespace uuid, name text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v3(namespace uuid, name text) TO dashboard_user;


--
-- Name: FUNCTION uuid_generate_v4(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_generate_v4() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_generate_v4() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v4() TO dashboard_user;


--
-- Name: FUNCTION uuid_generate_v5(namespace uuid, name text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_generate_v5(namespace uuid, name text) FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_generate_v5(namespace uuid, name text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v5(namespace uuid, name text) TO dashboard_user;


--
-- Name: FUNCTION uuid_nil(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_nil() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_nil() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_nil() TO dashboard_user;


--
-- Name: FUNCTION uuid_ns_dns(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_ns_dns() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_ns_dns() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_ns_dns() TO dashboard_user;


--
-- Name: FUNCTION uuid_ns_oid(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_ns_oid() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_ns_oid() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_ns_oid() TO dashboard_user;


--
-- Name: FUNCTION uuid_ns_url(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_ns_url() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_ns_url() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_ns_url() TO dashboard_user;


--
-- Name: FUNCTION uuid_ns_x500(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_ns_x500() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_ns_x500() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_ns_x500() TO dashboard_user;


--
-- Name: FUNCTION graphql("operationName" text, query text, variables jsonb, extensions jsonb); Type: ACL; Schema: graphql_public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO postgres;
GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO anon;
GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO authenticated;
GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO service_role;


--
-- Name: FUNCTION get_auth(p_usename text); Type: ACL; Schema: pgbouncer; Owner: supabase_admin
--

REVOKE ALL ON FUNCTION pgbouncer.get_auth(p_usename text) FROM PUBLIC;
GRANT ALL ON FUNCTION pgbouncer.get_auth(p_usename text) TO pgbouncer;
GRANT ALL ON FUNCTION pgbouncer.get_auth(p_usename text) TO postgres;


--
-- Name: FUNCTION check_model_access(p_user_id uuid, p_model_id text); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.check_model_access(p_user_id uuid, p_model_id text) TO service_role;


--
-- Name: FUNCTION get_available_models_for_user(p_user_id uuid); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.get_available_models_for_user(p_user_id uuid) TO authenticated;
GRANT ALL ON FUNCTION public.get_available_models_for_user(p_user_id uuid) TO service_role;


--
-- Name: FUNCTION get_user_model_usage_stats(p_user_id uuid, period text); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.get_user_model_usage_stats(p_user_id uuid, period text) TO service_role;


--
-- Name: FUNCTION get_user_usage_stats(p_user_id uuid); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.get_user_usage_stats(p_user_id uuid) TO service_role;


--
-- Name: FUNCTION set_user_model_permission(p_user_id uuid, p_model_id uuid, p_has_access boolean); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.set_user_model_permission(p_user_id uuid, p_model_id uuid, p_has_access boolean) TO service_role;


--
-- Name: FUNCTION apply_rls(wal jsonb, max_record_bytes integer); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO postgres;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO anon;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO authenticated;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO service_role;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO supabase_realtime_admin;


--
-- Name: FUNCTION broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text) TO postgres;
GRANT ALL ON FUNCTION realtime.broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text) TO dashboard_user;


--
-- Name: FUNCTION build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO postgres;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO anon;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO authenticated;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO service_role;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO supabase_realtime_admin;


--
-- Name: FUNCTION "cast"(val text, type_ regtype); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO postgres;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO dashboard_user;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO anon;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO authenticated;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO service_role;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO supabase_realtime_admin;


--
-- Name: FUNCTION check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO postgres;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO anon;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO authenticated;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO service_role;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO supabase_realtime_admin;


--
-- Name: FUNCTION is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO postgres;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO anon;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO authenticated;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO service_role;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO supabase_realtime_admin;


--
-- Name: FUNCTION list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO postgres;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO anon;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO authenticated;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO service_role;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO supabase_realtime_admin;


--
-- Name: FUNCTION quote_wal2json(entity regclass); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO postgres;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO anon;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO authenticated;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO service_role;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO supabase_realtime_admin;


--
-- Name: FUNCTION send(payload jsonb, event text, topic text, private boolean); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.send(payload jsonb, event text, topic text, private boolean) TO postgres;
GRANT ALL ON FUNCTION realtime.send(payload jsonb, event text, topic text, private boolean) TO dashboard_user;


--
-- Name: FUNCTION subscription_check_filters(); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO postgres;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO dashboard_user;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO anon;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO authenticated;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO service_role;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO supabase_realtime_admin;


--
-- Name: FUNCTION to_regrole(role_name text); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO postgres;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO anon;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO authenticated;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO service_role;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO supabase_realtime_admin;


--
-- Name: FUNCTION topic(); Type: ACL; Schema: realtime; Owner: supabase_realtime_admin
--

GRANT ALL ON FUNCTION realtime.topic() TO postgres;
GRANT ALL ON FUNCTION realtime.topic() TO dashboard_user;


--
-- Name: FUNCTION http_request(); Type: ACL; Schema: supabase_functions; Owner: supabase_functions_admin
--

REVOKE ALL ON FUNCTION supabase_functions.http_request() FROM PUBLIC;
GRANT ALL ON FUNCTION supabase_functions.http_request() TO postgres;
GRANT ALL ON FUNCTION supabase_functions.http_request() TO anon;
GRANT ALL ON FUNCTION supabase_functions.http_request() TO authenticated;
GRANT ALL ON FUNCTION supabase_functions.http_request() TO service_role;


--
-- Name: FUNCTION _crypto_aead_det_decrypt(message bytea, additional bytea, key_id bigint, context bytea, nonce bytea); Type: ACL; Schema: vault; Owner: supabase_admin
--

GRANT ALL ON FUNCTION vault._crypto_aead_det_decrypt(message bytea, additional bytea, key_id bigint, context bytea, nonce bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION vault._crypto_aead_det_decrypt(message bytea, additional bytea, key_id bigint, context bytea, nonce bytea) TO service_role;


--
-- Name: FUNCTION create_secret(new_secret text, new_name text, new_description text, new_key_id uuid); Type: ACL; Schema: vault; Owner: supabase_admin
--

GRANT ALL ON FUNCTION vault.create_secret(new_secret text, new_name text, new_description text, new_key_id uuid) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION vault.create_secret(new_secret text, new_name text, new_description text, new_key_id uuid) TO service_role;


--
-- Name: FUNCTION update_secret(secret_id uuid, new_secret text, new_name text, new_description text, new_key_id uuid); Type: ACL; Schema: vault; Owner: supabase_admin
--

GRANT ALL ON FUNCTION vault.update_secret(secret_id uuid, new_secret text, new_name text, new_description text, new_key_id uuid) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION vault.update_secret(secret_id uuid, new_secret text, new_name text, new_description text, new_key_id uuid) TO service_role;


--
-- Name: TABLE audit_log_entries; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.audit_log_entries TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.audit_log_entries TO postgres;
GRANT SELECT ON TABLE auth.audit_log_entries TO postgres WITH GRANT OPTION;


--
-- Name: TABLE flow_state; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.flow_state TO postgres;
GRANT SELECT ON TABLE auth.flow_state TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.flow_state TO dashboard_user;


--
-- Name: TABLE identities; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.identities TO postgres;
GRANT SELECT ON TABLE auth.identities TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.identities TO dashboard_user;


--
-- Name: TABLE instances; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.instances TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.instances TO postgres;
GRANT SELECT ON TABLE auth.instances TO postgres WITH GRANT OPTION;


--
-- Name: TABLE mfa_amr_claims; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.mfa_amr_claims TO postgres;
GRANT SELECT ON TABLE auth.mfa_amr_claims TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.mfa_amr_claims TO dashboard_user;


--
-- Name: TABLE mfa_challenges; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.mfa_challenges TO postgres;
GRANT SELECT ON TABLE auth.mfa_challenges TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.mfa_challenges TO dashboard_user;


--
-- Name: TABLE mfa_factors; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.mfa_factors TO postgres;
GRANT SELECT ON TABLE auth.mfa_factors TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.mfa_factors TO dashboard_user;


--
-- Name: TABLE oauth_authorizations; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.oauth_authorizations TO postgres;
GRANT ALL ON TABLE auth.oauth_authorizations TO dashboard_user;


--
-- Name: TABLE oauth_clients; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.oauth_clients TO postgres;
GRANT ALL ON TABLE auth.oauth_clients TO dashboard_user;


--
-- Name: TABLE oauth_consents; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.oauth_consents TO postgres;
GRANT ALL ON TABLE auth.oauth_consents TO dashboard_user;


--
-- Name: TABLE one_time_tokens; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.one_time_tokens TO postgres;
GRANT SELECT ON TABLE auth.one_time_tokens TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.one_time_tokens TO dashboard_user;


--
-- Name: TABLE refresh_tokens; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.refresh_tokens TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.refresh_tokens TO postgres;
GRANT SELECT ON TABLE auth.refresh_tokens TO postgres WITH GRANT OPTION;


--
-- Name: SEQUENCE refresh_tokens_id_seq; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON SEQUENCE auth.refresh_tokens_id_seq TO dashboard_user;
GRANT ALL ON SEQUENCE auth.refresh_tokens_id_seq TO postgres;


--
-- Name: TABLE saml_providers; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.saml_providers TO postgres;
GRANT SELECT ON TABLE auth.saml_providers TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.saml_providers TO dashboard_user;


--
-- Name: TABLE saml_relay_states; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.saml_relay_states TO postgres;
GRANT SELECT ON TABLE auth.saml_relay_states TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.saml_relay_states TO dashboard_user;


--
-- Name: TABLE schema_migrations; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT SELECT ON TABLE auth.schema_migrations TO postgres WITH GRANT OPTION;


--
-- Name: TABLE sessions; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.sessions TO postgres;
GRANT SELECT ON TABLE auth.sessions TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.sessions TO dashboard_user;


--
-- Name: TABLE sso_domains; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.sso_domains TO postgres;
GRANT SELECT ON TABLE auth.sso_domains TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.sso_domains TO dashboard_user;


--
-- Name: TABLE sso_providers; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.sso_providers TO postgres;
GRANT SELECT ON TABLE auth.sso_providers TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.sso_providers TO dashboard_user;


--
-- Name: TABLE users; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.users TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.users TO postgres;
GRANT SELECT ON TABLE auth.users TO postgres WITH GRANT OPTION;


--
-- Name: TABLE pg_stat_statements; Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON TABLE extensions.pg_stat_statements FROM postgres;
GRANT ALL ON TABLE extensions.pg_stat_statements TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE extensions.pg_stat_statements TO dashboard_user;


--
-- Name: TABLE pg_stat_statements_info; Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON TABLE extensions.pg_stat_statements_info FROM postgres;
GRANT ALL ON TABLE extensions.pg_stat_statements_info TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE extensions.pg_stat_statements_info TO dashboard_user;


--
-- Name: TABLE conversations; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT ON TABLE public.conversations TO authenticated;
GRANT SELECT,INSERT ON TABLE public.conversations TO service_role;


--
-- Name: TABLE messages; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT ON TABLE public.messages TO authenticated;
GRANT SELECT,INSERT ON TABLE public.messages TO service_role;


--
-- Name: TABLE model_routing_config; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.model_routing_config TO service_role;


--
-- Name: TABLE models; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.models TO service_role;
GRANT SELECT ON TABLE public.models TO authenticated;


--
-- Name: TABLE usage_logs; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT ON TABLE public.usage_logs TO authenticated;
GRANT SELECT,INSERT,UPDATE ON TABLE public.usage_logs TO service_role;


--
-- Name: TABLE user_model_access; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,DELETE ON TABLE public.user_model_access TO service_role;
GRANT SELECT ON TABLE public.user_model_access TO authenticated;


--
-- Name: TABLE user_profiles; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.user_profiles TO authenticated;
GRANT SELECT ON TABLE public.user_profiles TO service_role;


--
-- Name: TABLE messages; Type: ACL; Schema: realtime; Owner: supabase_realtime_admin
--

GRANT ALL ON TABLE realtime.messages TO postgres;
GRANT ALL ON TABLE realtime.messages TO dashboard_user;
GRANT SELECT,INSERT,UPDATE ON TABLE realtime.messages TO anon;
GRANT SELECT,INSERT,UPDATE ON TABLE realtime.messages TO authenticated;
GRANT SELECT,INSERT,UPDATE ON TABLE realtime.messages TO service_role;


--
-- Name: TABLE schema_migrations; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON TABLE realtime.schema_migrations TO postgres;
GRANT ALL ON TABLE realtime.schema_migrations TO dashboard_user;
GRANT SELECT ON TABLE realtime.schema_migrations TO anon;
GRANT SELECT ON TABLE realtime.schema_migrations TO authenticated;
GRANT SELECT ON TABLE realtime.schema_migrations TO service_role;
GRANT ALL ON TABLE realtime.schema_migrations TO supabase_realtime_admin;


--
-- Name: TABLE subscription; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON TABLE realtime.subscription TO postgres;
GRANT ALL ON TABLE realtime.subscription TO dashboard_user;
GRANT SELECT ON TABLE realtime.subscription TO anon;
GRANT SELECT ON TABLE realtime.subscription TO authenticated;
GRANT SELECT ON TABLE realtime.subscription TO service_role;
GRANT ALL ON TABLE realtime.subscription TO supabase_realtime_admin;


--
-- Name: SEQUENCE subscription_id_seq; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON SEQUENCE realtime.subscription_id_seq TO postgres;
GRANT ALL ON SEQUENCE realtime.subscription_id_seq TO dashboard_user;
GRANT USAGE ON SEQUENCE realtime.subscription_id_seq TO anon;
GRANT USAGE ON SEQUENCE realtime.subscription_id_seq TO authenticated;
GRANT USAGE ON SEQUENCE realtime.subscription_id_seq TO service_role;
GRANT ALL ON SEQUENCE realtime.subscription_id_seq TO supabase_realtime_admin;


--
-- Name: TABLE buckets; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.buckets TO anon;
GRANT ALL ON TABLE storage.buckets TO authenticated;
GRANT ALL ON TABLE storage.buckets TO service_role;
GRANT ALL ON TABLE storage.buckets TO postgres WITH GRANT OPTION;


--
-- Name: TABLE buckets_analytics; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.buckets_analytics TO service_role;
GRANT ALL ON TABLE storage.buckets_analytics TO authenticated;
GRANT ALL ON TABLE storage.buckets_analytics TO anon;


--
-- Name: TABLE objects; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.objects TO anon;
GRANT ALL ON TABLE storage.objects TO authenticated;
GRANT ALL ON TABLE storage.objects TO service_role;
GRANT ALL ON TABLE storage.objects TO postgres WITH GRANT OPTION;


--
-- Name: TABLE prefixes; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.prefixes TO service_role;
GRANT ALL ON TABLE storage.prefixes TO authenticated;
GRANT ALL ON TABLE storage.prefixes TO anon;


--
-- Name: TABLE s3_multipart_uploads; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.s3_multipart_uploads TO service_role;
GRANT SELECT ON TABLE storage.s3_multipart_uploads TO authenticated;
GRANT SELECT ON TABLE storage.s3_multipart_uploads TO anon;


--
-- Name: TABLE s3_multipart_uploads_parts; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.s3_multipart_uploads_parts TO service_role;
GRANT SELECT ON TABLE storage.s3_multipart_uploads_parts TO authenticated;
GRANT SELECT ON TABLE storage.s3_multipart_uploads_parts TO anon;


--
-- Name: TABLE hooks; Type: ACL; Schema: supabase_functions; Owner: supabase_functions_admin
--

GRANT ALL ON TABLE supabase_functions.hooks TO postgres;
GRANT ALL ON TABLE supabase_functions.hooks TO anon;
GRANT ALL ON TABLE supabase_functions.hooks TO authenticated;
GRANT ALL ON TABLE supabase_functions.hooks TO service_role;


--
-- Name: SEQUENCE hooks_id_seq; Type: ACL; Schema: supabase_functions; Owner: supabase_functions_admin
--

GRANT ALL ON SEQUENCE supabase_functions.hooks_id_seq TO postgres;
GRANT ALL ON SEQUENCE supabase_functions.hooks_id_seq TO anon;
GRANT ALL ON SEQUENCE supabase_functions.hooks_id_seq TO authenticated;
GRANT ALL ON SEQUENCE supabase_functions.hooks_id_seq TO service_role;


--
-- Name: TABLE migrations; Type: ACL; Schema: supabase_functions; Owner: supabase_functions_admin
--

GRANT ALL ON TABLE supabase_functions.migrations TO postgres;
GRANT ALL ON TABLE supabase_functions.migrations TO anon;
GRANT ALL ON TABLE supabase_functions.migrations TO authenticated;
GRANT ALL ON TABLE supabase_functions.migrations TO service_role;


--
-- Name: TABLE secrets; Type: ACL; Schema: vault; Owner: supabase_admin
--

GRANT SELECT,REFERENCES,DELETE,TRUNCATE ON TABLE vault.secrets TO postgres WITH GRANT OPTION;
GRANT SELECT,DELETE ON TABLE vault.secrets TO service_role;


--
-- Name: TABLE decrypted_secrets; Type: ACL; Schema: vault; Owner: supabase_admin
--

GRANT SELECT,REFERENCES,DELETE,TRUNCATE ON TABLE vault.decrypted_secrets TO postgres WITH GRANT OPTION;
GRANT SELECT,DELETE ON TABLE vault.decrypted_secrets TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: auth; Owner: supabase_auth_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON SEQUENCES TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: auth; Owner: supabase_auth_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON FUNCTIONS TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: auth; Owner: supabase_auth_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON TABLES TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: extensions; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA extensions GRANT ALL ON SEQUENCES TO postgres WITH GRANT OPTION;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: extensions; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA extensions GRANT ALL ON FUNCTIONS TO postgres WITH GRANT OPTION;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: extensions; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA extensions GRANT ALL ON TABLES TO postgres WITH GRANT OPTION;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: graphql; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: graphql; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: graphql; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: graphql_public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: graphql_public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: graphql_public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: realtime; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON SEQUENCES TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: realtime; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON FUNCTIONS TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: realtime; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON TABLES TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: storage; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: storage; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: storage; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: supabase_functions; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA supabase_functions GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA supabase_functions GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA supabase_functions GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA supabase_functions GRANT ALL ON SEQUENCES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: supabase_functions; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA supabase_functions GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA supabase_functions GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA supabase_functions GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA supabase_functions GRANT ALL ON FUNCTIONS TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: supabase_functions; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA supabase_functions GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA supabase_functions GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA supabase_functions GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA supabase_functions GRANT ALL ON TABLES TO service_role;


--
-- Name: issue_graphql_placeholder; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER issue_graphql_placeholder ON sql_drop
         WHEN TAG IN ('DROP EXTENSION')
   EXECUTE FUNCTION extensions.set_graphql_placeholder();


ALTER EVENT TRIGGER issue_graphql_placeholder OWNER TO supabase_admin;

--
-- Name: issue_pg_cron_access; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER issue_pg_cron_access ON ddl_command_end
         WHEN TAG IN ('CREATE EXTENSION')
   EXECUTE FUNCTION extensions.grant_pg_cron_access();


ALTER EVENT TRIGGER issue_pg_cron_access OWNER TO supabase_admin;

--
-- Name: issue_pg_graphql_access; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER issue_pg_graphql_access ON ddl_command_end
         WHEN TAG IN ('CREATE FUNCTION')
   EXECUTE FUNCTION extensions.grant_pg_graphql_access();


ALTER EVENT TRIGGER issue_pg_graphql_access OWNER TO supabase_admin;

--
-- Name: issue_pg_net_access; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER issue_pg_net_access ON ddl_command_end
         WHEN TAG IN ('CREATE EXTENSION')
   EXECUTE FUNCTION extensions.grant_pg_net_access();


ALTER EVENT TRIGGER issue_pg_net_access OWNER TO supabase_admin;

--
-- Name: pgrst_ddl_watch; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER pgrst_ddl_watch ON ddl_command_end
   EXECUTE FUNCTION extensions.pgrst_ddl_watch();


ALTER EVENT TRIGGER pgrst_ddl_watch OWNER TO supabase_admin;

--
-- Name: pgrst_drop_watch; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER pgrst_drop_watch ON sql_drop
   EXECUTE FUNCTION extensions.pgrst_drop_watch();


ALTER EVENT TRIGGER pgrst_drop_watch OWNER TO supabase_admin;

--
-- PostgreSQL database dump complete
--

\unrestrict w119JqsYRBhNFZ7fgAQp89lxfmljQr4HhfoceEP7nnExFnFNMMzQfjzbJNaZCnH

