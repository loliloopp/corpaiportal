--
-- PostgreSQL database dump
--

\restrict JkobQEfw9aa35avXqHg9vwHDKzHU8SBju8AcdzXl22u5eXx12hLnMjWCECDyeiM

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
            COALESCE(SUM(total_tokens), 0) AS total_tokens,
            COALESCE(SUM(cost), 0) AS total_cost
        FROM public.usage_logs
        WHERE status = 'success'
          AND created_at >= (
            CASE
              WHEN period = 'day' THEN date_trunc('day', now() at time zone 'utc')
              WHEN period = 'week' THEN now() at time zone 'utc' - interval '6 days'
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
            ul.total_tokens,
            ul.cost
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
            COALESCE(SUM(total_tokens), 0) AS total_tokens,
            COALESCE(SUM(cost), 0) AS total_cost
        FROM public.usage_logs
        WHERE user_id = p_user_id
          AND status = 'success'
          AND created_at >= (
            CASE
              WHEN period = 'day' THEN date_trunc('day', now() at time zone 'utc')
              WHEN period = 'week' THEN now() at time zone 'utc' - interval '6 days'
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
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    description text,
    approximate_cost text
);


ALTER TABLE public.models OWNER TO postgres;

--
-- Name: prompts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.prompts (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    role_name text NOT NULL,
    system_prompt text NOT NULL,
    temperature numeric(3,2),
    top_p numeric(3,2),
    created_by uuid NOT NULL,
    by_default boolean DEFAULT false,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.prompts OWNER TO postgres;

--
-- Name: settings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.settings (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    key text NOT NULL,
    value boolean DEFAULT false NOT NULL,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now(),
    enable_prompt_preprocessing boolean DEFAULT false
);


ALTER TABLE public.settings OWNER TO postgres;

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
    message_id uuid,
    cost numeric(10,6) DEFAULT NULL::numeric
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
    daily_request_limit integer DEFAULT 0 NOT NULL,
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
00000000-0000-0000-0000-000000000000	7b518510-6866-4863-a04a-8af9e1efd0ac	{"action":"token_refreshed","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-29 06:57:51.551727+00	
00000000-0000-0000-0000-000000000000	a83f70aa-39f5-41ca-8b13-f025d1907196	{"action":"token_revoked","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-29 06:57:51.578117+00	
00000000-0000-0000-0000-000000000000	9d0de558-d6dd-4e75-b6ec-93c2ec405941	{"action":"user_confirmation_requested","actor_id":"f8e5ca55-75fd-419d-a30c-42ffa125d9d9","actor_username":"alexeymoguev@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2025-10-29 07:23:48.990586+00	
00000000-0000-0000-0000-000000000000	142f3e9f-dfee-4728-951b-41a363c2ca34	{"action":"user_signedup","actor_id":"f8e5ca55-75fd-419d-a30c-42ffa125d9d9","actor_username":"alexeymoguev@gmail.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}	2025-10-29 07:24:12.014454+00	
00000000-0000-0000-0000-000000000000	d4db8b9b-cb77-4adb-b17d-2a88f518a54b	{"action":"login","actor_id":"f8e5ca55-75fd-419d-a30c-42ffa125d9d9","actor_username":"alexeymoguev@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-29 07:24:12.785442+00	
00000000-0000-0000-0000-000000000000	688deeb4-cb4e-48ff-b054-c442433cc178	{"action":"token_refreshed","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-29 08:03:14.859573+00	
00000000-0000-0000-0000-000000000000	6ba61ac5-3004-4a54-815e-bd327f74da2b	{"action":"token_revoked","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-29 08:03:14.878336+00	
00000000-0000-0000-0000-000000000000	8d8067cb-b6f2-4554-a49b-078a0fd39703	{"action":"token_refreshed","actor_id":"f8e5ca55-75fd-419d-a30c-42ffa125d9d9","actor_username":"alexeymoguev@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-29 09:14:05.198626+00	
00000000-0000-0000-0000-000000000000	1357b233-d988-48f0-9050-4cefe3ebcac5	{"action":"token_revoked","actor_id":"f8e5ca55-75fd-419d-a30c-42ffa125d9d9","actor_username":"alexeymoguev@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-29 09:14:05.220889+00	
00000000-0000-0000-0000-000000000000	1aa5b71b-1d3a-4599-b08c-86eeaba3ba0c	{"action":"token_refreshed","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-29 09:14:17.978812+00	
00000000-0000-0000-0000-000000000000	2facd440-729b-4c55-83bc-7249141a1cca	{"action":"token_revoked","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-29 09:14:17.981356+00	
00000000-0000-0000-0000-000000000000	d1b81a03-e7b7-4721-a147-4e0982c78a2c	{"action":"token_refreshed","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-29 10:56:17.039258+00	
00000000-0000-0000-0000-000000000000	d537a445-c68a-412b-95a4-e5bbf044cfcb	{"action":"token_revoked","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-29 10:56:17.072232+00	
00000000-0000-0000-0000-000000000000	ca397c09-a808-40c8-b8c7-ac41bcaa5e96	{"action":"login","actor_id":"f6979247-726b-487c-8b13-ef5e1ae056d9","actor_username":"mosgate@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-29 11:17:05.785126+00	
00000000-0000-0000-0000-000000000000	0329e926-40a1-4d3b-9cc6-b4c54df8fc52	{"action":"login","actor_id":"f6979247-726b-487c-8b13-ef5e1ae056d9","actor_username":"mosgate@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-29 11:49:19.961806+00	
00000000-0000-0000-0000-000000000000	6d8dbfb4-dc20-44ea-82e4-e9468ce67c05	{"action":"logout","actor_id":"f6979247-726b-487c-8b13-ef5e1ae056d9","actor_username":"mosgate@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-10-29 11:50:44.420889+00	
00000000-0000-0000-0000-000000000000	0d905b35-9987-42ba-b216-1fe0f83841a4	{"action":"login","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-29 11:50:52.172958+00	
00000000-0000-0000-0000-000000000000	d8c197e8-b148-45fd-bbba-4ff0bc8a069d	{"action":"token_refreshed","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-29 11:54:41.365623+00	
00000000-0000-0000-0000-000000000000	21c2b7f0-d629-4a98-9f66-aa0829d75aa3	{"action":"token_revoked","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-29 11:54:41.380532+00	
00000000-0000-0000-0000-000000000000	9a92eb36-631f-40cd-8b60-d32eba875f81	{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"flowvector@proton.me","user_id":"702cf750-b8ea-4bb9-b553-c8eabda2dd9d","user_phone":""}}	2025-10-29 12:21:53.584117+00	
00000000-0000-0000-0000-000000000000	94ba01d7-f5a0-4b9a-8387-5553d7f939d9	{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"postoev.e.v@su10.ru","user_id":"b207c1f2-dd20-4e5d-b01f-59d972cec30e","user_phone":""}}	2025-10-29 12:21:53.583428+00	
00000000-0000-0000-0000-000000000000	c1f37555-96b8-4804-833a-3342db337e61	{"action":"logout","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-10-29 12:22:42.079658+00	
00000000-0000-0000-0000-000000000000	f833b60f-1761-4170-a4ad-97e2b116f4d8	{"action":"user_signedup","actor_id":"990cf9a6-88ab-465c-a280-b51c0467aeb9","actor_username":"postoev.e.v@su10.ru","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}	2025-10-29 12:23:00.206603+00	
00000000-0000-0000-0000-000000000000	7b60d187-b161-4307-b1b8-390289566a35	{"action":"login","actor_id":"990cf9a6-88ab-465c-a280-b51c0467aeb9","actor_username":"postoev.e.v@su10.ru","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-29 12:23:00.21065+00	
00000000-0000-0000-0000-000000000000	2ccbc4be-2f33-43cd-b616-13c16bf98ffb	{"action":"logout","actor_id":"990cf9a6-88ab-465c-a280-b51c0467aeb9","actor_username":"postoev.e.v@su10.ru","actor_via_sso":false,"log_type":"account"}	2025-10-29 12:46:37.96274+00	
00000000-0000-0000-0000-000000000000	9c2565f0-1cbf-4f0b-ac06-dbae49ad50cc	{"action":"login","actor_id":"f6979247-726b-487c-8b13-ef5e1ae056d9","actor_username":"mosgate@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-29 12:46:43.335804+00	
00000000-0000-0000-0000-000000000000	44ce551b-51eb-4467-a8ac-fe768df404a7	{"action":"logout","actor_id":"f6979247-726b-487c-8b13-ef5e1ae056d9","actor_username":"mosgate@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-10-29 12:49:12.574991+00	
00000000-0000-0000-0000-000000000000	a84acc0a-9baa-4bf8-bac4-81b548bb41e7	{"action":"login","actor_id":"990cf9a6-88ab-465c-a280-b51c0467aeb9","actor_username":"postoev.e.v@su10.ru","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-29 12:49:21.31544+00	
00000000-0000-0000-0000-000000000000	7d28936c-c3bc-4748-a99e-1341a52e0148	{"action":"login","actor_id":"990cf9a6-88ab-465c-a280-b51c0467aeb9","actor_username":"postoev.e.v@su10.ru","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-29 12:50:35.548739+00	
00000000-0000-0000-0000-000000000000	04a16623-dbb4-457a-a0f3-9acc8e89180c	{"action":"login","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-29 13:02:14.105826+00	
00000000-0000-0000-0000-000000000000	ffb1b34e-be76-42fb-a968-f3b7938d6eff	{"action":"user_signedup","actor_id":"310087c1-ef51-4c13-9f65-e581845313fe","actor_username":"kazubov.a.a@su10.ru","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}	2025-10-29 13:13:37.024096+00	
00000000-0000-0000-0000-000000000000	1f8854e7-4099-4cbc-b191-12f05b3f269d	{"action":"login","actor_id":"310087c1-ef51-4c13-9f65-e581845313fe","actor_username":"kazubov.a.a@su10.ru","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-29 13:13:37.042083+00	
00000000-0000-0000-0000-000000000000	e4e02b0c-927a-4eb0-b95c-41256f9233fd	{"action":"user_signedup","actor_id":"7d3d3502-7204-4aee-87da-1fdcbdbba8ad","actor_username":"korneichik.k.a@su10.ru","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}	2025-10-29 13:13:51.057972+00	
00000000-0000-0000-0000-000000000000	112b4cee-3304-44cc-a144-2a23f36ff963	{"action":"login","actor_id":"7d3d3502-7204-4aee-87da-1fdcbdbba8ad","actor_username":"korneichik.k.a@su10.ru","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-29 13:13:51.062761+00	
00000000-0000-0000-0000-000000000000	eabc2525-9a2e-4ce6-a17f-f5abebd9ec05	{"action":"user_signedup","actor_id":"f8d1b0bb-75b7-4c50-b431-a6c8ae17fe19","actor_username":"korotkov.a.d@mstroy.pro","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}	2025-10-29 13:16:04.399625+00	
00000000-0000-0000-0000-000000000000	336c2e57-7a21-4148-989a-2bab5b201ea0	{"action":"login","actor_id":"f8d1b0bb-75b7-4c50-b431-a6c8ae17fe19","actor_username":"korotkov.a.d@mstroy.pro","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-29 13:16:04.406865+00	
00000000-0000-0000-0000-000000000000	b2560b01-e9da-4f05-804d-176f4dca7540	{"action":"user_signedup","actor_id":"112fd71d-fef9-4b4b-ad91-74f2fe211947","actor_username":"semina.a.v@su10.ru","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}	2025-10-29 13:16:22.337395+00	
00000000-0000-0000-0000-000000000000	34b808b2-54d8-4c49-88f9-5eae7b2299ca	{"action":"login","actor_id":"112fd71d-fef9-4b4b-ad91-74f2fe211947","actor_username":"semina.a.v@su10.ru","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-29 13:16:22.340737+00	
00000000-0000-0000-0000-000000000000	e9b93832-14f9-4d8e-962d-c19b9a6b8cf7	{"action":"login","actor_id":"f8e5ca55-75fd-419d-a30c-42ffa125d9d9","actor_username":"alexeymoguev@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-29 13:25:50.39617+00	
00000000-0000-0000-0000-000000000000	0ca26ed6-7191-402e-bc67-5e6e6fee5dbc	{"action":"user_signedup","actor_id":"e4da2eb1-4729-41ec-978a-07a5d01a9fff","actor_username":"andrew_uzun3@mail.ru","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}	2025-10-29 13:49:47.145211+00	
00000000-0000-0000-0000-000000000000	13c4851c-ecac-4038-8cd2-96af5291ee2d	{"action":"login","actor_id":"e4da2eb1-4729-41ec-978a-07a5d01a9fff","actor_username":"andrew_uzun3@mail.ru","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-29 13:49:47.16789+00	
00000000-0000-0000-0000-000000000000	eaa41c07-2474-4f3e-b4ce-88f570fbf788	{"action":"user_signedup","actor_id":"f051acbc-190a-4ea5-bf1c-90bb1cd7a58c","actor_username":"shanin.r.a@su10.ru","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}	2025-10-29 13:50:13.264523+00	
00000000-0000-0000-0000-000000000000	a9cb8ec5-78b0-490b-b3c3-9c2ae737b148	{"action":"login","actor_id":"f051acbc-190a-4ea5-bf1c-90bb1cd7a58c","actor_username":"shanin.r.a@su10.ru","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-29 13:50:13.274383+00	
00000000-0000-0000-0000-000000000000	0b33f809-a960-4723-9b11-d731e1788a04	{"action":"user_signedup","actor_id":"3c0bc697-412f-42ef-8a9e-3c2a96286072","actor_username":"repnikov.i.a@su10.ru","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}	2025-10-29 13:52:27.347646+00	
00000000-0000-0000-0000-000000000000	f307b752-e284-488d-b0d9-f4c04d75f4ed	{"action":"login","actor_id":"3c0bc697-412f-42ef-8a9e-3c2a96286072","actor_username":"repnikov.i.a@su10.ru","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-29 13:52:27.360596+00	
00000000-0000-0000-0000-000000000000	15d87387-c451-4fda-a030-466498571407	{"action":"token_refreshed","actor_id":"990cf9a6-88ab-465c-a280-b51c0467aeb9","actor_username":"postoev.e.v@su10.ru","actor_via_sso":false,"log_type":"token"}	2025-10-29 13:52:44.069153+00	
00000000-0000-0000-0000-000000000000	9a5c0db2-4ba0-4957-974d-f49e9e8eacbb	{"action":"token_revoked","actor_id":"990cf9a6-88ab-465c-a280-b51c0467aeb9","actor_username":"postoev.e.v@su10.ru","actor_via_sso":false,"log_type":"token"}	2025-10-29 13:52:44.070117+00	
00000000-0000-0000-0000-000000000000	ba164cbe-c613-43ae-b3ca-2742ffb1f103	{"action":"user_signedup","actor_id":"c3065a1d-0422-4c95-af57-580eab0c970f","actor_username":"olenina.e.y@su10.ru","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}	2025-10-29 13:54:54.203649+00	
00000000-0000-0000-0000-000000000000	f388eb69-8a3d-47fa-a7b4-632de780a799	{"action":"login","actor_id":"c3065a1d-0422-4c95-af57-580eab0c970f","actor_username":"olenina.e.y@su10.ru","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-29 13:54:54.210413+00	
00000000-0000-0000-0000-000000000000	51114ea6-e636-4474-b35c-bd88df220061	{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"mosgate@gmail.com","user_id":"f6979247-726b-487c-8b13-ef5e1ae056d9","user_phone":""}}	2025-10-29 14:00:30.672128+00	
00000000-0000-0000-0000-000000000000	4576f730-4199-4598-8eab-778efbc8acf1	{"action":"logout","actor_id":"990cf9a6-88ab-465c-a280-b51c0467aeb9","actor_username":"postoev.e.v@su10.ru","actor_via_sso":false,"log_type":"account"}	2025-10-29 14:00:41.130133+00	
00000000-0000-0000-0000-000000000000	ced0a8bf-c533-41f6-b943-18476111a7ad	{"action":"user_signedup","actor_id":"9a28b6d7-e5e3-4141-92c8-ec9da0dd7b3d","actor_username":"pivovarova.a.v@zakupka.pro","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}	2025-10-29 14:00:52.102301+00	
00000000-0000-0000-0000-000000000000	bb12ab55-1ee7-41f3-927d-b973d75e3a53	{"action":"login","actor_id":"9a28b6d7-e5e3-4141-92c8-ec9da0dd7b3d","actor_username":"pivovarova.a.v@zakupka.pro","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-29 14:00:52.1064+00	
00000000-0000-0000-0000-000000000000	e8828497-fc20-4d76-924d-ed16c8e8528e	{"action":"token_refreshed","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-29 14:01:07.003069+00	
00000000-0000-0000-0000-000000000000	59665d6a-7704-4d32-bea4-f630b03e8c12	{"action":"token_revoked","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-29 14:01:07.003759+00	
00000000-0000-0000-0000-000000000000	86737550-afd9-4c20-a23e-740489ca2bbf	{"action":"login","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-29 14:19:45.588998+00	
00000000-0000-0000-0000-000000000000	2d71a1c6-3861-4ea3-89d0-accb2dc659e7	{"action":"token_refreshed","actor_id":"f8e5ca55-75fd-419d-a30c-42ffa125d9d9","actor_username":"alexeymoguev@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-29 15:01:43.8625+00	
00000000-0000-0000-0000-000000000000	1fda678d-e328-4abf-9a0e-d66c513e4c9d	{"action":"token_revoked","actor_id":"f8e5ca55-75fd-419d-a30c-42ffa125d9d9","actor_username":"alexeymoguev@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-29 15:01:43.882073+00	
00000000-0000-0000-0000-000000000000	2da53b0e-6257-4380-aa6d-37644c8e2b6a	{"action":"token_refreshed","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-29 15:06:11.94846+00	
00000000-0000-0000-0000-000000000000	0974a1be-62cf-460e-9830-adb51b6dd8f8	{"action":"token_revoked","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-29 15:06:11.957987+00	
00000000-0000-0000-0000-000000000000	d3e039c3-77b6-4a30-b94e-4d0cbbec44a0	{"action":"token_refreshed","actor_id":"112fd71d-fef9-4b4b-ad91-74f2fe211947","actor_username":"semina.a.v@su10.ru","actor_via_sso":false,"log_type":"token"}	2025-10-29 15:12:24.012976+00	
00000000-0000-0000-0000-000000000000	9b3675b0-befa-4729-af19-4ea4da830a41	{"action":"token_revoked","actor_id":"112fd71d-fef9-4b4b-ad91-74f2fe211947","actor_username":"semina.a.v@su10.ru","actor_via_sso":false,"log_type":"token"}	2025-10-29 15:12:24.015755+00	
00000000-0000-0000-0000-000000000000	fc8fc785-e158-47fa-95c5-72668beb94e8	{"action":"token_refreshed","actor_id":"f8e5ca55-75fd-419d-a30c-42ffa125d9d9","actor_username":"alexeymoguev@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-29 16:00:14.97971+00	
00000000-0000-0000-0000-000000000000	72461ae9-53d7-462a-9a3f-27960cc04783	{"action":"token_revoked","actor_id":"f8e5ca55-75fd-419d-a30c-42ffa125d9d9","actor_username":"alexeymoguev@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-29 16:00:14.989892+00	
00000000-0000-0000-0000-000000000000	8756a7f8-dcdb-4c3d-985f-7c4c2b8c2714	{"action":"token_refreshed","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-29 16:15:11.317718+00	
00000000-0000-0000-0000-000000000000	95d8dfeb-9f41-445a-a6e3-a81d2e54563c	{"action":"token_revoked","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-29 16:15:11.325606+00	
00000000-0000-0000-0000-000000000000	bec7cdf9-31c4-4e08-bb99-61da819dce46	{"action":"token_refreshed","actor_id":"f8e5ca55-75fd-419d-a30c-42ffa125d9d9","actor_username":"alexeymoguev@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-29 17:00:41.74961+00	
00000000-0000-0000-0000-000000000000	04f6c82d-b27e-4baf-a7f9-2a963874cb9a	{"action":"token_revoked","actor_id":"f8e5ca55-75fd-419d-a30c-42ffa125d9d9","actor_username":"alexeymoguev@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-29 17:00:41.770656+00	
00000000-0000-0000-0000-000000000000	8c6e9c3f-389b-4b37-b716-54cb1a896d14	{"action":"user_signedup","actor_id":"32265ce5-8681-4ae5-99b1-2b81210e9522","actor_username":"muha.m.u@su10.ru","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}	2025-10-30 06:09:46.269336+00	
00000000-0000-0000-0000-000000000000	7ece422c-f779-4596-965a-45968d1ef914	{"action":"login","actor_id":"32265ce5-8681-4ae5-99b1-2b81210e9522","actor_username":"muha.m.u@su10.ru","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-30 06:09:46.307024+00	
00000000-0000-0000-0000-000000000000	aad41ad0-1b7b-4f46-8a2c-9a5c82d8724e	{"action":"token_refreshed","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-30 06:21:22.543809+00	
00000000-0000-0000-0000-000000000000	25252a49-94ed-4c37-8d64-57cd77229678	{"action":"token_revoked","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-30 06:21:22.563648+00	
00000000-0000-0000-0000-000000000000	eb8df6ac-028f-4f02-81a2-a63349f5afae	{"action":"token_refreshed","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-30 06:21:32.676114+00	
00000000-0000-0000-0000-000000000000	8db41a55-b5a8-4aa4-b232-2ed3ded91b45	{"action":"token_revoked","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-30 06:21:32.67759+00	
00000000-0000-0000-0000-000000000000	f37130bc-e58d-4189-9541-6319f0cbfdc5	{"action":"token_refreshed","actor_id":"f8e5ca55-75fd-419d-a30c-42ffa125d9d9","actor_username":"alexeymoguev@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-30 06:45:47.686331+00	
00000000-0000-0000-0000-000000000000	26978a70-fd26-4a89-ae67-e5fec7847fa5	{"action":"token_revoked","actor_id":"f8e5ca55-75fd-419d-a30c-42ffa125d9d9","actor_username":"alexeymoguev@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-30 06:45:47.706447+00	
00000000-0000-0000-0000-000000000000	5ac993ab-994e-4605-b8ea-046cb7156340	{"action":"token_refreshed","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-30 07:20:52.238566+00	
00000000-0000-0000-0000-000000000000	5325f007-7d9b-493b-8475-dc82dd795f5d	{"action":"token_revoked","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-30 07:20:52.244323+00	
00000000-0000-0000-0000-000000000000	7bfe0737-4319-4865-a0e4-829208985e30	{"action":"token_refreshed","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-30 07:20:57.29822+00	
00000000-0000-0000-0000-000000000000	79925421-5934-414a-9077-ce144462c81b	{"action":"token_revoked","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-30 07:20:57.299776+00	
00000000-0000-0000-0000-000000000000	50011c7a-7a1e-4224-8813-036e6c42d87d	{"action":"token_refreshed","actor_id":"f051acbc-190a-4ea5-bf1c-90bb1cd7a58c","actor_username":"shanin.r.a@su10.ru","actor_via_sso":false,"log_type":"token"}	2025-10-30 07:52:11.979591+00	
00000000-0000-0000-0000-000000000000	01e454ea-dab1-4151-9e61-329e7815e41f	{"action":"token_revoked","actor_id":"f051acbc-190a-4ea5-bf1c-90bb1cd7a58c","actor_username":"shanin.r.a@su10.ru","actor_via_sso":false,"log_type":"token"}	2025-10-30 07:52:11.998021+00	
00000000-0000-0000-0000-000000000000	004993ec-89a4-4dd0-b934-abc22ba4a6bc	{"action":"token_refreshed","actor_id":"f8e5ca55-75fd-419d-a30c-42ffa125d9d9","actor_username":"alexeymoguev@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-30 07:59:07.92577+00	
00000000-0000-0000-0000-000000000000	e27abe00-2b01-47ed-a0cb-87fbc5724e1e	{"action":"token_revoked","actor_id":"f8e5ca55-75fd-419d-a30c-42ffa125d9d9","actor_username":"alexeymoguev@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-30 07:59:07.937973+00	
00000000-0000-0000-0000-000000000000	f2cf7ac8-49dc-4c16-97d5-732faf673233	{"action":"token_refreshed","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-30 08:57:56.460549+00	
00000000-0000-0000-0000-000000000000	ca75a003-0d85-45ca-9ea3-b6b782dee995	{"action":"token_revoked","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-30 08:57:56.482117+00	
00000000-0000-0000-0000-000000000000	a1aea9b4-57ed-4e86-b518-2ef4c701cf81	{"action":"user_signedup","actor_id":"dde5c3c7-8368-4df9-b12b-160ff2cc02ab","actor_username":"odintsov.su10@gmail.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}	2025-10-30 09:12:43.809551+00	
00000000-0000-0000-0000-000000000000	ebe54d7d-56a0-4cc6-9d4d-7bd527227f64	{"action":"login","actor_id":"dde5c3c7-8368-4df9-b12b-160ff2cc02ab","actor_username":"odintsov.su10@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-30 09:12:43.846021+00	
00000000-0000-0000-0000-000000000000	f6a00a88-bb1c-4613-a897-06d37bd7de2c	{"action":"token_refreshed","actor_id":"f8e5ca55-75fd-419d-a30c-42ffa125d9d9","actor_username":"alexeymoguev@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-30 09:15:29.077646+00	
00000000-0000-0000-0000-000000000000	b8fecbfb-52ef-4509-8250-e87a06d8a5ce	{"action":"token_revoked","actor_id":"f8e5ca55-75fd-419d-a30c-42ffa125d9d9","actor_username":"alexeymoguev@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-30 09:15:29.080239+00	
00000000-0000-0000-0000-000000000000	4106c698-b0b4-4856-95a5-bc4e267db36f	{"action":"token_refreshed","actor_id":"f051acbc-190a-4ea5-bf1c-90bb1cd7a58c","actor_username":"shanin.r.a@su10.ru","actor_via_sso":false,"log_type":"token"}	2025-10-30 09:21:35.254537+00	
00000000-0000-0000-0000-000000000000	7c1a6798-801f-4c4f-9b7d-a74dcc1e3a00	{"action":"token_revoked","actor_id":"f051acbc-190a-4ea5-bf1c-90bb1cd7a58c","actor_username":"shanin.r.a@su10.ru","actor_via_sso":false,"log_type":"token"}	2025-10-30 09:21:35.274413+00	
00000000-0000-0000-0000-000000000000	a2cc5fa9-831c-4e7d-932c-fea49b4b8dd9	{"action":"token_refreshed","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-30 09:25:42.745554+00	
00000000-0000-0000-0000-000000000000	de3ffc70-58d0-4e7d-8716-a70eee1190c3	{"action":"token_revoked","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-30 09:25:42.748648+00	
00000000-0000-0000-0000-000000000000	a2aaeea3-b4eb-4e77-85da-c5ebefa5dd06	{"action":"token_refreshed","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-30 09:58:51.681214+00	
00000000-0000-0000-0000-000000000000	d3de1914-755b-46ca-8fc4-210a1717d7da	{"action":"token_revoked","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-30 09:58:51.702087+00	
00000000-0000-0000-0000-000000000000	76e205b9-2ab1-4fc8-b10a-fb7f434eb977	{"action":"token_refreshed","actor_id":"dde5c3c7-8368-4df9-b12b-160ff2cc02ab","actor_username":"odintsov.su10@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-30 10:33:14.804278+00	
00000000-0000-0000-0000-000000000000	6db5b4a6-96bc-4f72-b92a-2a980ef0833c	{"action":"token_revoked","actor_id":"dde5c3c7-8368-4df9-b12b-160ff2cc02ab","actor_username":"odintsov.su10@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-30 10:33:14.813563+00	
00000000-0000-0000-0000-000000000000	327556b3-a77a-46b7-8489-3fce6e16290b	{"action":"token_refreshed","actor_id":"f8e5ca55-75fd-419d-a30c-42ffa125d9d9","actor_username":"alexeymoguev@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-30 10:43:13.315969+00	
00000000-0000-0000-0000-000000000000	50914dc5-cb79-4d6d-adfc-4371a4570dd9	{"action":"token_revoked","actor_id":"f8e5ca55-75fd-419d-a30c-42ffa125d9d9","actor_username":"alexeymoguev@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-30 10:43:13.329458+00	
00000000-0000-0000-0000-000000000000	4a937aaa-45a4-49af-8136-7ca0ea16e5ea	{"action":"token_refreshed","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-30 10:57:03.050791+00	
00000000-0000-0000-0000-000000000000	b740b4b4-0116-4ea2-89d5-0518af91f444	{"action":"token_revoked","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-30 10:57:03.0704+00	
00000000-0000-0000-0000-000000000000	ec0b0d90-bd3e-4106-9825-1679915dede2	{"action":"user_signedup","actor_id":"756adb06-f2d7-4113-9739-779afbd69643","actor_username":"karaseni.n.d@zakupka.pro","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}	2025-10-30 11:27:43.579419+00	
00000000-0000-0000-0000-000000000000	22eccfeb-85d1-456a-b3e9-de84d88f7b3e	{"action":"login","actor_id":"756adb06-f2d7-4113-9739-779afbd69643","actor_username":"karaseni.n.d@zakupka.pro","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-30 11:27:43.601668+00	
00000000-0000-0000-0000-000000000000	ffb07d5e-9b46-466d-99c6-03dcb1c9c3c5	{"action":"token_refreshed","actor_id":"f8e5ca55-75fd-419d-a30c-42ffa125d9d9","actor_username":"alexeymoguev@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-30 11:49:17.171979+00	
00000000-0000-0000-0000-000000000000	3dcff098-657c-4fd0-8fba-ea8a4635f97b	{"action":"token_revoked","actor_id":"f8e5ca55-75fd-419d-a30c-42ffa125d9d9","actor_username":"alexeymoguev@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-30 11:49:17.181316+00	
00000000-0000-0000-0000-000000000000	2dde7404-e1a6-4ae0-bb8a-417078e555db	{"action":"token_refreshed","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-30 11:59:32.585582+00	
00000000-0000-0000-0000-000000000000	a65195e0-3694-41ce-8fad-e735724de991	{"action":"token_revoked","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-30 11:59:32.593222+00	
00000000-0000-0000-0000-000000000000	a306dcf5-690d-4ee5-9a55-6e1fdb43259b	{"action":"token_refreshed","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-30 12:06:24.868982+00	
00000000-0000-0000-0000-000000000000	7744dce3-7a11-4006-8ebf-8fb162638f28	{"action":"token_revoked","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-30 12:06:24.872631+00	
00000000-0000-0000-0000-000000000000	dc49cef1-3458-403e-bb48-38696f6c65d3	{"action":"user_signedup","actor_id":"adea9c9c-2d73-45b4-a801-e576e0b57f74","actor_username":"bondaruk.g.a@mstroy.pro","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}	2025-10-30 12:27:37.907642+00	
00000000-0000-0000-0000-000000000000	56c4e5a6-9e52-4c6f-beed-778e265a7b81	{"action":"login","actor_id":"adea9c9c-2d73-45b4-a801-e576e0b57f74","actor_username":"bondaruk.g.a@mstroy.pro","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-30 12:27:37.924583+00	
00000000-0000-0000-0000-000000000000	2b8b8554-5451-4836-b2de-7a77acd198c7	{"action":"user_signedup","actor_id":"d8c1330a-ae1a-407a-ad2c-897ab85102dd","actor_username":"999@mail.ru","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}	2025-10-30 12:36:05.197616+00	
00000000-0000-0000-0000-000000000000	9610680e-6d0d-4e15-8652-ac4db592668e	{"action":"login","actor_id":"d8c1330a-ae1a-407a-ad2c-897ab85102dd","actor_username":"999@mail.ru","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-30 12:36:05.215927+00	
00000000-0000-0000-0000-000000000000	589d815a-30a9-4055-acb0-583d9ab620a4	{"action":"token_refreshed","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-30 13:52:53.10498+00	
00000000-0000-0000-0000-000000000000	54342424-51a3-4679-b81e-55f68685ef1c	{"action":"token_revoked","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-30 13:52:53.128803+00	
00000000-0000-0000-0000-000000000000	30225c25-16b6-4b64-a6b1-69bdecf966aa	{"action":"login","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-30 14:24:30.243417+00	
00000000-0000-0000-0000-000000000000	0f5a56b0-f40d-4891-9c86-44edcbaf23f0	{"action":"token_refreshed","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-30 14:46:50.654327+00	
00000000-0000-0000-0000-000000000000	2e53baa7-f6d1-4f81-8fe4-613af6f55200	{"action":"token_revoked","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-30 14:46:50.672127+00	
00000000-0000-0000-0000-000000000000	9f6a8210-f2cc-41e4-b12c-56a12e095664	{"action":"token_refreshed","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-30 14:51:52.089286+00	
00000000-0000-0000-0000-000000000000	3fc8e3a1-a2c7-42a9-afdf-53d1169c9439	{"action":"token_revoked","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-30 14:51:52.090841+00	
00000000-0000-0000-0000-000000000000	af340c6e-7490-462a-a409-a7d9be3a2e17	{"action":"user_signedup","actor_id":"98b67609-9822-4cb9-b2ed-14e3034c8559","actor_username":"admin@test.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}	2025-10-30 15:28:32.68361+00	
00000000-0000-0000-0000-000000000000	f5dd9364-700f-469c-bf89-c371ee035dc3	{"action":"login","actor_id":"98b67609-9822-4cb9-b2ed-14e3034c8559","actor_username":"admin@test.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-30 15:28:32.70334+00	
00000000-0000-0000-0000-000000000000	3d6dc8b1-9aa8-4616-b9b5-3b012689253f	{"action":"token_refreshed","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-30 15:50:08.167184+00	
00000000-0000-0000-0000-000000000000	64c04b62-e278-415f-b23e-b762c5d551be	{"action":"token_revoked","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-30 15:50:08.187341+00	
00000000-0000-0000-0000-000000000000	55886d3b-faba-4211-b6aa-62dd1ebbadb1	{"action":"token_refreshed","actor_id":"98b67609-9822-4cb9-b2ed-14e3034c8559","actor_username":"admin@test.com","actor_via_sso":false,"log_type":"token"}	2025-10-30 16:26:59.139914+00	
00000000-0000-0000-0000-000000000000	fed09045-0083-42d1-a072-1402fa05d184	{"action":"token_revoked","actor_id":"98b67609-9822-4cb9-b2ed-14e3034c8559","actor_username":"admin@test.com","actor_via_sso":false,"log_type":"token"}	2025-10-30 16:26:59.14943+00	
00000000-0000-0000-0000-000000000000	fb30016f-2fa5-480d-91f3-c7416e411af9	{"action":"token_refreshed","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-30 16:48:34.934901+00	
00000000-0000-0000-0000-000000000000	43e06efd-ec78-4576-84fa-8a4da76f181d	{"action":"token_revoked","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-30 16:48:34.952067+00	
00000000-0000-0000-0000-000000000000	28e2d9d2-80c8-4af4-86df-f11aeab913a5	{"action":"token_refreshed","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-30 17:09:03.45582+00	
00000000-0000-0000-0000-000000000000	a125d6f4-9729-4424-9cdc-6f43bd5988e0	{"action":"token_revoked","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-30 17:09:03.472453+00	
00000000-0000-0000-0000-000000000000	7f119f89-c2c3-4e13-a092-75a3ef747d98	{"action":"token_refreshed","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-30 17:19:19.629834+00	
00000000-0000-0000-0000-000000000000	069008d0-ca2c-47ca-8967-f1d654a49e38	{"action":"token_revoked","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-30 17:19:19.642989+00	
00000000-0000-0000-0000-000000000000	1feedd11-ab70-4d0e-9fb9-2af44d252282	{"action":"logout","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-10-30 17:21:36.882531+00	
00000000-0000-0000-0000-000000000000	5565de72-0aee-428e-b534-8e934c962961	{"action":"login","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-30 17:21:46.410645+00	
00000000-0000-0000-0000-000000000000	2a89f844-8409-4abd-92ca-1a1ad2506226	{"action":"token_refreshed","actor_id":"98b67609-9822-4cb9-b2ed-14e3034c8559","actor_username":"admin@test.com","actor_via_sso":false,"log_type":"token"}	2025-10-30 17:25:28.951978+00	
00000000-0000-0000-0000-000000000000	315e3580-e7a8-442c-9cf7-bf0f37660b60	{"action":"token_revoked","actor_id":"98b67609-9822-4cb9-b2ed-14e3034c8559","actor_username":"admin@test.com","actor_via_sso":false,"log_type":"token"}	2025-10-30 17:25:28.95761+00	
00000000-0000-0000-0000-000000000000	8b237559-41f4-46a9-ab14-f658051b9cde	{"action":"login","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-30 17:25:38.481784+00	
00000000-0000-0000-0000-000000000000	d93cefd3-9d65-4ff4-adf1-f87431306e76	{"action":"login","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-30 17:27:52.752203+00	
00000000-0000-0000-0000-000000000000	788bd568-4161-4026-a69e-452f87711b72	{"action":"login","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-30 17:51:46.547352+00	
00000000-0000-0000-0000-000000000000	6b4912c5-d42b-4fa9-a84a-b5c4ba7335aa	{"action":"token_refreshed","actor_id":"98b67609-9822-4cb9-b2ed-14e3034c8559","actor_username":"admin@test.com","actor_via_sso":false,"log_type":"token"}	2025-10-30 18:23:59.09665+00	
00000000-0000-0000-0000-000000000000	1b603dbb-13e3-4784-8944-a6b39986f2d4	{"action":"token_revoked","actor_id":"98b67609-9822-4cb9-b2ed-14e3034c8559","actor_username":"admin@test.com","actor_via_sso":false,"log_type":"token"}	2025-10-30 18:23:59.129577+00	
00000000-0000-0000-0000-000000000000	66147c7a-27bf-489a-8d7d-f389c5927f43	{"action":"token_refreshed","actor_id":"98b67609-9822-4cb9-b2ed-14e3034c8559","actor_username":"admin@test.com","actor_via_sso":false,"log_type":"token"}	2025-10-30 19:22:29.006836+00	
00000000-0000-0000-0000-000000000000	06c65093-a5b6-4795-bdb6-1eca92618b02	{"action":"token_revoked","actor_id":"98b67609-9822-4cb9-b2ed-14e3034c8559","actor_username":"admin@test.com","actor_via_sso":false,"log_type":"token"}	2025-10-30 19:22:29.017956+00	
00000000-0000-0000-0000-000000000000	83a902e8-5f92-4f7c-8544-3f80b432cb93	{"action":"token_refreshed","actor_id":"98b67609-9822-4cb9-b2ed-14e3034c8559","actor_username":"admin@test.com","actor_via_sso":false,"log_type":"token"}	2025-10-30 20:20:59.259126+00	
00000000-0000-0000-0000-000000000000	75660814-bd82-465d-838f-9ddb5b9e662f	{"action":"token_revoked","actor_id":"98b67609-9822-4cb9-b2ed-14e3034c8559","actor_username":"admin@test.com","actor_via_sso":false,"log_type":"token"}	2025-10-30 20:20:59.288485+00	
00000000-0000-0000-0000-000000000000	682e42a2-1f5f-4b65-9269-54f9498c0e5c	{"action":"token_refreshed","actor_id":"98b67609-9822-4cb9-b2ed-14e3034c8559","actor_username":"admin@test.com","actor_via_sso":false,"log_type":"token"}	2025-10-30 21:19:28.978598+00	
00000000-0000-0000-0000-000000000000	56d62d58-517a-403e-883a-67c73465125e	{"action":"token_revoked","actor_id":"98b67609-9822-4cb9-b2ed-14e3034c8559","actor_username":"admin@test.com","actor_via_sso":false,"log_type":"token"}	2025-10-30 21:19:28.987937+00	
00000000-0000-0000-0000-000000000000	06231574-9076-4c37-bc8c-28e46fcce64b	{"action":"token_refreshed","actor_id":"98b67609-9822-4cb9-b2ed-14e3034c8559","actor_username":"admin@test.com","actor_via_sso":false,"log_type":"token"}	2025-10-30 22:17:59.012252+00	
00000000-0000-0000-0000-000000000000	20f3a333-016d-42be-b8f9-9e86d67984cd	{"action":"token_revoked","actor_id":"98b67609-9822-4cb9-b2ed-14e3034c8559","actor_username":"admin@test.com","actor_via_sso":false,"log_type":"token"}	2025-10-30 22:17:59.026279+00	
00000000-0000-0000-0000-000000000000	3f72007b-4c21-4d17-97fb-2bc0e22675cc	{"action":"token_refreshed","actor_id":"98b67609-9822-4cb9-b2ed-14e3034c8559","actor_username":"admin@test.com","actor_via_sso":false,"log_type":"token"}	2025-10-30 23:16:28.879318+00	
00000000-0000-0000-0000-000000000000	ade6f45c-defd-4667-944b-db22c45df9ee	{"action":"token_revoked","actor_id":"98b67609-9822-4cb9-b2ed-14e3034c8559","actor_username":"admin@test.com","actor_via_sso":false,"log_type":"token"}	2025-10-30 23:16:28.893428+00	
00000000-0000-0000-0000-000000000000	d6af4525-1e3b-4017-a04a-9361ea8e17fb	{"action":"token_refreshed","actor_id":"98b67609-9822-4cb9-b2ed-14e3034c8559","actor_username":"admin@test.com","actor_via_sso":false,"log_type":"token"}	2025-10-31 00:14:58.989006+00	
00000000-0000-0000-0000-000000000000	58ec0d0e-16e2-4bbe-a4cc-92b615de0d9a	{"action":"token_revoked","actor_id":"98b67609-9822-4cb9-b2ed-14e3034c8559","actor_username":"admin@test.com","actor_via_sso":false,"log_type":"token"}	2025-10-31 00:14:59.006777+00	
00000000-0000-0000-0000-000000000000	2ca53f55-4bf2-46b0-85ff-606e6edb3292	{"action":"token_refreshed","actor_id":"98b67609-9822-4cb9-b2ed-14e3034c8559","actor_username":"admin@test.com","actor_via_sso":false,"log_type":"token"}	2025-10-31 01:13:28.917751+00	
00000000-0000-0000-0000-000000000000	ed08425a-5d7a-4e5f-a4c8-0765c7d0825a	{"action":"token_revoked","actor_id":"98b67609-9822-4cb9-b2ed-14e3034c8559","actor_username":"admin@test.com","actor_via_sso":false,"log_type":"token"}	2025-10-31 01:13:28.930805+00	
00000000-0000-0000-0000-000000000000	21968410-1e85-4054-b745-1228b0231b96	{"action":"token_refreshed","actor_id":"98b67609-9822-4cb9-b2ed-14e3034c8559","actor_username":"admin@test.com","actor_via_sso":false,"log_type":"token"}	2025-10-31 02:11:58.884275+00	
00000000-0000-0000-0000-000000000000	5d2e3e95-1dbb-4542-b6fe-9387a3dfa9d8	{"action":"token_revoked","actor_id":"98b67609-9822-4cb9-b2ed-14e3034c8559","actor_username":"admin@test.com","actor_via_sso":false,"log_type":"token"}	2025-10-31 02:11:58.909898+00	
00000000-0000-0000-0000-000000000000	cda1e7b0-e989-48b6-9736-e0314c82c394	{"action":"token_refreshed","actor_id":"98b67609-9822-4cb9-b2ed-14e3034c8559","actor_username":"admin@test.com","actor_via_sso":false,"log_type":"token"}	2025-10-31 03:10:28.818462+00	
00000000-0000-0000-0000-000000000000	cc78f067-9224-4bfa-b04f-fde678f1ce59	{"action":"token_revoked","actor_id":"98b67609-9822-4cb9-b2ed-14e3034c8559","actor_username":"admin@test.com","actor_via_sso":false,"log_type":"token"}	2025-10-31 03:10:28.829189+00	
00000000-0000-0000-0000-000000000000	5cf09780-df18-44ea-8e97-2bf117bea694	{"action":"token_refreshed","actor_id":"98b67609-9822-4cb9-b2ed-14e3034c8559","actor_username":"admin@test.com","actor_via_sso":false,"log_type":"token"}	2025-10-31 04:08:58.749436+00	
00000000-0000-0000-0000-000000000000	5f1ac4f0-0641-41b9-a890-9adc1b74484e	{"action":"token_revoked","actor_id":"98b67609-9822-4cb9-b2ed-14e3034c8559","actor_username":"admin@test.com","actor_via_sso":false,"log_type":"token"}	2025-10-31 04:08:58.766394+00	
00000000-0000-0000-0000-000000000000	8f99de83-2c4b-43a4-a499-99fb72d8c0b8	{"action":"token_refreshed","actor_id":"310087c1-ef51-4c13-9f65-e581845313fe","actor_username":"kazubov.a.a@su10.ru","actor_via_sso":false,"log_type":"token"}	2025-10-31 04:45:59.306548+00	
00000000-0000-0000-0000-000000000000	42678183-c087-4bd3-ab2e-949ce57dadef	{"action":"token_revoked","actor_id":"310087c1-ef51-4c13-9f65-e581845313fe","actor_username":"kazubov.a.a@su10.ru","actor_via_sso":false,"log_type":"token"}	2025-10-31 04:45:59.327357+00	
00000000-0000-0000-0000-000000000000	8f6d2acb-f4eb-4bbb-87f3-0a6409365411	{"action":"token_refreshed","actor_id":"7d3d3502-7204-4aee-87da-1fdcbdbba8ad","actor_username":"korneichik.k.a@su10.ru","actor_via_sso":false,"log_type":"token"}	2025-10-31 04:48:06.943299+00	
00000000-0000-0000-0000-000000000000	db37bdea-d475-41f2-8a21-7e83c8deba6c	{"action":"token_revoked","actor_id":"7d3d3502-7204-4aee-87da-1fdcbdbba8ad","actor_username":"korneichik.k.a@su10.ru","actor_via_sso":false,"log_type":"token"}	2025-10-31 04:48:06.944568+00	
00000000-0000-0000-0000-000000000000	67a21f4a-93fe-438a-9799-ee11fd815d24	{"action":"token_refreshed","actor_id":"98b67609-9822-4cb9-b2ed-14e3034c8559","actor_username":"admin@test.com","actor_via_sso":false,"log_type":"token"}	2025-10-31 05:07:28.801443+00	
00000000-0000-0000-0000-000000000000	72870157-313c-47d8-9b00-78b16adba38f	{"action":"token_revoked","actor_id":"98b67609-9822-4cb9-b2ed-14e3034c8559","actor_username":"admin@test.com","actor_via_sso":false,"log_type":"token"}	2025-10-31 05:07:28.818421+00	
00000000-0000-0000-0000-000000000000	46db66fa-c507-4898-acd1-8047a420e446	{"action":"token_refreshed","actor_id":"adea9c9c-2d73-45b4-a801-e576e0b57f74","actor_username":"bondaruk.g.a@mstroy.pro","actor_via_sso":false,"log_type":"token"}	2025-10-31 05:11:20.359708+00	
00000000-0000-0000-0000-000000000000	401ce343-2772-4840-95f7-adad983201eb	{"action":"token_revoked","actor_id":"adea9c9c-2d73-45b4-a801-e576e0b57f74","actor_username":"bondaruk.g.a@mstroy.pro","actor_via_sso":false,"log_type":"token"}	2025-10-31 05:11:20.361849+00	
00000000-0000-0000-0000-000000000000	d910a407-aa34-4143-8046-c21eff02d1c5	{"action":"token_refreshed","actor_id":"310087c1-ef51-4c13-9f65-e581845313fe","actor_username":"kazubov.a.a@su10.ru","actor_via_sso":false,"log_type":"token"}	2025-10-31 05:44:01.449433+00	
00000000-0000-0000-0000-000000000000	a03c28ff-a5ab-4174-aa84-7e969bcffa76	{"action":"token_revoked","actor_id":"310087c1-ef51-4c13-9f65-e581845313fe","actor_username":"kazubov.a.a@su10.ru","actor_via_sso":false,"log_type":"token"}	2025-10-31 05:44:01.462337+00	
00000000-0000-0000-0000-000000000000	231c74e3-ab69-4c2c-8e21-7946d21885ea	{"action":"token_refreshed","actor_id":"98b67609-9822-4cb9-b2ed-14e3034c8559","actor_username":"admin@test.com","actor_via_sso":false,"log_type":"token"}	2025-10-31 06:05:58.641962+00	
00000000-0000-0000-0000-000000000000	b4068949-3595-4079-974a-77c785d93be9	{"action":"token_revoked","actor_id":"98b67609-9822-4cb9-b2ed-14e3034c8559","actor_username":"admin@test.com","actor_via_sso":false,"log_type":"token"}	2025-10-31 06:05:58.650208+00	
00000000-0000-0000-0000-000000000000	5a5eee4d-d3bd-4129-b55f-06d8af92ec17	{"action":"token_refreshed","actor_id":"adea9c9c-2d73-45b4-a801-e576e0b57f74","actor_username":"bondaruk.g.a@mstroy.pro","actor_via_sso":false,"log_type":"token"}	2025-10-31 06:10:28.595142+00	
00000000-0000-0000-0000-000000000000	5107de1a-419f-4974-a687-26dfea9e3203	{"action":"token_revoked","actor_id":"adea9c9c-2d73-45b4-a801-e576e0b57f74","actor_username":"bondaruk.g.a@mstroy.pro","actor_via_sso":false,"log_type":"token"}	2025-10-31 06:10:28.603336+00	
00000000-0000-0000-0000-000000000000	80f89114-96d6-4ab1-80d0-ef8ac0886484	{"action":"user_signedup","actor_id":"e96e699e-647d-4132-b8b5-e10db8e01021","actor_username":"kuzmin.a.a@su10.ru","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}	2025-10-31 06:26:19.483939+00	
00000000-0000-0000-0000-000000000000	6435713d-74af-49f1-90ec-c7d035b3b962	{"action":"login","actor_id":"e96e699e-647d-4132-b8b5-e10db8e01021","actor_username":"kuzmin.a.a@su10.ru","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-31 06:26:19.503617+00	
00000000-0000-0000-0000-000000000000	a108664c-357c-4d71-8255-75a1b89b4c62	{"action":"token_refreshed","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-31 06:27:34.570604+00	
00000000-0000-0000-0000-000000000000	d5e1f6b9-f2a6-4395-9bc0-8ffb02b64f28	{"action":"token_revoked","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-31 06:27:34.571709+00	
00000000-0000-0000-0000-000000000000	0d76e5aa-697f-499c-8966-0cc0616c2ab3	{"action":"token_refreshed","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-31 06:27:48.934653+00	
00000000-0000-0000-0000-000000000000	98eb1341-d805-4f05-9b0d-1f34c6bc3d3c	{"action":"token_revoked","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-31 06:27:48.935742+00	
00000000-0000-0000-0000-000000000000	7e2331d5-7d4a-430d-a82c-8bfb544a63da	{"action":"login","actor_id":"990cf9a6-88ab-465c-a280-b51c0467aeb9","actor_username":"postoev.e.v@su10.ru","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-31 06:28:46.563323+00	
00000000-0000-0000-0000-000000000000	761473b9-b8ea-4a70-8ebd-e1b701fa7bad	{"action":"token_refreshed","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-31 06:36:15.028177+00	
00000000-0000-0000-0000-000000000000	27ad75b9-a39a-4d21-a1fc-882f37a68ea4	{"action":"token_revoked","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-31 06:36:15.036456+00	
00000000-0000-0000-0000-000000000000	9042b95d-476c-4e60-8a00-cae4968d7b0d	{"action":"user_signedup","actor_id":"f31006f1-ab3e-44e9-a0ae-27d0bfa53ac4","actor_username":"popov.a.n@su10.ru","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}	2025-10-31 06:42:32.075394+00	
00000000-0000-0000-0000-000000000000	0526a1f1-5472-43c3-9cf0-59a8a0fb756b	{"action":"login","actor_id":"f31006f1-ab3e-44e9-a0ae-27d0bfa53ac4","actor_username":"popov.a.n@su10.ru","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-31 06:42:32.084181+00	
00000000-0000-0000-0000-000000000000	72ba83cb-bea7-428c-8034-967e001f6928	{"action":"token_refreshed","actor_id":"98b67609-9822-4cb9-b2ed-14e3034c8559","actor_username":"admin@test.com","actor_via_sso":false,"log_type":"token"}	2025-10-31 07:04:28.743576+00	
00000000-0000-0000-0000-000000000000	cb914459-c711-4e19-88bb-1e0c56c19d48	{"action":"token_revoked","actor_id":"98b67609-9822-4cb9-b2ed-14e3034c8559","actor_username":"admin@test.com","actor_via_sso":false,"log_type":"token"}	2025-10-31 07:04:28.76873+00	
00000000-0000-0000-0000-000000000000	b5659e43-560a-499d-be01-866d2d3f5a14	{"action":"token_refreshed","actor_id":"f051acbc-190a-4ea5-bf1c-90bb1cd7a58c","actor_username":"shanin.r.a@su10.ru","actor_via_sso":false,"log_type":"token"}	2025-10-31 07:17:45.416924+00	
00000000-0000-0000-0000-000000000000	1fc61b6d-fd9c-403f-92f6-643d001a25ef	{"action":"token_revoked","actor_id":"f051acbc-190a-4ea5-bf1c-90bb1cd7a58c","actor_username":"shanin.r.a@su10.ru","actor_via_sso":false,"log_type":"token"}	2025-10-31 07:17:45.430739+00	
00000000-0000-0000-0000-000000000000	8d403e5e-6324-4beb-a1ea-0849f8b0db8e	{"action":"token_refreshed","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-31 07:39:51.662389+00	
00000000-0000-0000-0000-000000000000	26a1b649-0802-4da2-bfda-dfd551f58c4e	{"action":"token_revoked","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-31 07:39:51.675854+00	
00000000-0000-0000-0000-000000000000	42355072-65fe-4903-aa45-6d23b3d77eb2	{"action":"token_refreshed","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-31 07:46:40.219608+00	
00000000-0000-0000-0000-000000000000	1fe6b31e-03a7-4468-b306-ef103012b01a	{"action":"token_revoked","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-31 07:46:40.223987+00	
00000000-0000-0000-0000-000000000000	f54b82c9-5f38-4b93-b469-0eadb4110708	{"action":"login","actor_id":"990cf9a6-88ab-465c-a280-b51c0467aeb9","actor_username":"postoev.e.v@su10.ru","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-31 07:58:33.674177+00	
00000000-0000-0000-0000-000000000000	2aed3b86-22c3-4f96-9e05-4c9dfc161f5c	{"action":"token_refreshed","actor_id":"98b67609-9822-4cb9-b2ed-14e3034c8559","actor_username":"admin@test.com","actor_via_sso":false,"log_type":"token"}	2025-10-31 08:02:58.588311+00	
00000000-0000-0000-0000-000000000000	d98958da-fcf1-4b9a-9b90-ba67a61b0089	{"action":"token_revoked","actor_id":"98b67609-9822-4cb9-b2ed-14e3034c8559","actor_username":"admin@test.com","actor_via_sso":false,"log_type":"token"}	2025-10-31 08:02:58.60449+00	
00000000-0000-0000-0000-000000000000	7309abb7-d243-4723-9566-df4e0344ccfc	{"action":"token_refreshed","actor_id":"7d3d3502-7204-4aee-87da-1fdcbdbba8ad","actor_username":"korneichik.k.a@su10.ru","actor_via_sso":false,"log_type":"token"}	2025-10-31 08:27:49.185573+00	
00000000-0000-0000-0000-000000000000	bce69810-9899-4bdf-8d2d-e428cbeaf770	{"action":"token_revoked","actor_id":"7d3d3502-7204-4aee-87da-1fdcbdbba8ad","actor_username":"korneichik.k.a@su10.ru","actor_via_sso":false,"log_type":"token"}	2025-10-31 08:27:49.20117+00	
00000000-0000-0000-0000-000000000000	b9721c7c-2e40-4eae-91fa-80bdf3a7dcc3	{"action":"token_refreshed","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-31 08:51:06.754202+00	
00000000-0000-0000-0000-000000000000	9fd81bc8-c6a1-4dfa-89ca-e8827ed95155	{"action":"token_revoked","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-31 08:51:06.772481+00	
00000000-0000-0000-0000-000000000000	4f3004bf-130a-475f-b95a-02958ff3835c	{"action":"token_refreshed","actor_id":"98b67609-9822-4cb9-b2ed-14e3034c8559","actor_username":"admin@test.com","actor_via_sso":false,"log_type":"token"}	2025-10-31 09:01:28.581347+00	
00000000-0000-0000-0000-000000000000	8769b4b4-fdd4-4f4c-979b-c2ed13e17ce2	{"action":"token_revoked","actor_id":"98b67609-9822-4cb9-b2ed-14e3034c8559","actor_username":"admin@test.com","actor_via_sso":false,"log_type":"token"}	2025-10-31 09:01:28.587712+00	
00000000-0000-0000-0000-000000000000	67bb9f28-ca68-4ec3-bb52-4c3466303f3f	{"action":"token_refreshed","actor_id":"310087c1-ef51-4c13-9f65-e581845313fe","actor_username":"kazubov.a.a@su10.ru","actor_via_sso":false,"log_type":"token"}	2025-10-31 09:06:00.119961+00	
00000000-0000-0000-0000-000000000000	370bf454-1ba0-4810-a78c-98970575ba26	{"action":"token_revoked","actor_id":"310087c1-ef51-4c13-9f65-e581845313fe","actor_username":"kazubov.a.a@su10.ru","actor_via_sso":false,"log_type":"token"}	2025-10-31 09:06:00.132724+00	
00000000-0000-0000-0000-000000000000	cd8f9784-8a48-477c-aeb8-2fcb128b62d8	{"action":"token_refreshed","actor_id":"990cf9a6-88ab-465c-a280-b51c0467aeb9","actor_username":"postoev.e.v@su10.ru","actor_via_sso":false,"log_type":"token"}	2025-10-31 09:12:22.71745+00	
00000000-0000-0000-0000-000000000000	0d17ed58-6e10-49c8-be2f-4b913d47db75	{"action":"token_revoked","actor_id":"990cf9a6-88ab-465c-a280-b51c0467aeb9","actor_username":"postoev.e.v@su10.ru","actor_via_sso":false,"log_type":"token"}	2025-10-31 09:12:22.724778+00	
00000000-0000-0000-0000-000000000000	fb9c7d55-8519-44ae-a60a-991cf0eae79f	{"action":"token_refreshed","actor_id":"7d3d3502-7204-4aee-87da-1fdcbdbba8ad","actor_username":"korneichik.k.a@su10.ru","actor_via_sso":false,"log_type":"token"}	2025-10-31 09:36:57.481578+00	
00000000-0000-0000-0000-000000000000	e3a30c70-558b-4505-a7f4-8a781715c0c8	{"action":"token_revoked","actor_id":"7d3d3502-7204-4aee-87da-1fdcbdbba8ad","actor_username":"korneichik.k.a@su10.ru","actor_via_sso":false,"log_type":"token"}	2025-10-31 09:36:57.48861+00	
00000000-0000-0000-0000-000000000000	c1d1222e-2d58-4581-95eb-00253240b7b6	{"action":"token_refreshed","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-31 09:51:29.585199+00	
00000000-0000-0000-0000-000000000000	c60b5284-a0cf-4e8b-8b21-951ded8f0f1b	{"action":"token_revoked","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-31 09:51:29.592038+00	
00000000-0000-0000-0000-000000000000	ef4a46e5-d0f1-48f5-a805-4daeac93bbb1	{"action":"token_refreshed","actor_id":"98b67609-9822-4cb9-b2ed-14e3034c8559","actor_username":"admin@test.com","actor_via_sso":false,"log_type":"token"}	2025-10-31 09:59:58.485075+00	
00000000-0000-0000-0000-000000000000	e1cacc65-9cc5-4983-be45-aefbce5398f9	{"action":"token_revoked","actor_id":"98b67609-9822-4cb9-b2ed-14e3034c8559","actor_username":"admin@test.com","actor_via_sso":false,"log_type":"token"}	2025-10-31 09:59:58.489459+00	
00000000-0000-0000-0000-000000000000	56a3f60e-825e-4969-afd1-102f5e616109	{"action":"token_refreshed","actor_id":"990cf9a6-88ab-465c-a280-b51c0467aeb9","actor_username":"postoev.e.v@su10.ru","actor_via_sso":false,"log_type":"token"}	2025-10-31 10:14:10.908761+00	
00000000-0000-0000-0000-000000000000	9aea0183-00a6-4a29-a479-ecd7954bcd37	{"action":"token_revoked","actor_id":"990cf9a6-88ab-465c-a280-b51c0467aeb9","actor_username":"postoev.e.v@su10.ru","actor_via_sso":false,"log_type":"token"}	2025-10-31 10:14:10.925291+00	
00000000-0000-0000-0000-000000000000	ff3a2244-a7ef-4a38-b9d3-8df9aeaacded	{"action":"token_refreshed","actor_id":"adea9c9c-2d73-45b4-a801-e576e0b57f74","actor_username":"bondaruk.g.a@mstroy.pro","actor_via_sso":false,"log_type":"token"}	2025-10-31 10:22:10.524845+00	
00000000-0000-0000-0000-000000000000	562cbd49-40a9-4e59-b6a2-624e752059b8	{"action":"token_revoked","actor_id":"adea9c9c-2d73-45b4-a801-e576e0b57f74","actor_username":"bondaruk.g.a@mstroy.pro","actor_via_sso":false,"log_type":"token"}	2025-10-31 10:22:10.531784+00	
00000000-0000-0000-0000-000000000000	28074d75-a9f2-42a6-99ca-0457492769dd	{"action":"token_refreshed","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-31 10:49:53.688844+00	
00000000-0000-0000-0000-000000000000	d4482d99-381d-41be-af27-ba7a8bc5ca7b	{"action":"token_revoked","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-31 10:49:53.706652+00	
00000000-0000-0000-0000-000000000000	35fa1f84-c301-4405-9b67-11ebefc1fcd6	{"action":"token_refreshed","actor_id":"98b67609-9822-4cb9-b2ed-14e3034c8559","actor_username":"admin@test.com","actor_via_sso":false,"log_type":"token"}	2025-10-31 10:58:28.509325+00	
00000000-0000-0000-0000-000000000000	df58f20d-56cb-4cfa-a038-8553c32ef71b	{"action":"token_revoked","actor_id":"98b67609-9822-4cb9-b2ed-14e3034c8559","actor_username":"admin@test.com","actor_via_sso":false,"log_type":"token"}	2025-10-31 10:58:28.52215+00	
00000000-0000-0000-0000-000000000000	d9e2a7dd-f6ce-4013-ad4e-08fde45fb1c4	{"action":"token_refreshed","actor_id":"990cf9a6-88ab-465c-a280-b51c0467aeb9","actor_username":"postoev.e.v@su10.ru","actor_via_sso":false,"log_type":"token"}	2025-10-31 11:12:15.53257+00	
00000000-0000-0000-0000-000000000000	89ae81d9-d47e-4c82-b1a7-a8102e8869fb	{"action":"token_revoked","actor_id":"990cf9a6-88ab-465c-a280-b51c0467aeb9","actor_username":"postoev.e.v@su10.ru","actor_via_sso":false,"log_type":"token"}	2025-10-31 11:12:15.534505+00	
00000000-0000-0000-0000-000000000000	9235d5de-d7a6-4f1f-9747-5649d294f700	{"action":"token_refreshed","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-31 11:48:38.042527+00	
00000000-0000-0000-0000-000000000000	44d1e344-a65d-4906-bf88-6b199b6609cb	{"action":"token_revoked","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-31 11:48:38.05694+00	
00000000-0000-0000-0000-000000000000	df4aa044-f188-4e9d-966e-dc266e9ea764	{"action":"token_refreshed","actor_id":"98b67609-9822-4cb9-b2ed-14e3034c8559","actor_username":"admin@test.com","actor_via_sso":false,"log_type":"token"}	2025-10-31 11:56:58.395094+00	
00000000-0000-0000-0000-000000000000	a9e81078-4bac-49d1-8963-2458d136be58	{"action":"token_revoked","actor_id":"98b67609-9822-4cb9-b2ed-14e3034c8559","actor_username":"admin@test.com","actor_via_sso":false,"log_type":"token"}	2025-10-31 11:56:58.400142+00	
00000000-0000-0000-0000-000000000000	65dbf4bf-9e4f-4988-96ce-68a36d2f0136	{"action":"token_refreshed","actor_id":"990cf9a6-88ab-465c-a280-b51c0467aeb9","actor_username":"postoev.e.v@su10.ru","actor_via_sso":false,"log_type":"token"}	2025-10-31 12:11:05.376046+00	
00000000-0000-0000-0000-000000000000	ff9beb57-8fe2-4d56-badb-c608ac5535c2	{"action":"token_revoked","actor_id":"990cf9a6-88ab-465c-a280-b51c0467aeb9","actor_username":"postoev.e.v@su10.ru","actor_via_sso":false,"log_type":"token"}	2025-10-31 12:11:05.384383+00	
00000000-0000-0000-0000-000000000000	46d4f7ef-eaef-43ff-a131-281b2b08535d	{"action":"logout","actor_id":"990cf9a6-88ab-465c-a280-b51c0467aeb9","actor_username":"postoev.e.v@su10.ru","actor_via_sso":false,"log_type":"account"}	2025-10-31 12:13:19.69688+00	
00000000-0000-0000-0000-000000000000	ab6406ff-2e84-4f54-a6e5-8c2a7de2087f	{"action":"login","actor_id":"98b67609-9822-4cb9-b2ed-14e3034c8559","actor_username":"admin@test.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-31 12:13:36.512771+00	
00000000-0000-0000-0000-000000000000	b1b71462-6937-4381-8aab-3a4612fc54f5	{"action":"logout","actor_id":"98b67609-9822-4cb9-b2ed-14e3034c8559","actor_username":"admin@test.com","actor_via_sso":false,"log_type":"account"}	2025-10-31 12:13:53.885438+00	
00000000-0000-0000-0000-000000000000	b8365cbc-50bc-4d40-8600-d49b9dd14390	{"action":"login","actor_id":"98b67609-9822-4cb9-b2ed-14e3034c8559","actor_username":"admin@test.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-31 12:14:11.263992+00	
00000000-0000-0000-0000-000000000000	dd5db1ac-a83a-4b77-9af1-6f0d3891941c	{"action":"logout","actor_id":"98b67609-9822-4cb9-b2ed-14e3034c8559","actor_username":"admin@test.com","actor_via_sso":false,"log_type":"account"}	2025-10-31 12:17:31.118146+00	
00000000-0000-0000-0000-000000000000	3d5abf59-0eb6-47fd-8d6f-b9e72c960a0a	{"action":"login","actor_id":"98b67609-9822-4cb9-b2ed-14e3034c8559","actor_username":"admin@test.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-31 12:17:42.278311+00	
00000000-0000-0000-0000-000000000000	bf503438-e9f4-408b-9a24-f8d1bc70ccf3	{"action":"logout","actor_id":"98b67609-9822-4cb9-b2ed-14e3034c8559","actor_username":"admin@test.com","actor_via_sso":false,"log_type":"account"}	2025-10-31 12:17:52.795543+00	
00000000-0000-0000-0000-000000000000	b8c61796-e837-4f56-8e9f-d4b1f526c445	{"action":"login","actor_id":"98b67609-9822-4cb9-b2ed-14e3034c8559","actor_username":"admin@test.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-31 12:18:08.89684+00	
00000000-0000-0000-0000-000000000000	13afcb33-5769-4812-983d-a3a724f63005	{"action":"logout","actor_id":"98b67609-9822-4cb9-b2ed-14e3034c8559","actor_username":"admin@test.com","actor_via_sso":false,"log_type":"account"}	2025-10-31 12:20:41.175898+00	
00000000-0000-0000-0000-000000000000	c6204259-d2d8-45e4-b852-6981de87c16c	{"action":"login","actor_id":"98b67609-9822-4cb9-b2ed-14e3034c8559","actor_username":"admin@test.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-31 12:20:57.174285+00	
00000000-0000-0000-0000-000000000000	96711b71-3b63-409a-94e9-4260f15c8f94	{"action":"logout","actor_id":"98b67609-9822-4cb9-b2ed-14e3034c8559","actor_username":"admin@test.com","actor_via_sso":false,"log_type":"account"}	2025-10-31 12:21:28.825957+00	
00000000-0000-0000-0000-000000000000	3aed82dc-e4cf-4304-8b00-df1f087301b3	{"action":"login","actor_id":"98b67609-9822-4cb9-b2ed-14e3034c8559","actor_username":"admin@test.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-31 12:21:33.418189+00	
00000000-0000-0000-0000-000000000000	57c4f660-9c2d-4929-b45b-c20795bc08dc	{"action":"logout","actor_id":"98b67609-9822-4cb9-b2ed-14e3034c8559","actor_username":"admin@test.com","actor_via_sso":false,"log_type":"account"}	2025-10-31 12:23:59.268179+00	
00000000-0000-0000-0000-000000000000	3a4e4139-d20d-47b2-b04f-6bfad80b7599	{"action":"login","actor_id":"98b67609-9822-4cb9-b2ed-14e3034c8559","actor_username":"admin@test.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-31 12:24:28.853063+00	
00000000-0000-0000-0000-000000000000	fb2659c8-08ab-4d65-9a1d-283bd54adc2d	{"action":"token_refreshed","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-31 12:25:51.635985+00	
00000000-0000-0000-0000-000000000000	6ceeee0c-9a19-443f-a133-456e32d25241	{"action":"token_revoked","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-31 12:25:51.654261+00	
00000000-0000-0000-0000-000000000000	c440e096-dc9e-44d5-9782-d8485e757231	{"action":"user_signedup","actor_id":"cde324d4-4ab5-448f-9544-45dbf515d12d","actor_username":"levimper@gmail.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}	2025-10-31 12:25:53.321395+00	
00000000-0000-0000-0000-000000000000	3be994ba-5fb4-47d6-a63c-295cec0cb2e1	{"action":"login","actor_id":"cde324d4-4ab5-448f-9544-45dbf515d12d","actor_username":"levimper@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-31 12:25:53.336284+00	
00000000-0000-0000-0000-000000000000	601cc3e8-3937-4aff-8e5d-f5055c599847	{"action":"token_refreshed","actor_id":"dde5c3c7-8368-4df9-b12b-160ff2cc02ab","actor_username":"odintsov.su10@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-31 12:35:33.268602+00	
00000000-0000-0000-0000-000000000000	53d53e70-ca80-4264-afa4-dae83eef14a2	{"action":"token_revoked","actor_id":"dde5c3c7-8368-4df9-b12b-160ff2cc02ab","actor_username":"odintsov.su10@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-31 12:35:33.279008+00	
00000000-0000-0000-0000-000000000000	bd3e14b3-55fc-4cde-9de7-3f916cca183f	{"action":"token_refreshed","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-31 12:52:25.612901+00	
00000000-0000-0000-0000-000000000000	9109c300-4e69-4b8f-a4c2-b6809055a420	{"action":"token_revoked","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-31 12:52:25.637234+00	
00000000-0000-0000-0000-000000000000	a4809072-cedd-40e6-bb9c-b89e30ab0803	{"action":"token_refreshed","actor_id":"98b67609-9822-4cb9-b2ed-14e3034c8559","actor_username":"admin@test.com","actor_via_sso":false,"log_type":"token"}	2025-10-31 13:27:49.203456+00	
00000000-0000-0000-0000-000000000000	559fe715-0214-463d-a599-5268b7fb7010	{"action":"token_revoked","actor_id":"98b67609-9822-4cb9-b2ed-14e3034c8559","actor_username":"admin@test.com","actor_via_sso":false,"log_type":"token"}	2025-10-31 13:27:49.225962+00	
00000000-0000-0000-0000-000000000000	b5e3269e-e622-4747-a89b-141a4135a80d	{"action":"token_refreshed","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-31 14:01:12.615013+00	
00000000-0000-0000-0000-000000000000	059d60ec-8a69-4daf-b0f3-883f219c89ba	{"action":"token_revoked","actor_id":"8537c87c-44d7-450e-b1b0-498ae7ddd3f6","actor_username":"eugsu10@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-10-31 14:01:12.628427+00	
00000000-0000-0000-0000-000000000000	41d07e75-8c50-4201-92a3-ec5a1f26f42e	{"action":"user_signedup","actor_id":"0236a1d5-3f29-449e-9e60-bf908e5e7cf6","actor_username":"sadovnikov.d.y@su10.ru","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}	2025-10-31 14:05:00.410789+00	
00000000-0000-0000-0000-000000000000	9196da8b-703e-46e7-9405-db36edb0b9a9	{"action":"login","actor_id":"0236a1d5-3f29-449e-9e60-bf908e5e7cf6","actor_username":"sadovnikov.d.y@su10.ru","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-10-31 14:05:00.428145+00	
00000000-0000-0000-0000-000000000000	e640f3ab-1248-4e5d-b38f-0d118c7505f0	{"action":"token_refreshed","actor_id":"98b67609-9822-4cb9-b2ed-14e3034c8559","actor_username":"admin@test.com","actor_via_sso":false,"log_type":"token"}	2025-10-31 14:31:24.596593+00	
00000000-0000-0000-0000-000000000000	25368712-288f-4c76-b1fe-d2d4b65acd25	{"action":"token_revoked","actor_id":"98b67609-9822-4cb9-b2ed-14e3034c8559","actor_username":"admin@test.com","actor_via_sso":false,"log_type":"token"}	2025-10-31 14:31:24.607479+00	
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
3c0bc697-412f-42ef-8a9e-3c2a96286072	3c0bc697-412f-42ef-8a9e-3c2a96286072	{"sub": "3c0bc697-412f-42ef-8a9e-3c2a96286072", "email": "repnikov.i.a@su10.ru", "display_name": "Игорь Репников ", "email_verified": false, "phone_verified": false}	email	2025-10-29 13:52:27.343235+00	2025-10-29 13:52:27.343296+00	2025-10-29 13:52:27.343296+00	9a8756a1-72e0-484d-b446-fd23df40aa4a
c3065a1d-0422-4c95-af57-580eab0c970f	c3065a1d-0422-4c95-af57-580eab0c970f	{"sub": "c3065a1d-0422-4c95-af57-580eab0c970f", "email": "olenina.e.y@su10.ru", "display_name": "Гаева", "email_verified": false, "phone_verified": false}	email	2025-10-29 13:54:54.20011+00	2025-10-29 13:54:54.200157+00	2025-10-29 13:54:54.200157+00	10adfeb9-103e-4657-9731-5d10e5523fab
9a28b6d7-e5e3-4141-92c8-ec9da0dd7b3d	9a28b6d7-e5e3-4141-92c8-ec9da0dd7b3d	{"sub": "9a28b6d7-e5e3-4141-92c8-ec9da0dd7b3d", "email": "pivovarova.a.v@zakupka.pro", "display_name": "Пивоварова", "email_verified": false, "phone_verified": false}	email	2025-10-29 14:00:52.098972+00	2025-10-29 14:00:52.099021+00	2025-10-29 14:00:52.099021+00	fe9a2f63-25bb-45af-aca1-a183805da04d
32265ce5-8681-4ae5-99b1-2b81210e9522	32265ce5-8681-4ae5-99b1-2b81210e9522	{"sub": "32265ce5-8681-4ae5-99b1-2b81210e9522", "email": "muha.m.u@su10.ru", "display_name": "Муха Мария", "email_verified": false, "phone_verified": false}	email	2025-10-30 06:09:46.244087+00	2025-10-30 06:09:46.24469+00	2025-10-30 06:09:46.24469+00	bd51b778-a4df-4e8e-af77-67fcb41c2e58
dde5c3c7-8368-4df9-b12b-160ff2cc02ab	dde5c3c7-8368-4df9-b12b-160ff2cc02ab	{"sub": "dde5c3c7-8368-4df9-b12b-160ff2cc02ab", "email": "odintsov.su10@gmail.com", "display_name": "Одинцов Артем", "email_verified": false, "phone_verified": false}	email	2025-10-30 09:12:43.792451+00	2025-10-30 09:12:43.792505+00	2025-10-30 09:12:43.792505+00	d5222649-541a-4f30-a79b-18d843d75c71
756adb06-f2d7-4113-9739-779afbd69643	756adb06-f2d7-4113-9739-779afbd69643	{"sub": "756adb06-f2d7-4113-9739-779afbd69643", "email": "karaseni.n.d@zakupka.pro", "display_name": "Карасени Николай Демьянович", "email_verified": false, "phone_verified": false}	email	2025-10-30 11:27:43.572148+00	2025-10-30 11:27:43.572868+00	2025-10-30 11:27:43.572868+00	20a1a723-b172-4942-ba2c-33e35917a05b
f8e5ca55-75fd-419d-a30c-42ffa125d9d9	f8e5ca55-75fd-419d-a30c-42ffa125d9d9	{"sub": "f8e5ca55-75fd-419d-a30c-42ffa125d9d9", "email": "alexeymoguev@gmail.com", "display_name": "Могуев", "email_verified": true, "phone_verified": false}	email	2025-10-29 07:23:48.976766+00	2025-10-29 07:23:48.976825+00	2025-10-29 07:23:48.976825+00	398194b6-8987-4aa1-9378-025f733eed4e
990cf9a6-88ab-465c-a280-b51c0467aeb9	990cf9a6-88ab-465c-a280-b51c0467aeb9	{"sub": "990cf9a6-88ab-465c-a280-b51c0467aeb9", "email": "postoev.e.v@su10.ru", "display_name": "Постоев", "email_verified": false, "phone_verified": false}	email	2025-10-29 12:23:00.202221+00	2025-10-29 12:23:00.20227+00	2025-10-29 12:23:00.20227+00	d74a24dd-c71d-480d-83e8-edd4e7b54313
310087c1-ef51-4c13-9f65-e581845313fe	310087c1-ef51-4c13-9f65-e581845313fe	{"sub": "310087c1-ef51-4c13-9f65-e581845313fe", "email": "kazubov.a.a@su10.ru", "display_name": "Казубов", "email_verified": false, "phone_verified": false}	email	2025-10-29 13:13:37.012885+00	2025-10-29 13:13:37.012941+00	2025-10-29 13:13:37.012941+00	70f9e988-1cf2-4eda-8b17-4064e5333441
7d3d3502-7204-4aee-87da-1fdcbdbba8ad	7d3d3502-7204-4aee-87da-1fdcbdbba8ad	{"sub": "7d3d3502-7204-4aee-87da-1fdcbdbba8ad", "email": "korneichik.k.a@su10.ru", "display_name": "Корнейчик", "email_verified": false, "phone_verified": false}	email	2025-10-29 13:13:51.054471+00	2025-10-29 13:13:51.054528+00	2025-10-29 13:13:51.054528+00	b2af8227-0747-4f7f-b065-a7a81f4d0167
f8d1b0bb-75b7-4c50-b431-a6c8ae17fe19	f8d1b0bb-75b7-4c50-b431-a6c8ae17fe19	{"sub": "f8d1b0bb-75b7-4c50-b431-a6c8ae17fe19", "email": "korotkov.a.d@mstroy.pro", "display_name": "Коротков", "email_verified": false, "phone_verified": false}	email	2025-10-29 13:16:04.397039+00	2025-10-29 13:16:04.397088+00	2025-10-29 13:16:04.397088+00	f21ec279-0041-47dc-958b-b28628a9e79c
112fd71d-fef9-4b4b-ad91-74f2fe211947	112fd71d-fef9-4b4b-ad91-74f2fe211947	{"sub": "112fd71d-fef9-4b4b-ad91-74f2fe211947", "email": "semina.a.v@su10.ru", "display_name": "Сёмина", "email_verified": false, "phone_verified": false}	email	2025-10-29 13:16:22.335448+00	2025-10-29 13:16:22.335493+00	2025-10-29 13:16:22.335493+00	77e7bc91-32a0-4f90-89de-bcba4bf4ac0f
e4da2eb1-4729-41ec-978a-07a5d01a9fff	e4da2eb1-4729-41ec-978a-07a5d01a9fff	{"sub": "e4da2eb1-4729-41ec-978a-07a5d01a9fff", "email": "andrew_uzun3@mail.ru", "display_name": "Uzun", "email_verified": false, "phone_verified": false}	email	2025-10-29 13:49:47.12936+00	2025-10-29 13:49:47.129422+00	2025-10-29 13:49:47.129422+00	9fc57cac-0481-4c9a-9dc2-11c824064125
f051acbc-190a-4ea5-bf1c-90bb1cd7a58c	f051acbc-190a-4ea5-bf1c-90bb1cd7a58c	{"sub": "f051acbc-190a-4ea5-bf1c-90bb1cd7a58c", "email": "shanin.r.a@su10.ru", "display_name": "Шанин", "email_verified": false, "phone_verified": false}	email	2025-10-29 13:50:13.262215+00	2025-10-29 13:50:13.262261+00	2025-10-29 13:50:13.262261+00	4b941308-d869-49b6-b7fb-a784711e555f
adea9c9c-2d73-45b4-a801-e576e0b57f74	adea9c9c-2d73-45b4-a801-e576e0b57f74	{"sub": "adea9c9c-2d73-45b4-a801-e576e0b57f74", "email": "bondaruk.g.a@mstroy.pro", "display_name": "Бондарук Геннадий", "email_verified": false, "phone_verified": false}	email	2025-10-30 12:27:37.895438+00	2025-10-30 12:27:37.895493+00	2025-10-30 12:27:37.895493+00	89f98f67-60f2-4b0a-bbe1-fba9217f5821
d8c1330a-ae1a-407a-ad2c-897ab85102dd	d8c1330a-ae1a-407a-ad2c-897ab85102dd	{"sub": "d8c1330a-ae1a-407a-ad2c-897ab85102dd", "email": "999@mail.ru", "display_name": "Иванов", "email_verified": false, "phone_verified": false}	email	2025-10-30 12:36:05.184798+00	2025-10-30 12:36:05.184857+00	2025-10-30 12:36:05.184857+00	3d144462-dc88-44aa-8256-367e3fc88671
98b67609-9822-4cb9-b2ed-14e3034c8559	98b67609-9822-4cb9-b2ed-14e3034c8559	{"sub": "98b67609-9822-4cb9-b2ed-14e3034c8559", "email": "admin@test.com", "display_name": "admin@test.com", "email_verified": false, "phone_verified": false}	email	2025-10-30 15:28:32.671673+00	2025-10-30 15:28:32.671734+00	2025-10-30 15:28:32.671734+00	5f501c33-5065-4092-910f-14d5e71e29aa
e96e699e-647d-4132-b8b5-e10db8e01021	e96e699e-647d-4132-b8b5-e10db8e01021	{"sub": "e96e699e-647d-4132-b8b5-e10db8e01021", "email": "kuzmin.a.a@su10.ru", "display_name": "Кузьмин ", "email_verified": false, "phone_verified": false}	email	2025-10-31 06:26:19.476134+00	2025-10-31 06:26:19.476184+00	2025-10-31 06:26:19.476184+00	b6c7d826-4a54-442b-a8a0-0e92b62a0c28
f31006f1-ab3e-44e9-a0ae-27d0bfa53ac4	f31006f1-ab3e-44e9-a0ae-27d0bfa53ac4	{"sub": "f31006f1-ab3e-44e9-a0ae-27d0bfa53ac4", "email": "popov.a.n@su10.ru", "display_name": "Попов", "email_verified": false, "phone_verified": false}	email	2025-10-31 06:42:32.070799+00	2025-10-31 06:42:32.070849+00	2025-10-31 06:42:32.070849+00	34047ac6-dd16-4ba3-a4b0-139d5b314c3e
cde324d4-4ab5-448f-9544-45dbf515d12d	cde324d4-4ab5-448f-9544-45dbf515d12d	{"sub": "cde324d4-4ab5-448f-9544-45dbf515d12d", "email": "levimper@gmail.com", "display_name": "Некрасов", "email_verified": false, "phone_verified": false}	email	2025-10-31 12:25:53.3172+00	2025-10-31 12:25:53.317255+00	2025-10-31 12:25:53.317255+00	bc5c66e2-44c8-400a-a50d-430e51d7e668
0236a1d5-3f29-449e-9e60-bf908e5e7cf6	0236a1d5-3f29-449e-9e60-bf908e5e7cf6	{"sub": "0236a1d5-3f29-449e-9e60-bf908e5e7cf6", "email": "sadovnikov.d.y@su10.ru", "display_name": "Садовников", "email_verified": false, "phone_verified": false}	email	2025-10-31 14:05:00.397384+00	2025-10-31 14:05:00.39745+00	2025-10-31 14:05:00.39745+00	9b0951d1-8e19-4beb-b858-153552c48044
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
775aae59-2c45-4c68-876b-dd4ad376826d	2025-10-29 07:24:12.051681+00	2025-10-29 07:24:12.051681+00	otp	528362be-4ccd-4ba4-8717-2ec3f8c5c247
0579a994-d019-4541-9597-6db428414f5f	2025-10-29 07:24:12.788537+00	2025-10-29 07:24:12.788537+00	password	2c68d673-a8c8-48ba-a747-cfd89fe31275
0b4183d0-0f7a-43cd-acc0-ef7c0a295bd4	2025-10-29 13:13:37.062499+00	2025-10-29 13:13:37.062499+00	password	18838683-8a6f-438e-8600-f25200e386c2
6c05392b-35e3-42dd-b82b-d5c62cce39ad	2025-10-29 13:13:51.067526+00	2025-10-29 13:13:51.067526+00	password	f6985099-32f9-4d19-88f0-5de897b2bb0c
3ee100f6-5b50-48b0-a952-19b4444a3ba9	2025-10-29 13:16:04.411142+00	2025-10-29 13:16:04.411142+00	password	3a9b054e-f08b-49c5-a5d6-2e6798f1a6be
b283b30c-c569-47ad-a91e-4f4133a4b853	2025-10-29 13:16:22.343708+00	2025-10-29 13:16:22.343708+00	password	32f63d21-7eac-4d65-9c36-82dc04f1f6a6
57176e84-389e-4197-be7e-75f151b9c10c	2025-10-29 13:25:50.451336+00	2025-10-29 13:25:50.451336+00	password	3250fafa-117b-4309-a358-1f991fce2511
f90e53ca-955e-4095-a6eb-8c31655bcba6	2025-10-29 13:49:47.2027+00	2025-10-29 13:49:47.2027+00	password	ab5d2d68-71d0-48b7-8b2a-4c8dce117096
fa4e2bc2-dccb-4a58-839c-f65effd2219f	2025-10-29 13:50:13.284751+00	2025-10-29 13:50:13.284751+00	password	3aee9679-108d-4c61-bc98-f3507fe45de9
d9c64205-70a2-4a23-9520-c264e5d341d6	2025-10-29 13:52:27.384337+00	2025-10-29 13:52:27.384337+00	password	61e3f52e-00c5-406e-9c43-74771e7956ba
9a121aef-15d9-4560-b8c9-5ae464d1e1dc	2025-10-29 13:54:54.216224+00	2025-10-29 13:54:54.216224+00	password	0d79fca6-9a3b-4ba1-993c-20f07d5b0712
971ea59a-d5b2-41ed-9dca-01e68b381b5a	2025-10-29 14:00:52.112244+00	2025-10-29 14:00:52.112244+00	password	15949c2b-05b0-451a-bd91-ca220730b4e6
3f39b669-1dae-40d8-8571-36bfcd978dca	2025-10-30 06:09:46.368541+00	2025-10-30 06:09:46.368541+00	password	857597a1-9ce3-44be-b204-df43a593533c
2fe1af21-d8dc-427e-83d0-06f67c04ccfd	2025-10-30 09:12:43.880069+00	2025-10-30 09:12:43.880069+00	password	5da5a0f4-da63-4ac5-bb0c-b1f3cd61b2eb
d9f72ecc-2d4e-4518-9ea4-ed671364d8b2	2025-10-30 11:27:43.65293+00	2025-10-30 11:27:43.65293+00	password	229b3fdf-dc97-463a-a5e4-bc72ae68b4de
3915daa8-141b-4cee-bfaa-d7bf9e2f4aff	2025-10-30 12:27:37.949523+00	2025-10-30 12:27:37.949523+00	password	9ec93d00-9388-404d-91de-ca659720f2c3
25a4f1b9-e9be-4934-805d-e7f635cf868c	2025-10-30 12:36:05.238338+00	2025-10-30 12:36:05.238338+00	password	991e62a9-16bb-4018-ad80-233b4c7d6b5d
69029e69-0bef-4c23-af66-9498127b87f6	2025-10-30 17:21:46.425738+00	2025-10-30 17:21:46.425738+00	password	29a49ce7-be1a-4409-8fe4-f26531bae54d
7531a4b0-2bbc-43a8-b7fe-7af57bff1e0c	2025-10-30 17:25:38.488745+00	2025-10-30 17:25:38.488745+00	password	c569c246-16d7-44a5-8d9b-b1d706e509af
3aeb287a-a520-4899-accd-16bb78171127	2025-10-30 17:27:52.75679+00	2025-10-30 17:27:52.75679+00	password	54f345cc-881a-427d-b67b-d0138bd02e24
2d361a97-d8fa-4cc6-8ead-c8308620532a	2025-10-30 17:51:46.604882+00	2025-10-30 17:51:46.604882+00	password	d3d82e37-0cdb-4e64-a215-68798d0c3420
1f677c44-6538-483e-a65e-445298a2d2e0	2025-10-31 06:26:19.537524+00	2025-10-31 06:26:19.537524+00	password	179735f3-fe94-4b7e-85aa-a548cae8432f
438332c1-ed94-47dc-8d42-68839d42859e	2025-10-31 06:42:32.089458+00	2025-10-31 06:42:32.089458+00	password	475e6fe1-b44d-49c4-97d1-a619c2b142f0
384b5c18-cc6f-4a97-babf-806e6a5d642a	2025-10-31 12:24:28.857424+00	2025-10-31 12:24:28.857424+00	password	bdd5eecf-3154-490c-a38b-31c0c167b6a4
155ebc6f-cb04-48c5-89c2-f9b5b2c497cb	2025-10-31 12:25:53.339677+00	2025-10-31 12:25:53.339677+00	password	6da6ef72-c092-49ec-85c6-df4d59a377b7
bdee9b8f-cd43-475d-abf2-95561dc37ac4	2025-10-31 14:05:00.465858+00	2025-10-31 14:05:00.465858+00	password	87638751-eea8-4143-9961-0d1fb42f7ba9
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
00000000-0000-0000-0000-000000000000	119	yfm6ypbrgpyn	f8e5ca55-75fd-419d-a30c-42ffa125d9d9	t	2025-10-30 06:45:47.718505+00	2025-10-30 07:59:07.939343+00	p24lxtq7tkv5	57176e84-389e-4197-be7e-75f151b9c10c
00000000-0000-0000-0000-000000000000	97	nxj2kna5dj5t	310087c1-ef51-4c13-9f65-e581845313fe	t	2025-10-29 13:13:37.050547+00	2025-10-31 04:45:59.327994+00	\N	0b4183d0-0f7a-43cd-acc0-ef7c0a295bd4
00000000-0000-0000-0000-000000000000	207	porlynx5wwqh	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	f	2025-10-31 12:25:51.671588+00	2025-10-31 12:25:51.671588+00	4lpbx4h2pgru	69029e69-0bef-4c23-af66-9498127b87f6
00000000-0000-0000-0000-000000000000	208	c3653t73vzyd	cde324d4-4ab5-448f-9544-45dbf515d12d	f	2025-10-31 12:25:53.338494+00	2025-10-31 12:25:53.338494+00	\N	155ebc6f-cb04-48c5-89c2-f9b5b2c497cb
00000000-0000-0000-0000-000000000000	122	ggnqnou5tcpj	f051acbc-190a-4ea5-bf1c-90bb1cd7a58c	t	2025-10-30 07:52:12.013556+00	2025-10-30 09:21:35.276553+00	shgb64kz4lck	fa4e2bc2-dccb-4a58-839c-f65effd2219f
00000000-0000-0000-0000-000000000000	98	3gpyueacv27t	7d3d3502-7204-4aee-87da-1fdcbdbba8ad	t	2025-10-29 13:13:51.06491+00	2025-10-31 04:48:06.945117+00	\N	6c05392b-35e3-42dd-b82b-d5c62cce39ad
00000000-0000-0000-0000-000000000000	104	rgyvlzq22to7	3c0bc697-412f-42ef-8a9e-3c2a96286072	f	2025-10-29 13:52:27.371873+00	2025-10-29 13:52:27.371873+00	\N	d9c64205-70a2-4a23-9520-c264e5d341d6
00000000-0000-0000-0000-000000000000	130	bci5mcn6bmen	dde5c3c7-8368-4df9-b12b-160ff2cc02ab	t	2025-10-30 10:33:14.823226+00	2025-10-31 12:35:33.279644+00	ap22i4swhcqb	2fe1af21-d8dc-427e-83d0-06f67c04ccfd
00000000-0000-0000-0000-000000000000	107	srld6owlk7g3	9a28b6d7-e5e3-4141-92c8-ec9da0dd7b3d	f	2025-10-29 14:00:52.109359+00	2025-10-29 14:00:52.109359+00	\N	971ea59a-d5b2-41ed-9dca-01e68b381b5a
00000000-0000-0000-0000-000000000000	126	sakl6ulpy67q	f8e5ca55-75fd-419d-a30c-42ffa125d9d9	t	2025-10-30 09:15:29.082907+00	2025-10-30 10:43:13.330199+00	3obhfid74xiv	57176e84-389e-4197-be7e-75f151b9c10c
00000000-0000-0000-0000-000000000000	101	nsz73ckewoay	f8e5ca55-75fd-419d-a30c-42ffa125d9d9	t	2025-10-29 13:25:50.431144+00	2025-10-29 15:01:43.88341+00	\N	57176e84-389e-4197-be7e-75f151b9c10c
00000000-0000-0000-0000-000000000000	134	ezuzlks25n4l	f8e5ca55-75fd-419d-a30c-42ffa125d9d9	f	2025-10-30 11:49:17.195006+00	2025-10-30 11:49:17.195006+00	t37dofsnaelp	57176e84-389e-4197-be7e-75f151b9c10c
00000000-0000-0000-0000-000000000000	165	wbdfrpeqhg3s	310087c1-ef51-4c13-9f65-e581845313fe	t	2025-10-31 04:45:59.350184+00	2025-10-31 05:44:01.466872+00	nxj2kna5dj5t	0b4183d0-0f7a-43cd-acc0-ef7c0a295bd4
00000000-0000-0000-0000-000000000000	206	v66klmtyavx5	98b67609-9822-4cb9-b2ed-14e3034c8559	t	2025-10-31 12:24:28.85566+00	2025-10-31 13:27:49.229113+00	\N	384b5c18-cc6f-4a97-babf-806e6a5d642a
00000000-0000-0000-0000-000000000000	112	hxqn7youwcfo	112fd71d-fef9-4b4b-ad91-74f2fe211947	f	2025-10-29 15:12:24.017793+00	2025-10-29 15:12:24.017793+00	2dxlnig5zilz	b283b30c-c569-47ad-a91e-4f4133a4b853
00000000-0000-0000-0000-000000000000	110	bqhwvcxvjmzo	f8e5ca55-75fd-419d-a30c-42ffa125d9d9	t	2025-10-29 15:01:43.902435+00	2025-10-29 16:00:14.991687+00	nsz73ckewoay	57176e84-389e-4197-be7e-75f151b9c10c
00000000-0000-0000-0000-000000000000	168	t3s77ald44m2	adea9c9c-2d73-45b4-a801-e576e0b57f74	t	2025-10-31 05:11:20.364439+00	2025-10-31 06:10:28.604181+00	rkpp6bbwa2rn	3915daa8-141b-4cee-bfaa-d7bf9e2f4aff
00000000-0000-0000-0000-000000000000	116	euz2ocvn6kxl	32265ce5-8681-4ae5-99b1-2b81210e9522	f	2025-10-30 06:09:46.336611+00	2025-10-30 06:09:46.336611+00	\N	3f39b669-1dae-40d8-8571-36bfcd978dca
00000000-0000-0000-0000-000000000000	172	lxabbmyfo3t2	e96e699e-647d-4132-b8b5-e10db8e01021	f	2025-10-31 06:26:19.524153+00	2025-10-31 06:26:19.524153+00	\N	1f677c44-6538-483e-a65e-445298a2d2e0
00000000-0000-0000-0000-000000000000	153	ygzwd26krv4b	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	t	2025-10-30 17:51:46.588057+00	2025-10-31 06:36:15.037087+00	\N	2d361a97-d8fa-4cc6-8ead-c8308620532a
00000000-0000-0000-0000-000000000000	138	kxgf5pwmbcb4	d8c1330a-ae1a-407a-ad2c-897ab85102dd	f	2025-10-30 12:36:05.225295+00	2025-10-30 12:36:05.225295+00	\N	25a4f1b9-e9be-4934-805d-e7f635cf868c
00000000-0000-0000-0000-000000000000	210	thi2otbzhff7	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	t	2025-10-31 12:52:25.653667+00	2025-10-31 14:01:12.631155+00	3u3c6bz7ekqk	2d361a97-d8fa-4cc6-8ead-c8308620532a
00000000-0000-0000-0000-000000000000	212	4jznssdcn3rg	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	f	2025-10-31 14:01:12.640796+00	2025-10-31 14:01:12.640796+00	thi2otbzhff7	2d361a97-d8fa-4cc6-8ead-c8308620532a
00000000-0000-0000-0000-000000000000	214	ysma4737itrd	98b67609-9822-4cb9-b2ed-14e3034c8559	f	2025-10-31 14:31:24.618788+00	2025-10-31 14:31:24.618788+00	tfm53cy76ile	384b5c18-cc6f-4a97-babf-806e6a5d642a
00000000-0000-0000-0000-000000000000	176	ndqsuh2kvyne	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	t	2025-10-31 06:36:15.04754+00	2025-10-31 07:39:51.677182+00	ygzwd26krv4b	2d361a97-d8fa-4cc6-8ead-c8308620532a
00000000-0000-0000-0000-000000000000	166	igdk6qyjsnj3	7d3d3502-7204-4aee-87da-1fdcbdbba8ad	t	2025-10-31 04:48:06.945468+00	2025-10-31 08:27:49.203253+00	3gpyueacv27t	6c05392b-35e3-42dd-b82b-d5c62cce39ad
00000000-0000-0000-0000-000000000000	180	2dizo5zy5qw6	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	t	2025-10-31 07:39:51.690186+00	2025-10-31 08:51:06.777711+00	ndqsuh2kvyne	2d361a97-d8fa-4cc6-8ead-c8308620532a
00000000-0000-0000-0000-000000000000	151	q7v7bemgpwfa	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	f	2025-10-30 17:25:38.486934+00	2025-10-30 17:25:38.486934+00	\N	7531a4b0-2bbc-43a8-b7fe-7af57bff1e0c
00000000-0000-0000-0000-000000000000	184	g53mygitvace	7d3d3502-7204-4aee-87da-1fdcbdbba8ad	t	2025-10-31 08:27:49.216072+00	2025-10-31 09:36:57.489898+00	igdk6qyjsnj3	6c05392b-35e3-42dd-b82b-d5c62cce39ad
00000000-0000-0000-0000-000000000000	190	smjsziyte7st	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	t	2025-10-31 09:51:29.601354+00	2025-10-31 10:49:53.709162+00	hkxlmmx7hgon	2d361a97-d8fa-4cc6-8ead-c8308620532a
00000000-0000-0000-0000-000000000000	194	5temprhcphui	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	t	2025-10-31 10:49:53.72462+00	2025-10-31 11:48:38.058825+00	smjsziyte7st	2d361a97-d8fa-4cc6-8ead-c8308620532a
00000000-0000-0000-0000-000000000000	82	2kyjnlmsq2wl	f8e5ca55-75fd-419d-a30c-42ffa125d9d9	f	2025-10-29 07:24:12.035468+00	2025-10-29 07:24:12.035468+00	\N	775aae59-2c45-4c68-876b-dd4ad376826d
00000000-0000-0000-0000-000000000000	83	5jznpqcp4frd	f8e5ca55-75fd-419d-a30c-42ffa125d9d9	t	2025-10-29 07:24:12.787257+00	2025-10-29 09:14:05.222857+00	\N	0579a994-d019-4541-9597-6db428414f5f
00000000-0000-0000-0000-000000000000	85	d7w2jw2trdae	f8e5ca55-75fd-419d-a30c-42ffa125d9d9	f	2025-10-29 09:14:05.241935+00	2025-10-29 09:14:05.241935+00	5jznpqcp4frd	0579a994-d019-4541-9597-6db428414f5f
00000000-0000-0000-0000-000000000000	115	p24lxtq7tkv5	f8e5ca55-75fd-419d-a30c-42ffa125d9d9	t	2025-10-29 17:00:41.794156+00	2025-10-30 06:45:47.707155+00	twvmm7glgeh2	57176e84-389e-4197-be7e-75f151b9c10c
00000000-0000-0000-0000-000000000000	99	x3f5gfdry2mz	f8d1b0bb-75b7-4c50-b431-a6c8ae17fe19	f	2025-10-29 13:16:04.408661+00	2025-10-29 13:16:04.408661+00	\N	3ee100f6-5b50-48b0-a952-19b4444a3ba9
00000000-0000-0000-0000-000000000000	173	4lpbx4h2pgru	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	t	2025-10-31 06:27:34.576739+00	2025-10-31 12:25:51.655667+00	end62vppx6vv	69029e69-0bef-4c23-af66-9498127b87f6
00000000-0000-0000-0000-000000000000	209	ypf4yo4qehyk	dde5c3c7-8368-4df9-b12b-160ff2cc02ab	f	2025-10-31 12:35:33.289082+00	2025-10-31 12:35:33.289082+00	bci5mcn6bmen	2fe1af21-d8dc-427e-83d0-06f67c04ccfd
00000000-0000-0000-0000-000000000000	103	shgb64kz4lck	f051acbc-190a-4ea5-bf1c-90bb1cd7a58c	t	2025-10-29 13:50:13.280252+00	2025-10-30 07:52:11.999323+00	\N	fa4e2bc2-dccb-4a58-839c-f65effd2219f
00000000-0000-0000-0000-000000000000	137	rkpp6bbwa2rn	adea9c9c-2d73-45b4-a801-e576e0b57f74	t	2025-10-30 12:27:37.937759+00	2025-10-31 05:11:20.362419+00	\N	3915daa8-141b-4cee-bfaa-d7bf9e2f4aff
00000000-0000-0000-0000-000000000000	102	3wx2zbbwwnof	e4da2eb1-4729-41ec-978a-07a5d01a9fff	f	2025-10-29 13:49:47.188277+00	2025-10-29 13:49:47.188277+00	\N	f90e53ca-955e-4095-a6eb-8c31655bcba6
00000000-0000-0000-0000-000000000000	197	3u3c6bz7ekqk	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	t	2025-10-31 11:48:38.071224+00	2025-10-31 12:52:25.63797+00	5temprhcphui	2d361a97-d8fa-4cc6-8ead-c8308620532a
00000000-0000-0000-0000-000000000000	106	vzqejn4oakzp	c3065a1d-0422-4c95-af57-580eab0c970f	f	2025-10-29 13:54:54.213699+00	2025-10-29 13:54:54.213699+00	\N	9a121aef-15d9-4560-b8c9-5ae464d1e1dc
00000000-0000-0000-0000-000000000000	213	7ytuavbsilbr	0236a1d5-3f29-449e-9e60-bf908e5e7cf6	f	2025-10-31 14:05:00.449975+00	2025-10-31 14:05:00.449975+00	\N	bdee9b8f-cd43-475d-abf2-95561dc37ac4
00000000-0000-0000-0000-000000000000	149	end62vppx6vv	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	t	2025-10-30 17:21:46.422697+00	2025-10-31 06:27:34.572967+00	\N	69029e69-0bef-4c23-af66-9498127b87f6
00000000-0000-0000-0000-000000000000	100	2dxlnig5zilz	112fd71d-fef9-4b4b-ad91-74f2fe211947	t	2025-10-29 13:16:22.342546+00	2025-10-29 15:12:24.016343+00	\N	b283b30c-c569-47ad-a91e-4f4133a4b853
00000000-0000-0000-0000-000000000000	123	3obhfid74xiv	f8e5ca55-75fd-419d-a30c-42ffa125d9d9	t	2025-10-30 07:59:07.946706+00	2025-10-30 09:15:29.080842+00	yfm6ypbrgpyn	57176e84-389e-4197-be7e-75f151b9c10c
00000000-0000-0000-0000-000000000000	113	twvmm7glgeh2	f8e5ca55-75fd-419d-a30c-42ffa125d9d9	t	2025-10-29 16:00:15.007838+00	2025-10-29 17:00:41.772032+00	bqhwvcxvjmzo	57176e84-389e-4197-be7e-75f151b9c10c
00000000-0000-0000-0000-000000000000	152	whdlh5ky7a3t	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	t	2025-10-30 17:27:52.7547+00	2025-10-31 06:27:48.936361+00	\N	3aeb287a-a520-4899-accd-16bb78171127
00000000-0000-0000-0000-000000000000	211	tfm53cy76ile	98b67609-9822-4cb9-b2ed-14e3034c8559	t	2025-10-31 13:27:49.25215+00	2025-10-31 14:31:24.609446+00	v66klmtyavx5	384b5c18-cc6f-4a97-babf-806e6a5d642a
00000000-0000-0000-0000-000000000000	177	h3xdu7z3sfp3	f31006f1-ab3e-44e9-a0ae-27d0bfa53ac4	f	2025-10-31 06:42:32.086833+00	2025-10-31 06:42:32.086833+00	\N	438332c1-ed94-47dc-8d42-68839d42859e
00000000-0000-0000-0000-000000000000	127	6hfodnxi64cz	f051acbc-190a-4ea5-bf1c-90bb1cd7a58c	t	2025-10-30 09:21:35.289937+00	2025-10-31 07:17:45.431388+00	ggnqnou5tcpj	fa4e2bc2-dccb-4a58-839c-f65effd2219f
00000000-0000-0000-0000-000000000000	179	csnwyasnzrnn	f051acbc-190a-4ea5-bf1c-90bb1cd7a58c	f	2025-10-31 07:17:45.438688+00	2025-10-31 07:17:45.438688+00	6hfodnxi64cz	fa4e2bc2-dccb-4a58-839c-f65effd2219f
00000000-0000-0000-0000-000000000000	125	ap22i4swhcqb	dde5c3c7-8368-4df9-b12b-160ff2cc02ab	t	2025-10-30 09:12:43.867732+00	2025-10-30 10:33:14.814851+00	\N	2fe1af21-d8dc-427e-83d0-06f67c04ccfd
00000000-0000-0000-0000-000000000000	174	oj54vmkiifpa	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	t	2025-10-31 06:27:48.936708+00	2025-10-31 07:46:40.224594+00	whdlh5ky7a3t	3aeb287a-a520-4899-accd-16bb78171127
00000000-0000-0000-0000-000000000000	181	3ff3pzljhtkp	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	f	2025-10-31 07:46:40.226139+00	2025-10-31 07:46:40.226139+00	oj54vmkiifpa	3aeb287a-a520-4899-accd-16bb78171127
00000000-0000-0000-0000-000000000000	133	hf2xfzt6isos	756adb06-f2d7-4113-9739-779afbd69643	f	2025-10-30 11:27:43.62741+00	2025-10-30 11:27:43.62741+00	\N	d9f72ecc-2d4e-4518-9ea4-ed671364d8b2
00000000-0000-0000-0000-000000000000	131	t37dofsnaelp	f8e5ca55-75fd-419d-a30c-42ffa125d9d9	t	2025-10-30 10:43:13.341852+00	2025-10-30 11:49:17.181959+00	sakl6ulpy67q	57176e84-389e-4197-be7e-75f151b9c10c
00000000-0000-0000-0000-000000000000	169	6juaahepvkrz	310087c1-ef51-4c13-9f65-e581845313fe	t	2025-10-31 05:44:01.473371+00	2025-10-31 09:06:00.133476+00	wbdfrpeqhg3s	0b4183d0-0f7a-43cd-acc0-ef7c0a295bd4
00000000-0000-0000-0000-000000000000	187	c7ajyyi52rzk	310087c1-ef51-4c13-9f65-e581845313fe	f	2025-10-31 09:06:00.140795+00	2025-10-31 09:06:00.140795+00	6juaahepvkrz	0b4183d0-0f7a-43cd-acc0-ef7c0a295bd4
00000000-0000-0000-0000-000000000000	189	5wgdziqltsws	7d3d3502-7204-4aee-87da-1fdcbdbba8ad	f	2025-10-31 09:36:57.495048+00	2025-10-31 09:36:57.495048+00	g53mygitvace	6c05392b-35e3-42dd-b82b-d5c62cce39ad
00000000-0000-0000-0000-000000000000	185	hkxlmmx7hgon	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	t	2025-10-31 08:51:06.799394+00	2025-10-31 09:51:29.593301+00	2dizo5zy5qw6	2d361a97-d8fa-4cc6-8ead-c8308620532a
00000000-0000-0000-0000-000000000000	171	ycyvln3rufre	adea9c9c-2d73-45b4-a801-e576e0b57f74	t	2025-10-31 06:10:28.60638+00	2025-10-31 10:22:10.533217+00	t3s77ald44m2	3915daa8-141b-4cee-bfaa-d7bf9e2f4aff
00000000-0000-0000-0000-000000000000	193	htbyjg3uso34	adea9c9c-2d73-45b4-a801-e576e0b57f74	f	2025-10-31 10:22:10.536589+00	2025-10-31 10:22:10.536589+00	ycyvln3rufre	3915daa8-141b-4cee-bfaa-d7bf9e2f4aff
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
3ee100f6-5b50-48b0-a952-19b4444a3ba9	f8d1b0bb-75b7-4c50-b431-a6c8ae17fe19	2025-10-29 13:16:04.407563+00	2025-10-29 13:16:04.407563+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36	185.222.152.198	\N	\N
f90e53ca-955e-4095-a6eb-8c31655bcba6	e4da2eb1-4729-41ec-978a-07a5d01a9fff	2025-10-29 13:49:47.16978+00	2025-10-29 13:49:47.16978+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36	185.222.152.198	\N	\N
775aae59-2c45-4c68-876b-dd4ad376826d	f8e5ca55-75fd-419d-a30c-42ffa125d9d9	2025-10-29 07:24:12.022076+00	2025-10-29 07:24:12.022076+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36	185.222.152.198	\N	\N
d9c64205-70a2-4a23-9520-c264e5d341d6	3c0bc697-412f-42ef-8a9e-3c2a96286072	2025-10-29 13:52:27.362472+00	2025-10-29 13:52:27.362472+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36	185.222.152.198	\N	\N
0579a994-d019-4541-9597-6db428414f5f	f8e5ca55-75fd-419d-a30c-42ffa125d9d9	2025-10-29 07:24:12.786344+00	2025-10-29 09:14:05.261368+00	\N	aal1	\N	2025-10-29 09:14:05.260186	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36	185.222.152.198	\N	\N
25a4f1b9-e9be-4934-805d-e7f635cf868c	d8c1330a-ae1a-407a-ad2c-897ab85102dd	2025-10-30 12:36:05.217331+00	2025-10-30 12:36:05.217331+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36	185.222.152.198	\N	\N
9a121aef-15d9-4560-b8c9-5ae464d1e1dc	c3065a1d-0422-4c95-af57-580eab0c970f	2025-10-29 13:54:54.211765+00	2025-10-29 13:54:54.211765+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 YaBrowser/25.8.0.0 Safari/537.36	185.222.152.198	\N	\N
971ea59a-d5b2-41ed-9dca-01e68b381b5a	9a28b6d7-e5e3-4141-92c8-ec9da0dd7b3d	2025-10-29 14:00:52.107738+00	2025-10-29 14:00:52.107738+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36	185.222.152.198	\N	\N
2d361a97-d8fa-4cc6-8ead-c8308620532a	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	2025-10-30 17:51:46.56676+00	2025-10-31 14:01:12.656761+00	\N	aal1	\N	2025-10-31 14:01:12.656116	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36	88.210.21.137	\N	\N
438332c1-ed94-47dc-8d42-68839d42859e	f31006f1-ab3e-44e9-a0ae-27d0bfa53ac4	2025-10-31 06:42:32.0856+00	2025-10-31 06:42:32.0856+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36 Edg/141.0.0.0	185.222.152.198	\N	\N
b283b30c-c569-47ad-a91e-4f4133a4b853	112fd71d-fef9-4b4b-ad91-74f2fe211947	2025-10-29 13:16:22.341868+00	2025-10-29 15:12:24.0218+00	\N	aal1	\N	2025-10-29 15:12:24.021723	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36 Edg/141.0.0.0	185.222.152.198	\N	\N
0b4183d0-0f7a-43cd-acc0-ef7c0a295bd4	310087c1-ef51-4c13-9f65-e581845313fe	2025-10-29 13:13:37.043735+00	2025-10-31 09:06:00.14943+00	\N	aal1	\N	2025-10-31 09:06:00.149347	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 YaBrowser/25.8.0.0 Safari/537.36	185.222.152.198	\N	\N
3f39b669-1dae-40d8-8571-36bfcd978dca	32265ce5-8681-4ae5-99b1-2b81210e9522	2025-10-30 06:09:46.308949+00	2025-10-30 06:09:46.308949+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 YaBrowser/25.8.0.0 Safari/537.36	185.222.152.198	\N	\N
6c05392b-35e3-42dd-b82b-d5c62cce39ad	7d3d3502-7204-4aee-87da-1fdcbdbba8ad	2025-10-29 13:13:51.063459+00	2025-10-31 09:36:57.506632+00	\N	aal1	\N	2025-10-31 09:36:57.506549	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36 Edg/141.0.0.0	185.222.152.198	\N	\N
bdee9b8f-cd43-475d-abf2-95561dc37ac4	0236a1d5-3f29-449e-9e60-bf908e5e7cf6	2025-10-31 14:05:00.433593+00	2025-10-31 14:05:00.433593+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36	88.210.21.137	\N	\N
1f677c44-6538-483e-a65e-445298a2d2e0	e96e699e-647d-4132-b8b5-e10db8e01021	2025-10-31 06:26:19.505251+00	2025-10-31 06:26:19.505251+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 YaBrowser/25.8.0.0 Safari/537.36	185.222.152.198	\N	\N
384b5c18-cc6f-4a97-babf-806e6a5d642a	98b67609-9822-4cb9-b2ed-14e3034c8559	2025-10-31 12:24:28.853856+00	2025-10-31 14:31:24.634848+00	\N	aal1	\N	2025-10-31 14:31:24.63476	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36	88.210.21.137	\N	\N
d9f72ecc-2d4e-4518-9ea4-ed671364d8b2	756adb06-f2d7-4113-9739-779afbd69643	2025-10-30 11:27:43.603376+00	2025-10-30 11:27:43.603376+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 YaBrowser/25.8.0.0 Safari/537.36	185.222.152.198	\N	\N
57176e84-389e-4197-be7e-75f151b9c10c	f8e5ca55-75fd-419d-a30c-42ffa125d9d9	2025-10-29 13:25:50.416611+00	2025-10-30 11:49:17.210404+00	\N	aal1	\N	2025-10-30 11:49:17.210327	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36	185.222.152.198	\N	\N
7531a4b0-2bbc-43a8-b7fe-7af57bff1e0c	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	2025-10-30 17:25:38.484195+00	2025-10-30 17:25:38.484195+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36	88.210.21.137	\N	\N
fa4e2bc2-dccb-4a58-839c-f65effd2219f	f051acbc-190a-4ea5-bf1c-90bb1cd7a58c	2025-10-29 13:50:13.279372+00	2025-10-31 07:17:45.445223+00	\N	aal1	\N	2025-10-31 07:17:45.445144	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36	185.222.152.198	\N	\N
3915daa8-141b-4cee-bfaa-d7bf9e2f4aff	adea9c9c-2d73-45b4-a801-e576e0b57f74	2025-10-30 12:27:37.92701+00	2025-10-31 10:22:10.542482+00	\N	aal1	\N	2025-10-31 10:22:10.542395	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36	185.222.152.198	\N	\N
3aeb287a-a520-4899-accd-16bb78171127	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	2025-10-30 17:27:52.753308+00	2025-10-31 07:46:40.231666+00	\N	aal1	\N	2025-10-31 07:46:40.231583	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36 Edg/141.0.0.0	88.210.21.137	\N	\N
69029e69-0bef-4c23-af66-9498127b87f6	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	2025-10-30 17:21:46.413937+00	2025-10-31 12:25:51.687633+00	\N	aal1	\N	2025-10-31 12:25:51.687555	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36	88.210.21.137	\N	\N
155ebc6f-cb04-48c5-89c2-f9b5b2c497cb	cde324d4-4ab5-448f-9544-45dbf515d12d	2025-10-31 12:25:53.337116+00	2025-10-31 12:25:53.337116+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36	185.222.152.198	\N	\N
2fe1af21-d8dc-427e-83d0-06f67c04ccfd	dde5c3c7-8368-4df9-b12b-160ff2cc02ab	2025-10-30 09:12:43.850163+00	2025-10-31 12:35:33.300112+00	\N	aal1	\N	2025-10-31 12:35:33.300038	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 YaBrowser/25.8.0.0 Safari/537.36	185.222.152.198	\N	\N
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
00000000-0000-0000-0000-000000000000	7d3d3502-7204-4aee-87da-1fdcbdbba8ad	authenticated	authenticated	korneichik.k.a@su10.ru	$2a$10$3OHBrmdrs6HD8DGCRnrPV.xv6eXzg/zGYQzMzl2uPCrmBICpcSKQq	2025-10-29 13:13:51.059637+00	\N		\N		\N			\N	2025-10-29 13:13:51.063388+00	{"provider": "email", "providers": ["email"]}	{"sub": "7d3d3502-7204-4aee-87da-1fdcbdbba8ad", "email": "korneichik.k.a@su10.ru", "display_name": "Корнейчик", "email_verified": true, "phone_verified": false}	\N	2025-10-29 13:13:51.049554+00	2025-10-31 09:36:57.5021+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	f8e5ca55-75fd-419d-a30c-42ffa125d9d9	authenticated	authenticated	alexeymoguev@gmail.com	$2a$10$xGx3l3tQnlGcGl7im81h7uMbbcdh2S/CyQLCRb5UICYngkJEhahI6	2025-10-29 07:24:12.015838+00	\N		2025-10-29 07:23:48.999355+00		\N			\N	2025-10-29 13:25:50.416518+00	{"provider": "email", "providers": ["email"]}	{"sub": "f8e5ca55-75fd-419d-a30c-42ffa125d9d9", "email": "alexeymoguev@gmail.com", "display_name": "Могуев", "email_verified": true, "phone_verified": false}	\N	2025-10-29 07:23:48.914946+00	2025-10-30 11:49:17.203959+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	f051acbc-190a-4ea5-bf1c-90bb1cd7a58c	authenticated	authenticated	shanin.r.a@su10.ru	$2a$10$AA9PvbVIW6SqckNI3442We5JFK7y6ynyM2ttXHiI05xwgVeaNQolu	2025-10-29 13:50:13.266771+00	\N		\N		\N			\N	2025-10-29 13:50:13.279282+00	{"provider": "email", "providers": ["email"]}	{"sub": "f051acbc-190a-4ea5-bf1c-90bb1cd7a58c", "email": "shanin.r.a@su10.ru", "display_name": "Шанин", "email_verified": true, "phone_verified": false}	\N	2025-10-29 13:50:13.254341+00	2025-10-31 07:17:45.442101+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	c3065a1d-0422-4c95-af57-580eab0c970f	authenticated	authenticated	olenina.e.y@su10.ru	$2a$10$7Uyhmfhq1.AY/hr0/Ke7ou44Q7vN8OeyMoB/ABvoYrR6taaO7R4v6	2025-10-29 13:54:54.205744+00	\N		\N		\N			\N	2025-10-29 13:54:54.211037+00	{"provider": "email", "providers": ["email"]}	{"sub": "c3065a1d-0422-4c95-af57-580eab0c970f", "email": "olenina.e.y@su10.ru", "display_name": "Гаева", "email_verified": true, "phone_verified": false}	\N	2025-10-29 13:54:54.191227+00	2025-10-29 13:54:54.21574+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	f8d1b0bb-75b7-4c50-b431-a6c8ae17fe19	authenticated	authenticated	korotkov.a.d@mstroy.pro	$2a$10$/DnB24inGrXWTjSXJz2ETewext9EyCoRPhKInRZNwjJCQiQDASmki	2025-10-29 13:16:04.400999+00	\N		\N		\N			\N	2025-10-29 13:16:04.407471+00	{"provider": "email", "providers": ["email"]}	{"sub": "f8d1b0bb-75b7-4c50-b431-a6c8ae17fe19", "email": "korotkov.a.d@mstroy.pro", "display_name": "Коротков", "email_verified": true, "phone_verified": false}	\N	2025-10-29 13:16:04.388609+00	2025-10-29 13:16:04.410673+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	9a28b6d7-e5e3-4141-92c8-ec9da0dd7b3d	authenticated	authenticated	pivovarova.a.v@zakupka.pro	$2a$10$KwA1m/TOZKVzokPV9upf7Oi1zLZ739GpPQz06CyaMtI282avI/gbW	2025-10-29 14:00:52.103054+00	\N		\N		\N			\N	2025-10-29 14:00:52.10765+00	{"provider": "email", "providers": ["email"]}	{"sub": "9a28b6d7-e5e3-4141-92c8-ec9da0dd7b3d", "email": "pivovarova.a.v@zakupka.pro", "display_name": "Пивоварова", "email_verified": true, "phone_verified": false}	\N	2025-10-29 14:00:52.092115+00	2025-10-29 14:00:52.111736+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	e4da2eb1-4729-41ec-978a-07a5d01a9fff	authenticated	authenticated	andrew_uzun3@mail.ru	$2a$10$0SRsHj7fGOPlTbEBBbtsBerJxCn8o/QRWou3Ik/6lZmNsHqiGqR8u	2025-10-29 13:49:47.15131+00	\N		\N		\N			\N	2025-10-29 13:49:47.168536+00	{"provider": "email", "providers": ["email"]}	{"sub": "e4da2eb1-4729-41ec-978a-07a5d01a9fff", "email": "andrew_uzun3@mail.ru", "display_name": "Uzun", "email_verified": true, "phone_verified": false}	\N	2025-10-29 13:49:47.054727+00	2025-10-29 13:49:47.20209+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	112fd71d-fef9-4b4b-ad91-74f2fe211947	authenticated	authenticated	semina.a.v@su10.ru	$2a$10$LVwJjOX6Rut660OSMyEclu9GgFTLIKwLqChwWBgS1sCj1f7xeJ02y	2025-10-29 13:16:22.338185+00	\N		\N		\N			\N	2025-10-29 13:16:22.341777+00	{"provider": "email", "providers": ["email"]}	{"sub": "112fd71d-fef9-4b4b-ad91-74f2fe211947", "email": "semina.a.v@su10.ru", "display_name": "Сёмина", "email_verified": true, "phone_verified": false}	\N	2025-10-29 13:16:22.332632+00	2025-10-29 15:12:24.019071+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	32265ce5-8681-4ae5-99b1-2b81210e9522	authenticated	authenticated	muha.m.u@su10.ru	$2a$10$284fZ9z1hXIfcWZf.WU7JOsenOJGc4He8UanHq.9InYeNWtYKXgeq	2025-10-30 06:09:46.284455+00	\N		\N		\N			\N	2025-10-30 06:09:46.308313+00	{"provider": "email", "providers": ["email"]}	{"sub": "32265ce5-8681-4ae5-99b1-2b81210e9522", "email": "muha.m.u@su10.ru", "display_name": "Муха Мария", "email_verified": true, "phone_verified": false}	\N	2025-10-30 06:09:46.096179+00	2025-10-30 06:09:46.367291+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	990cf9a6-88ab-465c-a280-b51c0467aeb9	authenticated	authenticated	postoev.e.v@su10.ru	$2a$10$ptAZJGcQLTXHaHfkp7nnmeeVetV8Cu8jkUU0.Kmv2rd35zJGZYClC	2025-10-29 12:23:00.20756+00	\N		\N		\N			\N	2025-10-31 07:58:33.689817+00	{"provider": "email", "providers": ["email"]}	{"sub": "990cf9a6-88ab-465c-a280-b51c0467aeb9", "email": "postoev.e.v@su10.ru", "display_name": "Постоев", "email_verified": true, "phone_verified": false}	\N	2025-10-29 12:23:00.188505+00	2025-10-31 12:11:05.403572+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	authenticated	authenticated	eugsu10@gmail.com	$2a$10$ycLTAeppx6j9uZ6OSL3EOOil5iKV.HJJkMzBWoZqTvwNmW3B8Laoa	2025-10-23 13:36:30.71992+00	\N		\N		\N			\N	2025-10-30 17:51:46.566669+00	{"provider": "email", "providers": ["email"]}	{"email_verified": true}	\N	2025-10-23 13:36:30.688124+00	2025-10-31 14:01:12.652583+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	3c0bc697-412f-42ef-8a9e-3c2a96286072	authenticated	authenticated	repnikov.i.a@su10.ru	$2a$10$JfFoCeRbdhDVAxoVoO8AK.rvLaYpn52xDsEQ2L9v0mNhm4pk6bKBe	2025-10-29 13:52:27.351681+00	\N		\N		\N			\N	2025-10-29 13:52:27.362361+00	{"provider": "email", "providers": ["email"]}	{"sub": "3c0bc697-412f-42ef-8a9e-3c2a96286072", "email": "repnikov.i.a@su10.ru", "display_name": "Игорь Репников ", "email_verified": true, "phone_verified": false}	\N	2025-10-29 13:52:27.305916+00	2025-10-29 13:52:27.383752+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	310087c1-ef51-4c13-9f65-e581845313fe	authenticated	authenticated	kazubov.a.a@su10.ru	$2a$10$25OoH7coxxgr7vijaRrEzewR7j2p8yOX2Zn.b9p2apy0WVe.Ma5Me	2025-10-29 13:13:37.029162+00	\N		\N		\N			\N	2025-10-29 13:13:37.043634+00	{"provider": "email", "providers": ["email"]}	{"sub": "310087c1-ef51-4c13-9f65-e581845313fe", "email": "kazubov.a.a@su10.ru", "display_name": "Казубов", "email_verified": true, "phone_verified": false}	\N	2025-10-29 13:13:36.975942+00	2025-10-31 09:06:00.147912+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	e96e699e-647d-4132-b8b5-e10db8e01021	authenticated	authenticated	kuzmin.a.a@su10.ru	$2a$10$jZ7yACnbedYrVjczums/4ujxcar372YD0xwqcmt.Bp0fGg6z/89v.	2025-10-31 06:26:19.493306+00	\N		\N		\N			\N	2025-10-31 06:26:19.505146+00	{"provider": "email", "providers": ["email"]}	{"sub": "e96e699e-647d-4132-b8b5-e10db8e01021", "email": "kuzmin.a.a@su10.ru", "display_name": "Кузьмин ", "email_verified": true, "phone_verified": false}	\N	2025-10-31 06:26:19.385913+00	2025-10-31 06:26:19.537003+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	adea9c9c-2d73-45b4-a801-e576e0b57f74	authenticated	authenticated	bondaruk.g.a@mstroy.pro	$2a$10$SBAISz.AFjvsO/4Io30OVOBR5.InAHdLuZOq6VXROss5WmlvD04BO	2025-10-30 12:27:37.915895+00	\N		\N		\N			\N	2025-10-30 12:27:37.926921+00	{"provider": "email", "providers": ["email"]}	{"sub": "adea9c9c-2d73-45b4-a801-e576e0b57f74", "email": "bondaruk.g.a@mstroy.pro", "display_name": "Бондарук Геннадий", "email_verified": true, "phone_verified": false}	\N	2025-10-30 12:27:37.830389+00	2025-10-31 10:22:10.539657+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	756adb06-f2d7-4113-9739-779afbd69643	authenticated	authenticated	karaseni.n.d@zakupka.pro	$2a$10$Wh.EdmOC4RNbWevW0JVoB.MDw4EUTx9ocoNW575JgqajGLMwfESUG	2025-10-30 11:27:43.588003+00	\N		\N		\N			\N	2025-10-30 11:27:43.603286+00	{"provider": "email", "providers": ["email"]}	{"sub": "756adb06-f2d7-4113-9739-779afbd69643", "email": "karaseni.n.d@zakupka.pro", "display_name": "Карасени Николай Демьянович", "email_verified": true, "phone_verified": false}	\N	2025-10-30 11:27:43.506778+00	2025-10-30 11:27:43.652332+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	d8c1330a-ae1a-407a-ad2c-897ab85102dd	authenticated	authenticated	999@mail.ru	$2a$10$aqtyh3j2wx3Y9qvJ38ek1eEQ1VqVAQnFtZ3O12f.ubefEFqqEs3RK	2025-10-30 12:36:05.206809+00	\N		\N		\N			\N	2025-10-30 12:36:05.216641+00	{"provider": "email", "providers": ["email"]}	{"sub": "d8c1330a-ae1a-407a-ad2c-897ab85102dd", "email": "999@mail.ru", "display_name": "Иванов", "email_verified": true, "phone_verified": false}	\N	2025-10-30 12:36:05.103634+00	2025-10-30 12:36:05.237766+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	f31006f1-ab3e-44e9-a0ae-27d0bfa53ac4	authenticated	authenticated	popov.a.n@su10.ru	$2a$10$XN.oVndYTXZVlQkkioJC.eGJkAJO9MOt2DM7iV9bfy6XXpYkhOlM.	2025-10-31 06:42:32.076772+00	\N		\N		\N			\N	2025-10-31 06:42:32.085503+00	{"provider": "email", "providers": ["email"]}	{"sub": "f31006f1-ab3e-44e9-a0ae-27d0bfa53ac4", "email": "popov.a.n@su10.ru", "display_name": "Попов", "email_verified": true, "phone_verified": false}	\N	2025-10-31 06:42:32.054747+00	2025-10-31 06:42:32.089016+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	0236a1d5-3f29-449e-9e60-bf908e5e7cf6	authenticated	authenticated	sadovnikov.d.y@su10.ru	$2a$10$jSy86KWv49qqyl6Aklrvbe1bEQfacqolLrFzmymqyLdMb4Hf1xqeG	2025-10-31 14:05:00.416696+00	\N		\N		\N			\N	2025-10-31 14:05:00.433475+00	{"provider": "email", "providers": ["email"]}	{"sub": "0236a1d5-3f29-449e-9e60-bf908e5e7cf6", "email": "sadovnikov.d.y@su10.ru", "display_name": "Садовников", "email_verified": true, "phone_verified": false}	\N	2025-10-31 14:05:00.347319+00	2025-10-31 14:05:00.464737+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	cde324d4-4ab5-448f-9544-45dbf515d12d	authenticated	authenticated	levimper@gmail.com	$2a$10$8pWsdWwJHeU1onGNfahSf.HP61JxY/R2jRAcb1AIQr1LM5yc3TO7W	2025-10-31 12:25:53.323222+00	\N		\N		\N			\N	2025-10-31 12:25:53.337019+00	{"provider": "email", "providers": ["email"]}	{"sub": "cde324d4-4ab5-448f-9544-45dbf515d12d", "email": "levimper@gmail.com", "display_name": "Некрасов", "email_verified": true, "phone_verified": false}	\N	2025-10-31 12:25:53.261263+00	2025-10-31 12:25:53.339375+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	dde5c3c7-8368-4df9-b12b-160ff2cc02ab	authenticated	authenticated	odintsov.su10@gmail.com	$2a$10$Bn4AW0fIG/kOx.GQxTttwOVf7M0tSBjp22np8IINzUsXBeV6DE/mC	2025-10-30 09:12:43.816711+00	\N		\N		\N			\N	2025-10-30 09:12:43.848836+00	{"provider": "email", "providers": ["email"]}	{"sub": "dde5c3c7-8368-4df9-b12b-160ff2cc02ab", "email": "odintsov.su10@gmail.com", "display_name": "Одинцов Артем", "email_verified": true, "phone_verified": false}	\N	2025-10-30 09:12:43.682583+00	2025-10-31 12:35:33.297379+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	98b67609-9822-4cb9-b2ed-14e3034c8559	authenticated	authenticated	admin@test.com	$2a$10$kXCdwKhJcHFAGsh.cwGSCe6MYTSjz8GsK0RQeuOJgVg1LstkvDVSu	2025-10-30 15:28:32.692418+00	\N		\N		\N			\N	2025-10-31 12:24:28.853771+00	{"provider": "email", "providers": ["email"]}	{"sub": "98b67609-9822-4cb9-b2ed-14e3034c8559", "email": "admin@test.com", "display_name": "admin@test.com", "email_verified": true, "phone_verified": false}	\N	2025-10-30 15:28:32.60289+00	2025-10-31 14:31:24.627622+00	\N	\N			\N		0	\N		\N	f	\N	f
\.


--
-- Data for Name: conversations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.conversations (id, user_id, title, created_at) FROM stdin;
e8ae58d2-9562-4c90-9227-c1e2d036e3ca	990cf9a6-88ab-465c-a280-b51c0467aeb9	можно ли использовать PP-R под стяжку, какие риски	2025-10-29 13:05:20.401241+00
907f6edc-7649-4201-8c55-102fc4743b27	f8d1b0bb-75b7-4c50-b431-a6c8ae17fe19	Представь комплект гребёнок отопления, т.е. одна г	2025-10-29 13:21:26.544114+00
ad63516a-1e13-4ee9-a6fc-ea90123da84f	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	насколько качественно Donut  работает в сравнении 	2025-10-29 14:25:06.881101+00
2e8f516d-5378-4964-a1b0-125c573354d1	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	насколько качественно Donut работает в сравнении с	2025-10-29 14:25:40.281524+00
a8a41fa3-a82d-413c-a003-4a0a016b00b7	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	насколько качественно Donut работает в сравнении с	2025-10-29 14:26:42.972062+00
c01cdcb3-76b8-4400-af04-5eac5fd3f512	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	насколько качественно Donut работает в сравнении с	2025-10-30 06:25:40.561364+00
5656f71c-c591-47b6-be10-afae5f2d4db2	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	погода сегодня в москве	2025-10-30 08:58:36.590708+00
fd4aa858-1674-4e59-b366-760567181780	dde5c3c7-8368-4df9-b12b-160ff2cc02ab	гКал для ИТП - это что?	2025-10-30 10:33:21.96969+00
f4a00c7f-cd36-48c2-9561-5dd8384240c1	f8e5ca55-75fd-419d-a30c-42ffa125d9d9	а	2025-10-30 10:45:07.342266+00
7682cfc0-7d6a-4026-8ce0-47d4da0c87de	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	Имеет ли право генподрядчик согласно текста догово	2025-10-30 12:05:58.807073+00
1cb201c2-d7c5-4acd-9a6a-a2af1e4f62ec	d8c1330a-ae1a-407a-ad2c-897ab85102dd	Напиши мне технологический стек для реализации кор	2025-10-30 12:40:59.809376+00
6ab653a3-c823-49eb-a183-b86a4d8681a7	adea9c9c-2d73-45b4-a801-e576e0b57f74	Может ли авторский надзор делать изменения рабочей	2025-10-30 12:48:30.947354+00
ffe86343-2893-43a2-8a96-6a2c4d99b7d1	adea9c9c-2d73-45b4-a801-e576e0b57f74	Может ли авторский надзор делать изменения рабочей	2025-10-30 12:51:00.145733+00
1551744a-b580-41a3-af69-3cd6acc19916	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	Имеет ли право генподрядчик согласно текста догово	2025-10-30 18:04:53.755072+00
0782f2cf-5664-45e8-80e7-3557030270c3	310087c1-ef51-4c13-9f65-e581845313fe	КИД-1 180x530-К-УХЛ2 К какому типу относится?	2025-10-31 04:46:20.52007+00
bec64280-8735-45f5-9d06-98d772333d05	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	отличие шаровых кранов от	2025-10-31 07:57:47.738553+00
7f4f2ece-4cc9-4f96-838f-609163c91b70	990cf9a6-88ab-465c-a280-b51c0467aeb9	отличие шаровых кранов от вентилей	2025-10-31 07:59:45.056567+00
de4e114b-761c-4a3b-b4d0-60ef9b6d1bc8	990cf9a6-88ab-465c-a280-b51c0467aeb9	какие краны долговечнее - шаровых или кранов с дис	2025-10-31 09:42:35.588376+00
1166c2f0-7544-4241-983d-7ddd0be62d78	990cf9a6-88ab-465c-a280-b51c0467aeb9	какие краны нужно использовать для газа - шаровые 	2025-10-31 10:43:05.26881+00
d9297b3c-0e35-4926-959d-92965b87d8d8	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	какие краны долговечнее - шаровых или кранов с дис	2025-10-31 10:43:22.23675+00
d2adfa9f-0732-4c6f-9459-552f86a55a88	990cf9a6-88ab-465c-a280-b51c0467aeb9	какие краны нужно использовать для газа - шаровые 	2025-10-31 11:58:03.103626+00
ec1d4e56-6330-442f-a3f7-fefc0c276c43	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	какие краны нужно использовать для газа - шаровые 	2025-10-31 11:58:14.671094+00
252e5acb-8893-4a7d-b2ee-164dfe42dc3a	98b67609-9822-4cb9-b2ed-14e3034c8559	какие краны нужно использовать для газа - шаровые 	2025-10-31 12:25:00.725743+00
\.


--
-- Data for Name: messages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.messages (id, conversation_id, user_id, role, content, model, token_count, created_at) FROM stdin;
5a88d7ef-97e0-43ba-bd54-49ed9acf74b0	e8ae58d2-9562-4c90-9227-c1e2d036e3ca	990cf9a6-88ab-465c-a280-b51c0467aeb9	user	можно ли использовать PP-R под стяжку, какие риски, как их минимизировать	\N	\N	2025-10-29 13:05:20.478672+00
31c1de40-1886-435c-8cd5-d7281073ab99	e8ae58d2-9562-4c90-9227-c1e2d036e3ca	990cf9a6-88ab-465c-a280-b51c0467aeb9	assistant	### Можно ли использовать PP-R трубы под стяжку?\n\nДа, полипропиленовые трубы (PP-R) часто используются в системах водяного теплого пола или для скрытой прокладки под стяжкой. Они подходят для этого благодаря хорошей стойкости к температурам (обычно до 70–95°C в зависимости от типа), давлению и коррозии. Однако это требует правильной установки в соответствии с нормами (например, СНиП или местными строительными стандартами). PP-R не предназначены для прямого контакта с агрессивными средами, но под стяжкой они обычно защищены.\n\n### Основные риски\n\n1. **Механические повреждения**:\n   - Трубы могут быть пробиты или сдавлены при заливке стяжки, укладке арматуры или из-за усадки бетона/раствора со временем. Это приводит к утечкам и затоплению.\n   - Риск усиливается на неровных основаниях или при неправильной фиксации.\n\n2. **Термическое воздействие**:\n   - Перегрев (температура выше предела PP-R, например, >95°C) может вызвать размягчение, деформацию или разрыв труб. В теплом поле риск ниже, но возможен при ошибках в системе отопления.\n   - Термическое расширение (коэффициент ~1,5×10⁻⁴ /°C) может привести к сдвигам труб, если они не зафиксированы, вызывая напряжения в стяжке и трещины.\n\n3. **Химическое и влажностное воздействие**:\n   - Цементная стяжка щелочная (pH 12–13), что теоретически может вызвать медленную деградацию пластика, хотя PP-R относительно устойчив. Влажность от стяжки может способствовать конденсату или коррозии соединений.\n   - Утечки воды из труб ускоряют деградацию стяжки или топлива для плесени.\n\n4. **Проблемы с гидроизоляцией и давлением**:\n   - Неправильное давление при испытаниях или эксплуатации может вызвать разрывы. Также риск конденсации или промерзания в холодных зонах.\n\n5. **Долгосрочные риски**:\n   - Снижение прочности со временем (PP-R служит 25–50 лет, но под нагрузкой стяжки — меньше). В случае ремонта стяжки трубы трудно достать без разрушения.\n\n### Как минимизировать риски\n\n1. **Подготовка и фиксация**:\n   - Зафиксируйте трубы на арматурной сетке (ячейка 10–15 см) или с помощью пластиковых клипс/рельсов с шагом 30–50 см. Это предотвратит сдвиги. Минимальный радиус изгиба — 5–8 диаметров трубы (обычно 16–32 мм для теплого пола).\n   - Укладывайте трубы на ровное основание с теплоизоляцией (например, пенополистирол 20–50 мм) и гидроизоляционной пленкой, чтобы избежать контакта с влагой.\n\n2. **Контроль температуры и давления**:\n   - Используйте трубы с маркировкой PN20 или выше для теплого пола. Температура теплоносителя не должна превышать 55–60°C (максимум 70°C). Установите термостаты и смесительные узлы для контроля.\n   - Перед заливкой проведите гидравлическое испытание: заполните систему водой под давлением 1,5–2 раза выше рабочего (минимум 6 бар), держите 24 часа. Не заливайте стяжку, если есть протечки.\n\n3. **Укладка стяжки**:\n   - Толщина стяжки над трубой — минимум 50–65 мм (общая — 65–100 мм), чтобы распределить нагрузку. Используйте армированный раствор (фиброволокно или сетку) с пластификаторами для снижения усадки.\n   - Заливайте стяжку осторожно: избегайте ударов вибраторами по трубам, работайте при +5…+25°C. После заливки дайте стяжке схватиться 28 дней перед запуском системы.\n\n4. **Дополнительные меры**:\n   - Выберите сертифицированные трубы от надежных производителей (с гарантией) и используйте фитинги с пресс-соединениями для надежности.\n   - Обеспечьте демпферные швы по периметру (10–15 мм) для компенсации расширения стяжки.\n   - Для химической защиты оберните трубы в защитную оболочку (например, алюминиевую ленту для теплого пола) или используйте PP-R с антидиффузионным слоем.\n   - Регулярно проверяйте систему: ежегодно на утечки и давление.\n\n**Важно**: Это общие рекомендации на основе стандартных практик (например, из руководств по теплому полу от производителей как Uponor или аналогичных). Для конкретного проекта обязательно проконсультируйтесь с инженером или специалистом по сантехнике — неправильная установка может привести к дорогостоящему ремонту. Если вы в России, ориентируйтесь на СП 60.13330.2016 или аналогичные нормативы. Если нужны детали по конкретному типу PP-R, уточните!	\N	\N	2025-10-29 13:05:33.293836+00
f53737b7-3bc2-4141-aef6-07a6dd90586f	907f6edc-7649-4201-8c55-102fc4743b27	f8d1b0bb-75b7-4c50-b431-a6c8ae17fe19	user	Представь комплект гребёнок отопления, т.е. одна гребёнка подающая, вторая гребёнка обратная. Вопрос: теплосчётчики отопления должны ставиться на контуры подающей гребёнки или на контуры обратной гребёнки? Или оба варианта возможны?	\N	\N	2025-10-29 13:21:26.626217+00
281374cc-77d9-4a1f-a8d0-26de8bf57ccd	907f6edc-7649-4201-8c55-102fc4743b27	f8d1b0bb-75b7-4c50-b431-a6c8ae17fe19	assistant	### Установка теплосчётчиков в системе с гребёнками отопления\n\nВ системах отопления с гребёнками (манifolds) — подающей (для распределения горячего теплоносителя) и обратной (для сбора остывшего теплоносителя) — теплосчётчики (тепло- и расходомеры) предназначены для учёта потребления тепла по каждому контуру (ветке). Они рассчитывают тепловую энергию по формуле:  \n**Q = V × ρ × c × (T_подача - T_обратка)**,  \nгде V — объём теплоносителя, ρ — плотность, c — удельная теплоёмкость, T — температуры.\n\nВопрос о размещении касается именно места установки **счётчиков расхода** (механических, ультразвуковых или электромагнитных), так как датчики температуры обычно ставятся на обе гребёнки (подачу и обратку) для измерения ΔT.\n\n#### Стандартная практика и рекомендации\n- **Предпочтительно и чаще всего — на контуры подающей гребёнки.**  \n  Почему?  \n  - Подающий контур имеет более стабильный поток и температуру, что упрощает калибровку и минимизирует ошибки измерений (например, от воздушных пробок или осадков в обратке).  \n  - В подающем контуре расход теплоносителя напрямую отражает потребление нагрева, без влияния "посторонних" факторов, как смешивание потоков в обратке.  \n  - По нормам РФ (СП 60.13330.2020 "Отопление, вентиляция и кондиционирование воздуха", а также методикам Росстандарта для приборов учёта тепла, ГОСТ Р 51649-2000), для индивидуального учёта в жилых и коммерческих объектах с закрытыми контурами рекомендуется установка счётчика расхода на подачу. Это стандарт для двухтрубных систем с гребёнками (например, в многоквартирных домах или офисах).  \n  - Пример: В типовых узлах учёта (как от производителей типа Danfoss или Valtec) счётчик ставится сразу после гребёнки подачи, перед радиатором или теплообменником.\n\n- **На контуры обратной гребёнки — возможно, но реже и с оговорками.**  \n  - Это допустимо в случаях, когда подающий контур недоступен для монтажа (например, из-за конструктивных особенностей) или в системах с низкотемпературным режимом (где обратка "чище" по потоку).  \n  - Однако, на обратке могут возникать проблемы: неравномерный поток из-за термосифона, накопления грязи или воздуха, что снижает точность (ошибка до 5-10% по данным испытаний).  \n  - Нормы не запрещают, но требуют дополнительной верификации (п. 7.3 Приказа Минстроя РФ № 246/пр от 2017 г. о приборах учёта). В ЕС (директива 2012/27/EU) аналогично — предпочтение подаче.\n\n- **Оба варианта возможны? Да, но не одновременно для одного контура.**  \n  - Установка счётчиков на обе гребёнки не требуется и даже избыточна, так как расход в замкнутой системе равен (если нет утечек). Достаточно одного счётчика расхода + пары датчиков температуры на подаче и обратке.  \n  - В редких случаях (для суперточного мониторинга, например, в промышленных системах) ставят два счётчика (на подачу и обратку) для контроля баланса, но это не норма для бытового/коммерческого учёта и увеличивает стоимость (на 30-50%).  \n  - Важно: Независимо от места, приборы должны быть сертифицированы (класс точности не ниже 2 по MID или ОИМЛ R75), а установка — лицензированной организацией с последующей поверкой.\n\n#### Рекомендации по выбору и монтажу\n- **Выберите тип счётчика:** Для гребёнок подойдут компактные ультразвуковые (например, Kamstrup MULTI, точность ±2%) или турбинные (еваные лопастные), совместимые с трубами 15-32 мм.  \n- **Расположение в контуре:** Счётчик — на прямом участке трубы (min. 3D до и 1D после, где D — диаметр), с фильтром и запорной арматурой. Избегайте поворотов.  \n- **Нормативка:** Проверьте локальные правила (в РФ — через управляющую компанию или "Теплосеть"). Для многоквартирки требуется согласие на общедомовой учёт (ФЗ-261 "Об энергосбережении").  \n- **Стоимость и окупаемость:** Установка на подачу проще и дешевле (от 5-15 тыс. руб. за контур), окупается за 1-2 сезона за счёт точного учёта.\n\nЕсли у вас конкретная схема системы (тип здания, диаметры труб), могу дать более точные советы. Рекомендую консультацию с инженером по отоплению для проекта!	\N	\N	2025-10-29 13:21:38.48667+00
cb62403c-5566-4230-ba90-49e2f1814bc7	907f6edc-7649-4201-8c55-102fc4743b27	f8d1b0bb-75b7-4c50-b431-a6c8ae17fe19	user	Представь комплект гребёнок отопления, т.е. одна гребёнка подающая, вторая гребёнка обратная. Вопрос: теплосчётчики отопления должны ставиться на контуры подающей гребёнки или на контуры обратной гребёнки? Или оба варианта возможны?	\N	\N	2025-10-29 13:22:54.416718+00
f775aee5-82e2-4263-8403-19d2bb58dc01	907f6edc-7649-4201-8c55-102fc4743b27	f8d1b0bb-75b7-4c50-b431-a6c8ae17fe19	assistant	Коротко — предпочтительно ставить счётчик (расходомер) на контур подающей гребёнки. Температурные датчики при этом ставят на подаче и на обратке, чтобы получить ΔT.\n\nПочему:\n- Подающий поток более стабильный по температуре и направлению — меньше ошибок от завоздушивания, обратных течений и отложений.\n- Нормативно и практично: в типовых узлах учёта расход обычно измеряют на подаче.\n- В замкнутой системе расход на подаче и на обратке теоретически равен, но в реальности на обратке чаще бывают искажения (воздух, грязь, местные смешения), снижающие точность.\n\nВозможность поставить на обратку:\n- Допустимо, если по монтажным причинам подача недоступна. Но нужно предусмотреть удаление воздуха, фильтр и достаточные прямые участки — иначе точность падает.\n- Установка на обе гребёнки (два расходомера на одном контуре) избыточна и редко применяется — только для контроля баланса в специальных случаях.\n\nРекомендация:\n- Ставьте расходомер на подачу каждого контура + датчики температуры на подаче и обратке.\n- При невозможности — на обратку с дополнительными мерами по обеспечению качества потока.\nЕсли пришлёте схему гребёнок (диаметры, расположение кранов/фильтров), подскажу оптимальное место для установки и требуемые прямые участки.	\N	\N	2025-10-29 13:23:02.555374+00
978adf0d-c796-4b3b-8395-975a8d0777e3	ad63516a-1e13-4ee9-a6fc-ea90123da84f	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	user	насколько качественно Donut  работает в сравнении с классическими OCR моделями, какие по сравнению с ними достоинства и недостатки. В каких случаях целесообразно её использовать	\N	\N	2025-10-29 14:25:06.977431+00
e6849017-496f-4e88-8f92-63126a3606a9	ad63516a-1e13-4ee9-a6fc-ea90123da84f	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	assistant	### Сравнение Donut с классическими OCR-моделями\n\nDonut (Document Understanding Transformer) — это end-to-end нейронная модель (разработана NAVER Clova в 2022 году), которая сочетает компьютерное зрение и обработку естественного языка для понимания документов. В отличие от классических OCR (Optical Character Recognition), таких как Tesseract, EasyOCR или PaddleOCR, которые фокусируются на распознавании текста как последовательности символов, Donut работает целиком на изображениях и напрямую выводит структурированную информацию (например, в формате JSON). Это делает её частью более широкого класса моделей для Document AI.\n\nЯ опираюсь на результаты исследований (например, оригинальную бумагу Donut и бенчмарки на датасетах вроде CORD, FUNSD, RVL-CDIP), а также практические тесты сообщества (Hugging Face, GitHub). Вот детальный разбор.\n\n#### Качество работы в сравнении с классическими OCR\n- **Общая точность**: Donut часто превосходит классические OCR в задачах, где нужен не просто текст, а понимание структуры (layout-aware OCR). Например:\n  - На датасете CORD (receipts) Donut достигает F1-score ~0.95 для ключевых полей (название, цена, дата), в то время как Tesseract + пост-обработка (например, с regex) даёт ~0.80–0.85.\n  - Для форм и таблиц (FUNSD) — Donut ~0.85–0.90, классические OCR ~0.70–0.80 без дополнительного парсинга.\n  - Для простого печатного текста (IAM, ICDAR) классические модели вроде EasyOCR дают accuracy >95%, а Donut — ~90–95%, но с меньшей ошибкой в noisy изображениях.\n- **Слабости в качестве**: Donut хуже справляется с очень длинными текстами или редкими шрифтами/языками (обучена преимущественно на английском и латинице). Классические OCR более robust к вариациям шрифтов благодаря правилам и традиционным алгоритмам.\n- **Влияние качества изображения**: Donut устойчива к шуму, поворотам и низкому разрешению (благодаря transformer-архитектуре), но требует GPU для inference. Классические OCR работают на CPU и быстрее, но чувствительны к артефактам (нужно предобработку).\n\nВ целом, Donut "качественнее" для семантического понимания (не просто текст, а entities), но для raw text extraction классика может быть на равных или лучше по скорости и простоте.\n\n#### Достоинства Donut по сравнению с классическими OCR\n1. **End-to-end обработка**: Нет нужды в отдельном OCR + парсинге (NLP). Donut сразу извлекает структурированные данные (ключ-значение, таблицы), что снижает ошибки от цепочки шагов. Классика даёт сырой текст, требующий regex или ML для структуризации.\n2. **Понимание контекста и layout**: Хорошо работает с формами, чеками, контрактами, где текст связан с позицией (bounding boxes). Классические OCR игнорируют layout, что приводит к хаосу в сложных документах.\n3. **Меньше пред- и пост-обработки**: Автоматически справляется с handwritten text, skewed изображениями и multi-language (частично). Это упрощает пайплайн.\n4. **Масштабируемость**: Легко fine-tune на custom датасетах (Hugging Face), интегрируется с LLMs для дальнейшего анализа.\n5. **Открытость**: Open-source, предобученные модели доступны, и она outperforming в бенчмарках Document AI (например, на PubLayNet для layout detection).\n\n#### Недостатки Donut по сравнению с классическими OCR\n1. **Вычислительная сложность**: Требует GPU/TPU (модель ~200M параметров), inference медленнее (1–5 сек/изображение vs. <1 сек для Tesseract). Не подходит для edge-устройств или больших объёмов без оптимизации.\n2. **Ограниченная обобщаемость**: Обучена на специфических датасетах (receipts, forms), хуже на arbitrary документах (книги, сканы газет). Классические OCR более универсальны и поддерживают 100+ языков out-of-box.\n3. **Точность в edge-кейсах**: Может "галлюцинировать" поля в noisy данных или пропускать мелкий текст. Для чистого текста (без структуры) она избыточна и менее точна, чем специализированные OCR.\n4. **Размер и зависимость**: Большие модели (Donut-base/mimic ~1–2 GB), требует PyTorch/TensorFlow. Классика лёгкая (Tesseract <50 MB) и standalone.\n5. **Стоимость fine-tuning**: Для адаптации под домен нужно много labeled данных; классические OCR проще тюнить правилами.\n\n#### В каких случаях целесообразно использовать Donut\n- **Структурированные документы**: Идеально для автоматизации обработки форм, invoices, receipts, ID-карт, где нужен extraction ключевых entities (date, amount, name). Пример: банковские приложения для парсинга чеков — экономит время на пост-обработку.\n- **Комплексные layout**: Когда текст + визуальные элементы (таблицы, подписи) важны, и классический OCR даёт "кашу". Полезно в legal tech, healthcare (медицинские формы) или e-commerce.\n- **End-to-end системы**: Если вы строите pipeline с AI (интеграция с GPT для Q&A над документами), Donut упрощает всё.\n- **Noisy или varied input**: Для handwritten, rotated или low-res сканов, где Tesseract fails без усилий.\n- **Избегать, если**: Задача — простой текст из книг/статей (лучше EasyOCR), реал-тайм на мобильных (классика), или бюджет на compute низкий. Для mixed задач комбинируйте: OCR для текста + Donut для структуры.\n\nЕсли нужно, рекомендую протестировать на Hugging Face (модель "naver-clova-ix/donut-base"). Для русскоязычных документов может потребоваться fine-tuning, так как базовая версия слаба на кириллице. Если у вас конкретный use-case, уточните!	\N	\N	2025-10-29 14:25:22.191098+00
7f604069-ba2b-4bcb-91d7-e6c625ff9049	2e8f516d-5378-4964-a1b0-125c573354d1	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	user	насколько качественно Donut работает в сравнении с классическими OCR моделями, какие по сравнению с ними достоинства и недостатки. В каких случаях целесообразно её использовать	\N	\N	2025-10-29 14:25:40.37074+00
1981a83c-998c-4837-9817-a99302e73eb9	2e8f516d-5378-4964-a1b0-125c573354d1	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	assistant	Коротко — Donut (Document Understanding Transformer, «без OCR») в ряде задач документного понимания даёт значительно более удобный и в ряде случаев более точный результат, чем классическая связка OCR → NLP/IE, но у него есть свои ограничения и требования. Ниже — систематизированное сравнение и практические рекомендации.\n\nЧто такое Donut (в пару слов)\n- Это визуально-ориентированный encoder–decoder (визуальный энкодер + автогенеративный декодер), который принимает картинку документа и генерирует текстовую последовательность (обычно в форме шаблонизированного/JSON-подобного вывода). Он не использует отдельный OCR-модуль — распознавание и семантическое разбор выполняются в едином нейронном процессе.\n\nДостоинства по сравнению с классическим OCR + downstream\n- End-to-end извлечение семантики: сразу выдаёт структурированный результат (JSON, ключ-значение, поля), не требует отдельной логики для связывания распознанных слов с полями.\n- Учитывает визуальный контекст и оформление (шрифты, расположение, рамки, таблицы) в одном шаге — это помогает при документонах с нестандартной вёрсткой и шумом.\n- Более устойчив к шуму/искажениям/сложным фонam, художественным шрифтам и частично к рукописи (в зависимости от дообучения).\n- Меньше инженерных компонентов и точек отказа — нет необходимости настраивать и стыковать OCR + парсер + нормализацию.\n- Часто даёт лучшее качество для задач извлечения полей (invoices, receipts, forms, KYC), где важен именно семантический вывод, а не дословный транскрипт.\n- Легко тренировать на целевых шаблонах: цельный таргет (например, JSON) simplifies supervision.\n\nНедостатки и ограничения\n- Характер ошибок — генеративные (галлюцинации, форматные ошибки в выводе). Может «придумать» значение или грамотно переформатировать текст вместо буквальной копии.\n- Меньшая гарантия посимвольной точности: если вам нужно 100% точный посимвольный транскрипт (например, серийные номера, юридически значимые тексты), специализированные OCR часто лучше.\n- Нет прямых координат/границ текста: если нужны bounding box’ы для аннотаций, визуального подсвета или привязки к оригиналу — классический OCR необходим или нужно комбинировать.\n- Требует значительных ресурсов: большие модели, GPU-инференс; медленнее и тяжелее для edge/CPU.\n- Зависимость от предобучения и токенизации: языковые ограничения — если язык не встречался при предобучении или токенайзер плохо подходит, качество падает; требует дообучения на целевом языке/домене.\n- Ограничения по длине вывода: длинные документы/многостраничные сканы сложнее обрабатывать напрямую.\n- Могут появляться проблемы с инвариантностью к плотности текста (много мелких фрагментов/таблиц) — иногда хуже парсинга табличных данных, чем специализированные табличные парсеры.\n\nКогда целесообразно использовать Donut\n- Нужно извлечь структурированные поля (invoices, receipts, forms, анкеты, квитанции) и вы хотите минимизировать инженерную интеграцию OCR+парсер.\n- Документы с нестандартной разметкой/визуальными подсказками, где визуальный контекст важен (печати, рамки, расположение поля).\n- Когда вы готовы дообучить модель на небольшом количестве целевых примеров (пара сотен–тысяч аннотаций) для повышения качества.\n- Когда вам важна скорость разработки (меньше компонентов, быстрее прототипирование).\n- Для мультиязычных/шумных документов — при условии, что модель была предобучена или дообучена на этих языках.\n\nКогда лучше не использовать Donut (выбрать классический OCR или гибрид)\n- Нужен абсолютно точный посимвольный транскрипт, с сохранением всех символов и координат (архивные тексты, юридические документы, OCR для индексации).\n- Требуется подсветка/выделение на изображении (bounding boxes) или дальнейшая визуальная разметка.\n- Ограниченные вычислительные ресурсы / inference на CPU или edge-устройствах.\n- Очень большие многостраничные документы/книги — традиционные OCR + постобработка работают эффективнее по производительности и полноте.\n- Регуляторные требования к объяснимости/валидации, где генеративные модели трудно сертифицировать.\n\nПрактические варианты использования и гибридные подходы\n- Гибрид: использовать OCR для полного текста и индексации, а Donut — для выделения и валидации структурированных полей. Можно сверять результаты Donut с OCR-посимвольным выводом.\n- Ensemble: при критической точности запускать и Donut, и OCR-парсер, затем применять правила/высокоуровневую логику для выбора / проверки значений.\n- Дообучение на целевом наборе примеров: Donut обычно выигрывает при даже небольшом количестве размеченных реальных документов.\n- Валидация: добавьте пост-валидацию на уровне схемы (форматы дат, ИНН, суммы) чтобы уменьшить галлюцинации.\n\nПрактические советы по внедрению\n- Перед разворачиванием протестируйте на реальных образцах: Donut может вести себя очень по-разному в зависимости от домена и качества сканов.\n- Если нужен язык, которого не было при предобучении — обязательно дообучайте с реальными примерами.\n- Для критичных полей используйте правило проверки/слепую сверку с OCR-результатом.\n- Планируйте GPU-инференс и подсчитайте latency/costs; для high-throughput систем возможно потребуется оптимизация/квантизация или комбинация решений.\n\nКороткий итог\n- Donut отлично подходит для end‑to‑end семантического извлечения из документов, упрощает пайплайн и часто даёт лучшее качество на задачах извлечения полей. Но если вам нужна максимальная посимвольная точность, координаты или экономия ресурсов — классический OCR (или гибридный подход) остаётся предпочтительным.\n\nЕсли хотите, могу:\n- Сравнить Donut с конкретной OCR-системой (Tesseract/PaddleOCR/Google OCR) на ваших примерах;\n- Подобрать стратегию (чистый Donut / гибрид) и оценить требования к данным для дообучения под ваш кейс.	\N	\N	2025-10-29 14:26:20.607359+00
867dd54b-8680-4c8a-a204-38828faef3f4	a8a41fa3-a82d-413c-a003-4a0a016b00b7	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	user	насколько качественно Donut работает в сравнении с классическими OCR моделями, какие по сравнению с ними достоинства и недостатки. В каких случаях целесообразно её использовать	\N	\N	2025-10-29 14:26:43.039496+00
5df5cc0a-2d30-4fbc-8893-fb4989c71b0a	a8a41fa3-a82d-413c-a003-4a0a016b00b7	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	assistant	Кратко: Donut — это “OCR‑free” модель для понимания документов: она сразу генерирует целевой ответ (например JSON с полями) из изображения, минуя этапы детекции и распознавания текста. На задачах извлечения ключевой информации и документного VQA Donut часто догоняет или превосходит классические пайплайны “детекция+OCR+правила/ML”. Но если нужна точная построчная транскрипция произвольных документов, классическое OCR чаще стабильнее.\n\nСравнение по качеству\n- Где Donut силён:\n  - KIE на ограниченных типах документов (чеки, счета, формы) после целевого дообучения: меньше каскадных ошибок, лучше устойчивость к шуму, наклонам, сложной верстке.\n  - Документное VQA и “полу‑структурные” поля, когда важен смысл, а не посимвольная точность.\n  - Нестандартные шрифты/раскладки, смешанная типографика: отсутствие жёсткой завязки на детектор боксов иногда даёт выигрыш.\n- Где классическое OCR сильнее:\n  - Точная посимвольная транскрипция длинных и разнообразных документов, создание “поисковых PDF”.\n  - Очень мелкий текст, многостраничные пакеты, юридические/финансовые кейсы с требованием бит‑в‑бит точности.\n  - Богатое покрытие языков “из коробки” (коммерческие OCR/движки наподобие ABBYY/Google Vision/PaddleOCR).\n\nПлюсы Donut\n- End‑to‑end: одна модель вместо нескольких стадий, меньше хрупкости и ручных правил.\n- Выдаёт сразу структурированный результат (например JSON с полями и таблицами), проще интегрировать в бизнес‑логики.\n- Хорошо дообучается на домен: десятки–пары тысяч размеченных документов часто дают существенный прирост.\n- Робастность к артефактам скана, перспективе, частично к рукописному (если было в обучении).\n\nМинусы Donut\n- Не универсальный “OCR”: без дообучения под ваш формат качество может сильно просесть.\n- Хуже посимвольная точность и воспроизводимость формата (пробелы, переносы, знаки), что критично для юридической транскрипции.\n- Масштаб и вычисления: обычно нужен GPU; на CPU латентность заметно выше, чем у лёгких OCR.\n- Мультистраничные документы и очень длинный контент требуют дополнительной обвязки (постраничная обработка, агрегация контекста).\n- Языковая поддержка зависит от данных обучения; для кириллицы чаще нужен дообучающий датасет.\n\nКогда целесообразно использовать Donut\n- Извлечение полей/таблиц из повторяющихся типов документов (чеки, инвойсы, товарные накладные, формы, ID) — особенно если текущий OCR+правила пайплайн хрупок.\n- Документное QA: ответить на вопрос по странице (сумма, дата, адрес, тариф).\n- Когда документный шум высокий и OCR часто ошибается на детекции/разрезке.\n- Если важнее семантически корректные поля, а не посимвольная точность.\n\nКогда лучше остаться на классическом OCR (или гибриде)\n- Нужна полная текстовая копия для поиска/архивации, юридическая точность, сложная многостраничность.\n- Очень широкий зоопарк шаблонов “из ниоткуда” без возможности дообучения.\n- Требования к низкой задержке/CPU-инференсу и отсутствию GPU.\n\nПрактические рекомендации\n- Старт: возьмите открытый чекпойнт Donut и дообучите на 500–2000 размеченных страниц под ваш формат (аннотации в виде целевого JSON). Добавьте аугментации скана.\n- Метрики: для KIE оценивайте F1 по полям/строкам таблицы; для транскрипции — CER/WER и сравните с OCR.\n- Инфраструктура: делайте постраничную обработку, валидируйте критичные поля правилами; для отказоустойчивости держите fallback через OCR на трудных случаях.\n- Языки: для кириллицы и локальных форматов целенаправленное дообучение почти всегда оправдано.\n\nИтог: Donut — отличный выбор как “парсер документов” для конкретных задач извлечения и вопросов‑ответов, где важна семантика и простота пайплайна. Для универсального, точного посимвольного OCR по произвольным документам классические решения остаются надёжнее. Лучше всего показывает себя в гибриде: Donut для извлечения ключевых полей, OCR — для полной транскрипции и валидации.	\N	\N	2025-10-29 14:27:47.546523+00
7d882d8a-3f95-4a0c-b864-86352d8bf1d1	c01cdcb3-76b8-4400-af04-5eac5fd3f512	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	user	насколько качественно Donut работает в сравнении с классическими OCR моделями, какие по сравнению с ними достоинства и недостатки. В каких случаях целесообразно её использовать	\N	\N	2025-10-30 06:25:40.622917+00
da6785b8-70cb-414e-a22c-a792fce2c3ff	c01cdcb3-76b8-4400-af04-5eac5fd3f512	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	assistant	Отличный вопрос! Сравнение Donut с классическими OCR-моделями — это, по сути, сравнение двух разных поколений и подходов к обработке документов. Давайте разберем все по полочкам.\n\nЕсли кратко: **Donut — это не просто "лучший OCR", это принципиально иной подход.** Классический OCR распознает текст, а Donut *понимает* документ целиком.\n\n---\n\n### Что такое Классический OCR?\n\nЭто **двухэтапный конвейер (pipeline)**:\n1.  **Обнаружение и распознавание текста (OCR):** Сначала система (например, Tesseract, ABBYY FineReader) находит на изображении текстовые блоки и распознает в них символы. На выходе мы получаем "сырой" текст с координатами.\n2.  **Извлечение информации (Information Extraction):** Затем поверх этого текста запускается второй модуль. Он использует регулярные выражения, ключевые слова, шаблоны или даже простые модели машинного обучения, чтобы найти нужные поля (например, "найти строку, где есть слово 'Итого' и взять число после него").\n\n**Пример:** На чеке сначала распознается весь текст, а потом отдельный скрипт ищет в этом тексте строки "ИТОГО:", "ДАТА:", "ООО Ромашка" и извлекает нужные значения.\n\n---\n\n### Что такое Donut (Document Understanding Transformer)?\n\nЭто **сквозная (end-to-end) модель**, основанная на архитектуре Transformer, без явного этапа OCR.\n\n*   **Как это работает:** Donut "смотрит" на изображение документа (как на картинку) и сразу генерирует структурированный результат (обычно в формате JSON) в соответствии с вашим запросом. Модель одновременно учится "читать" и "понимать" пространственную структуру документа.\n*   **"OCR-free":** Ей не нужен предварительно распознанный текст. Она напрямую преобразует пиксели в семантически значимые токены.\n\n**Пример:** Вы даете Donut изображение чека и "задание" (prompt) в виде `{"total": "", "date": "", "company": ""}`. Модель смотрит на чек и напрямую заполняет эту структуру: `{"total": "1450.00", "date": "12.10.2023", "company": "ООО Ромашка"}`.\n\n---\n\n### Сравнение Качества и Производительности\n\n| Критерий | Классический OCR (конвейер) | Donut (end-to-end модель) |\n| :--- | :--- | :--- |\n| **Точность распознавания текста** | **Высокая** на "чистых" документах (книги, статьи). Эти движки оттачивались десятилетиями. | **Может быть ниже** на простом тексте. Её сила не в посимвольной точности, а в понимании контекста. |\n| **Понимание структуры документа** | **Низкое или отсутствует.** Модель не понимает, что "Имя" и "Иванов" — это пара "ключ-значение". Это задача второго этапа (парсера). | **Высокое.** Это её ключевое преимущество. Она понимает взаимосвязи между элементами благодаря визуальному энкодеру (Swin Transformer). |\n| **Устойчивость к изменениям в верстке** | **Низкая.** Если в шаблоне чека поставщик сместит поле "Итого" в другое место, парсер на основе правил или координат сломается. | **Высокая.** Модель меньше зависит от точного положения элементов и больше ориентируется на их визуальный и семантический контекст. |\n| **Обработка сложных документов (таблицы, формы)** | **Сложно и ненадежно.** Требует сложных правил для анализа таблиц, объединения ячеек и т.д. | **Гораздо эффективнее.** Модель способна "видеть" границы таблиц и правильно соотносить строки и столбцы. |\n\n---\n\n### Достоинства и Недостатки\n\n#### Donut: Достоинства\n\n1.  **Целостность (End-to-End):** Один шаг вместо двух. Это упрощает архитектуру, уменьшает количество кода и точек отказа. Ошибка OCR не "каскадируется" в парсер.\n2.  **Понимание верстки (Layout Awareness):** Умеет анализировать пространственное расположение текста, что критически важно для счетов, форм и анкет.\n3.  **Гибкость:** Легко адаптируется (fine-tuning) под любой тип документа и любую структуру JSON, которую вы хотите получить. Не нужно писать новые регулярные выражения для каждого нового типа счета.\n4.  **Отсутствие шаблонов:** Не требует жестко заданных шаблонов. Это делает решение масштабируемым и устойчивым к изменениям в дизайне документов.\n5.  **Возможность Zero-shot:** Может пытаться извлекать данные даже из документов, которые не видела во время обучения, просто по текстовому "заданию" (prompt).\n\n#### Donut: Недостатки\n\n1.  **Вычислительная сложность:** Требует значительных ресурсов (GPU) как для обучения, так и для инференса (работы). Классический OCR + парсер могут быть гораздо "легче".\n2.  **Требовательность к данным для дообучения:** Для достижения высокой точности на специфических документах (например, российских бухгалтерских актах) требуется собрать и разметить датасет (пары "изображение -> JSON"). Это может быть трудоемко.\n3.  **"Черный ящик":** Сложнее отлаживать. Если модель ошиблась, не всегда очевидно, почему. В случае с парсером на правилах вы точно видите, какое правило не сработало.\n4.  **Качество распознавания "сырого" текста:** Если ваша задача — просто оцифровать книгу, где нет сложной структуры, классический OCR, скорее всего, даст более точный текстовый результат с меньшими затратами.\n\n---\n\n### В каких случаях целесообразно использовать Donut?\n\n**Donut — идеальный выбор, если ваша задача — не просто "прочитать текст", а "извлечь структурированную информацию".**\n\n**Основные сценарии:**\n\n1.  **Обработка полуструктурированных документов:**\n    *   **Счета-фактуры, чеки, квитанции:** Извлечение поставщика, даты, списка товаров, суммы, НДС.\n    *   **Заказы на покупку (Purchase Orders):** Анализ позиций, количества, цен.\n    *   **Паспорта, водительские удостоверения:** Извлечение ФИО, даты рождения, номера документа.\n    *   **Страховые и медицинские формы:** Заполнение анкет на основе сканов.\n    *   **Результаты лабораторных анализов:** Извлечение показателей и их значений в виде таблицы.\n\n2.  **Когда документы поступают от разных поставщиков:** У всех поставщиков счета выглядят по-разному. Donut справится с этим разнообразием гораздо лучше, чем система на основе шаблонов.\n\n3.  **Задачи классификации и понимания:** Например, автоматически определить, что за документ перед вами (счет, акт или договор), а затем извлечь из него ключевые поля.\n\n**Когда Donut использовать НЕцелесообразно:**\n\n1.  **Простая оцифровка текста:** Вам нужно перевести отсканированную книгу или статью в текстовый формат (например, `.txt` или `.docx`). Классические OCR-движки (Tesseract, FineReader) сделают это быстрее, дешевле и, возможно, точнее.\n2.  **Очень строгий и неизменный шаблон:** Если вы обрабатываете один и тот же тип бланка, который не меняется годами. Здесь простой и быстрый парсер на основе координат или правил может быть эффективнее.\n3.  **Крайне ограниченные вычислительные ресурсы:** Если решение должно работать на слабом "железе" или мобильном устройстве без доступа к мощному серверу.\n\n### Итог\n\n**Классический OCR** — это инструмент для **распознавания текста**.\n**Donut** — это инструмент для **понимания документов**.\n\nПереход с классического OCR на Donut — это как переход от простого распознавания слов в предложении к пониманию смысла всего предложения целиком. Для современных задач автоматизации бизнес-процессов, где нужно извлекать данные из потока разнообразных документов, модели типа Donut являются гораздо более мощным и перспективным решением.	\N	\N	2025-10-30 06:26:19.544549+00
14dfde33-402a-4328-a5a9-fee4e8826054	a8a41fa3-a82d-413c-a003-4a0a016b00b7	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	user	в строительной компании есть задача анализировать строительную документацию, отбирать из таблиц данные по материалам, их количеству в привязке к типам поверхностей: например, в таблице указаны разные типы кровли, а к ним разные материалы и разные количества материалов, единицы измерения. Нужно проанализировать эти табличные части pdf документов. В случае сканированных pdf для решения такой задачи ты что посоветуешь?	\N	\N	2025-10-30 07:12:17.670469+00
5a173fb7-2b51-4d03-9bfb-10b696cacbf3	a8a41fa3-a82d-413c-a003-4a0a016b00b7	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	assistant	Отличный, очень конкретный и реальный кейс. Для вашей задачи анализа таблиц в сканированной строительной документации **я бы настоятельно рекомендовал выбрать подход на основе Donut (или аналогичных end-to-end моделей) как основную стратегию.** Классический пайплайн будет более хрупким и сложным в поддержке.\n\nВот детальное обоснование и план действий.\n\n### Почему Donut — лучший выбор для вашей задачи\n\nВаша задача — не просто перевести картинку в текст (OCR). Ваша задача — извлечь **структурированную и взаимосвязанную информацию**. Вам нужно понять, что "Грунтовка ГФ-021" в количестве "5 кг" относится к "Кровля тип 1: Металлочерепица", а не к "Стены: Штукатурка".\n\n1.  **End-to-end извлечение структуры.** Donut обучается сразу генерировать целевой JSON из изображения. Вы можете научить его создавать структуру вида:\n\n    ```json\n    [\n      {\n        "surface_type": "Кровля тип 1: Металлочерепица",\n        "materials": [\n          { "name": "Утеплитель 'Rockwool' 100мм", "quantity": "150", "unit": "м2" },\n          { "name": "Пароизоляция 'Изоспан B'", "quantity": "160", "unit": "м2" },\n          { "name": "Металлочерепица 'Монтеррей'", "quantity": "155", "unit": "м2" }\n        ]\n      },\n      {\n        "surface_type": "Фасад: Вентилируемый",\n        "materials": [\n          { "name": "Керамогранитная плита", "quantity": "300", "unit": "шт" },\n          { "name": "Профиль направляющий", "quantity": "450", "unit": "м.п." }\n        ]\n      }\n    ]\n    ```\n    Donut способен "понять" вложенность и научиться группировать материалы под правильным типом поверхности напрямую из картинки.\n\n2.  **Устойчивость к "реальному миру".** Строительная документация приходит в разном виде:\n    *   Сканы с артефактами, пятнами, печатью под углом.\n    *   Слегка отличающиеся шаблоны таблиц от разных подрядчиков.\n    *   Смешение печатного и рукописного текста (например, вписанное количество).\n\n    Donut, благодаря своей архитектуре (Transformer), лучше справляется с такими визуальными "шумами" и вариациями верстки, чем пайплайн, где ошибка на одном этапе (например, детектор таблиц не нашел границу строки) рушит весь последующий процесс.\n\n3.  **Меньше "склеивающего кода" и правил.** В классическом подходе вам понадобится:\n    *   **Шаг 1:** Детектор таблиц (найти рамку таблицы на странице).\n    *   **Шаг 2:** Модель распознавания структуры таблицы (найти строки и столбцы).\n    *   **Шаг 3:** OCR для каждой ячейки.\n    *   **Шаг 4:** Скрипты и правила, чтобы собрать текст из ячеек в логическую таблицу, а затем понять, какая строка относится к какому заголовку. Этот последний шаг самый хрупкий. Если в таблице появляются объединенные ячейки или вложенные заголовки, правила ломаются.\n\n    Donut заменяет все эти шаги одной нейросетью.\n\n### Недостатки Donut и как с ними бороться в вашем кейсе\n\n*   **Требуется дообучение:** Модель "из коробки" не поймет специфику ваших ведомостей материалов. Вам потребуется собрать датасет.\n*   **Возможные "галлюцинации":** Иногда модель может придумать строку или пропустить существующую, особенно в очень длинных таблицах.\n*   **Точность символов:** Может ошибиться в цифре или букве (например, "50" вместо "60", "ГОСТ 123" вместо "ГОСТ 128").\n\n**Решение этих проблем:**\n*   **Дообучение:** Это ключевой шаг. Для надежного решения без него не обойтись.\n*   **Пост-валидация:** Результат работы Donut (полученный JSON) нужно обязательно проверять. Простые правила (`quantity` должно быть числом, `unit` должно быть в списке известных единиц измерения) и сверка итоговых сумм могут отловить 90% ошибок.\n*   **Гибридный подход для критичных случаев:** Если Donut не справился со страницей (выдал пустой результат или невалидный JSON), можно задействовать "план Б" — запустить классический OCR (например, PaddleOCR или Tesseract), чтобы получить сырой текст, который оператор сможет проверить вручную.\n\n### Рекомендованный план действий (Roadmap)\n\n**Фаза 1: Proof of Concept (PoC) — Проверка гипотезы (1-2 недели)**\n\n1.  **Сбор данных:** Соберите 50-100 типичных страниц с таблицами из ваших PDF. Выбирайте разнообразные: хорошие сканы, плохие, с разными шаблонами.\n2.  **Разметка (Annotation):** Это самая важная часть. Для каждой картинки-страницы вам нужно вручную создать целевой JSON, который вы хотите получить (как в примере выше). Это будет ваш обучающий датасет.\n3.  **Дообучение:** Возьмите предобученную модель Donut (например, с Hugging Face) и дообучите её на вашем маленьком датасете. Вам понадобится GPU (можно использовать Google Colab).\n4.  **Оценка:** Проверьте на 10-20 страницах, которые не были в обучении. Оцените не просто точность символов, а **F1-меру по извлеченным полям**. То есть, сколько материалов модель нашла правильно, сколько пропустила, сколько придумала.\n\n**Фаза 2: Minimum Viable Product (MVP) — Минимально жизнеспособный продукт (1-2 месяца)**\n\n1.  **Расширение датасета:** Если PoC успешен, расширьте датасет до 500-2000 размеченных страниц. Чем больше данных и разнообразия, тем надежнее будет модель. Используйте аугментации (добавление шума, повороты, изменение яркости), чтобы сделать модель более робастной.\n2.  **Улучшение модели:** Переобучите модель на большом датасете.\n3.  **Создание сервиса:** "Оберните" модель в простой API: сервис принимает PDF, обрабатывает его постранично, отдает структурированный JSON. Добавьте базовую пост-валидацию.\n4sem. **Интерфейс для верификации:** Создайте простой UI, где оператор видит исходную страницу и рядом — извлеченную моделью таблицу. Он может быстро исправить ошибки и подтвердить данные. Это критически важно для внедрения.\n\n### Так что насчет классического OCR?\n\nНе стоит его полностью списывать со счетов. Он может быть полезен как:\n*   **Fallback-система:** Если Donut вернул ошибку, можно показать пользователю просто распознанный текст со страницы, чтобы он мог скопировать данные вручную.\n*   **Инструмент для создания датасета:** Можно запустить OCR на ячейках таблицы, чтобы предзаполнить текстовые поля при разметке данных для Donut. Это ускорит работу аннотаторов.\n\n---\n\n### **Итоговый вердикт**\n\nДля вашей задачи по анализу **структуры таблиц** в сканированных документах, **начинайте с Donut**. Это более современный, элегантный и в конечном итоге более надежный путь, так как он нацелен на понимание структуры, а не на простое распознавание символов.\n\nКлассический подход "Детекция + OCR + Правила" — это путь к созданию сложной и хрупкой системы, которую будет больно поддерживать. Он оправдан, если у вас тысячи разных, непредсказуемых форматов документов. В вашем случае (строительная документация) форматы таблиц, скорее всего, ограничены и повторяются, что делает их идеальными кандидатами для дообучения end-to-end модели.	\N	\N	2025-10-30 07:13:00.097112+00
f0463ed0-a61d-448b-8b3e-40c37176593e	c01cdcb3-76b8-4400-af04-5eac5fd3f512	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	user	в строительной компании есть задача анализировать строительную документацию, отбирать из таблиц данные по материалам, их количеству в привязке к типам поверхностей: например, в таблице указаны разные типы кровли, а к ним разные материалы и разные количества материалов, единицы измерения. Нужно проанализировать эти табличные части pdf документов. В случае сканированных pdf для решения такой задачи ты что посоветуешь?	\N	\N	2025-10-30 07:13:41.488378+00
d450e49a-2123-475c-af9e-ace9c75fdd6f	2e8f516d-5378-4964-a1b0-125c573354d1	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	user	в строительной компании есть задача анализировать строительную документацию, отбирать из таблиц данные по материалам, их количеству в привязке к типам поверхностей: например, в таблице указаны разные типы кровли, а к ним разные материалы и разные количества материалов, единицы измерения. Нужно проанализировать эти табличные части pdf документов. В случае сканированных pdf для решения такой задачи ты что посоветуешь?	\N	\N	2025-10-30 07:14:40.514098+00
d559dcc0-d0c2-4940-a2a4-56dea1f9c867	c01cdcb3-76b8-4400-af04-5eac5fd3f512	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	assistant	Короткий ответ: для сканов таблиц по материалам/количествам и привязке к типам поверхностей лучше всего работают два подхода — “OCR + детектор таблиц + восстановление структуры” или end‑to‑end модель понимания документа (Donut/мультимодальные LLM). Выбор зависит от бюджета, требований к он‑прем/облаку, объема разметки и допуска к изменчивым шаблонам.\n\nРекомендую рассмотреть три практичных пути.\n\n1) Самый быстрый и надежный в проде (если допускается коммерческий движок)\n- Инструменты: ABBYY FineReader Engine/Vantage (сильная поддержка русского), Azure Document Intelligence (Form Recognizer), Google Document AI, AWS Textract.\n- Что дают: из сканов вытаскивают таблицы, возвращают структуру (строки/столбцы), часто с координатами и confidence. ABBYY обычно устойчивее к сканам и русскому языку.\n- Дальше: нормализуете единицы (м²/м2/кв.м), числовые форматы (запятая/точка), и реализуете привязку материалов к типам поверхностей через простую логику: строки‑заголовки секций (тип кровли) → все следующие строки‑позиции до следующего заголовка.\n- Плюсы: быстро запустите пилот с высокой точностью, меньше ML-инжиниринга. Минусы: лицензии/стоимость, иногда облако (у ABBYY есть он‑прем).\n\n2) Он‑прем open‑source конвейер (если нужен контроль над данными и бюджет)\n- Предобработка: 300–400 DPI рендер PDF в изображения, deskew, denoise (ocrmypdf/OpenCV).\n- Детекция таблиц и ячеек: Table Transformer (microsoft/table-transformer), deepdoctection/layoutparser. Он выделяет таблицы и их структуру (ячейки/строки/столбцы) на сканах.\n- OCR: PaddleOCR (ru), Tesseract 5 (rus+custom dictionary) или он‑прем ABBYY SDK для лучшего качества.\n- Восстановление логики таблицы:\n  - Классифицировать строки на типы: section header (тип кровли), header, data row, subtotal. Можно начать с правил (пустая первая колонка, жирность/капс, merged‑ячейки) и затем заменить на лёгкую модель (CatBoost/LightGBM на текст+геометрию).\n  - Привязка: материал/количество/единица наследуют текущий section header до следующего.\n  - Мультистраничные таблицы: сопоставление по заголовкам и колонкам.\n- Нормализация: словарь единиц и синонимов (м², кв.м., m²), парсинг чисел с запятой, удаление неразрывных пробелов, маппинг материалов (каталог).\n- Выход: JSON со схемой {surface_type, material, unit, quantity, page, table_id, row_id, confidence}.\n- Плюсы: он‑прем, настраиваемость, умеренные затраты. Минусы: больше инженерной работы; качество OCR критично.\n\n3) End‑to‑end понимание документа (Donut или VLM/LLM‑Vision)\n- Как работает: подаёте страницу как изображение и просите сразу отдать структурированный JSON (тип поверхности → список материалов с qty и единицами). Donut можно дообучить под вашу схему; мультимодальные модели (GPT‑4o/Claude/Gemini) умеют zero‑shot, но это облако.\n- Когда брать:\n  - Много разных шаблонов, часто меняющихся версток.\n  - В таблицах встречаются разделы/подзаголовки/слитые ячейки, где обычный “OCR+правила” ломается.\n  - Готовы разметить 300–2000 примеров “изображение → целевой JSON” и есть GPU (для fine‑tuning; LoRA снижает требования).\n- Плюсы: лучше связывает сущности “тип поверхности → материалы”, меньше хрупких правил, выше устойчивость к layout‑вариациям. Минусы: потребуются данные и обучение; сложнее интерпретировать; для он‑прем — больше ML‑инфры. В качестве быстрого пилота без разметки можно протестировать облачные VLM (если позволяет политика).\n\nПрактические советы по реализации\n- Начните с пилота на 100–200 страниц:\n  - Если важна скорость результата — протестируйте ABBYY и Azure/Google/AWS, сравните извлечённые таблицы и трудозатраты на пост‑обработку.\n  - Если он‑прем — поднимите pipeline: pdf2image → Table Transformer → PaddleOCR → правила привязки секций → нормализация → JSON.\n  - Параллельно проверьте zero‑shot с одной из VLM (если можно) на 20 страницах: запросом сразу просите структуру “тип покрытия → [материал, ед., кол‑во]”.\n- Схема данных на выходе (пример):\n  - project_id, doc_id, page, table_id\n  - surface_type\n  - material_name (нормализованное), material_raw\n  - unit (нормализованная)\n  - quantity (float), quantity_raw\n  - row_confidence, ocr_confidence\n- Нормализация и контроль качества:\n  - Словари синонимов материалов и единиц; допуски по числам; валидации (единица должна соответствовать материалу).\n  - Human‑in‑the‑loop интерфейс для верификации полей ниже порога confidence.\n- Важные углы:\n  - Русский язык и строительные термины — подгрузите кастомный словарь в OCR.\n  - Учитывайте м²/м³/пог.м и смешанные обозначения.\n  - Обработка поворотов страниц, низкого DPI, штампов/печати поверх текста.\n  - Мультистраничные таблицы и иерархические разделы.\n\nЧто бы я рекомендовал вам как старт\n- Если нужен быстрый производственный результат и есть бюджет: ABBYY Vantage/Engine как основной, поверх — тонкая логика привязки “тип поверхности → строки”.\n- Если он‑прем и без лицензий: open‑source конвейер с Table Transformer + PaddleOCR, затем лёгкая модель/правила для классификации строк и привязки контекста.\n- Если документов много, шаблоны разнообразны и планируется масштабирование: планируйте дообучение Donut (или аналогичной OCR‑free модели) под ваш JSON. На старте можно использовать гибрид: текущий конвейер + постепенное введение Donut для самых сложных шаблонов.\n\nГотов помочь с выбором стека под ваши ограничения (он‑прем/облако, бюджет, SLA) и накидать план POC на 2–3 недели.	\N	\N	2025-10-30 07:14:54.650973+00
d93bc49f-90f1-4b52-a15b-8262356cbeea	2e8f516d-5378-4964-a1b0-125c573354d1	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	assistant	Коротко — для задачи извлечения материалов/количеств, привязанных к типам поверхностей, из табличных частей отсканированных PDF я рекомендую гибридный подход: надёжный OCR (коммерческий или сильный open‑source) + специализированный парсер таблиц (структуризация клеток) + модель понимания/разметки (layout-aware IE). Чисто «Donut‑style» end‑to‑end возможно применять, но для сложных табличных структур и требуемых координат/верификации чаще надёжнее гибрид. Ниже — подробный план, варианты реализации и практические рекомендации.\n\n1) Что важно в вашей задаче\n- Вы должны получать не только текст, но и структуру таблицы (какая ячейка к какой относится), чтобы связать материал с типом поверхности и единицами измерения.\n- Нужны числовые значения и единицы валидации (единицы могут быть разные: м2, шт., пог. м и т.п.).\n- Документы — сканы → требуется качественная предобработка и OCR.\n- Вероятны разные форматы таблиц, смешанные тексты, возможно плохое качество сканов.\n\n2) Рекомендуемый общий пайплайн (идея)\n1. Предобработка изображений\n   - DPI ≥ 300; корректировка поворота/deskew; шумоподавление; локальная контрастная коррекция.\n   - Бинаризация/усиление контуров для табличной сетки (если есть).\n2. Детекция таблиц на странице\n   - модель object detection (YOLOv5/Detectron2) или специальные модели таблиц (CascadeTabNet, TableBank) — для выделения областей таблиц.\n3. Табличная структура (cell segmentation / table structure recognition)\n   - если таблица четко нарисована — можно детектировать линии и контуры (OpenCV) или Camelot/Tabula (для born-digital).\n   - для сканов/сложных случаев — использовать ML‑модели: CascadeTabNet, TableStruct, PubTabNet/Graph‑based структуризаторы, или PaddleOCR Table Recognition.\n   - Результат: ячейки с координатами и изображением каждой ячейки.\n4. OCR внутри ячеек\n   - Надёжный распознаватель с возвратом текста + bounding box внутри ячейки (если нужно). Варианты:\n     - Коммерческие: ABBYY FlexiCapture, Google Document AI (Document OCR + Table Parser), AWS Textract, Azure Form Recognizer — дают хорошие результаты на сканах и таблицах.\n     - Open-source: PaddleOCR (хорош для азиатских/латинских шрифтов), Tesseract (меньше точности, но бесплатно), TrOCR/Donut для видимой части (но Donut — генеративный).\n   - Версия: предпочесть коммерческий OCR для лучшей точности на плохих сканах, если бюджет есть.\n5. Семантическое сопоставление и нормализация\n   - На основе текста в ячейках + их позиционных признаков сопоставить материал ↔ тип поверхности ↔ количество ↔ единицы.\n   - Возможные варианты реализации:\n     - Правила/регулярные выражения + heuristics (если таблицы стандартизированы).\n     - Модель извлечения на базе LayoutLMv2/v3 или StrucTexT/DocFormer, принимающая текст + bbox и выдающая сущности и связи (relation extraction).\n     - Donut/Donut‑like можно использовать как классификатор/генератор структуры (например, fine‑tuned для вывода JSON), но он может не давать точные координаты; лучше как доп. этап проверки/нормализации.\n6. Пост‑валидация и бизнес‑правила\n   - Проверка единиц, числовые диапазоны, суммарные итоги, сверка с OCR raw (если поле критично — двойная проверка).\n7. QA и человеческая верификация (bootstrapping)\n   - UI для быстрой проверки/коррекции извлечений для активного обучения.\n\n3) Конкретные варианты (по бюджету и срокам)\n\nA. Быстро и надёжно (рекомендуется, если есть бюджет)\n- Использовать commercial API: Google Document AI (Table Parser), ABBYY FlexiCapture, AWS Textract, Microsoft Form Recognizer.\n- Они дают:\n  - детекцию таблиц и структуру из сканов,\n  - хорошее OCR,\n  - API для извлечения таблиц в структурированном виде.\n- Дальше — применить слой правил/скриптов для сопоставления столбцов и нормализации материалов/единиц.\n- Минусы: стоимость, приватность данных (если не on‑prem).\n\nB. Баланс стоимость/качество (open‑source + ML)\n- Предобработка: OpenCV (deskew, denoise).\n- Таблица detection/structure: CascadeTabNet / TableStruct / PaddleOCR table module.\n- OCR: PaddleOCR (или TrOCR для улучшения качества), Tesseract для простых случаев.\n- IE: LayoutLMv3 или StrucTexT (fine‑tune на аннотированных примерах) для привязки ячеек к сущностям/ролям.\n- Валидация: правила + регулярные выражения.\n- Плюсы: контроль над данными, дешевле в долгосрочном.\n- Минусы: нужна дообучение/настройка, больше инженерной работы.\n\nC. Эксперимент с Donut (end‑to‑end)\n- Можно попробовать Donut / Donut‑small, fine‑tune его на шаблонах ваших таблиц, чтобы генерировать JSON вида: [{surface_type:..., material:..., qty:..., unit:...}, ...].\n- Работает, если:\n  - таблицы однородны по структуре,\n  - вас устраивает генеративный вывод (без координат),\n  - вы готовы потратить время на сбор ~нескольких сотен примеров.\n- Ограничения:\n  - сложные или очень разные таблицы Donut может парсить хуже;\n  - галлюцинации и отсутствие координат;\n  - сложнее локализовать конкретную ячейку на изображении.\n- Полезен как «быстрый прототип» или в качестве второго этапа валидации.\n\n4) Практические рекомендации по данным и аннотациям\n- Разметьте примеры: для каждой таблицы — bbox таблицы, bbox ячеек (или привязки к строкам/столбцам), содержимое, и связь «тип поверхности → материал → количество → единица».\n- Объём разметки: для ML‑моделей извлечения — от нескольких сотен до нескольких тысяч таблиц/строк для хорошей точности; для коммерческих сервисов — часто достаточно меньше, но лучше иметь 50–200 примеров для тонкой настройки.\n- Используйте active learning: сначала разверните правила/коммерческий OCR, собирайте ошибки, дообучайте модель.\n\n5) Обработка специальных случаев\n- Слияния ячеек, многострочные ячейки: учесть в структуре, иметь логику объединения (merge).\n- Многостраничные таблицы: сохранять контекст — идентификаторы таблиц/пагинация.\n- Разные единицы: нормализация (м2 → m2), распознавание и конвертация.\n- Сокращения и опечатки: словарь материалов + fuzzy matching (Levenshtein).\n\n6) Метрики и валидация\n- Cell‑level accuracy / F1 (распознавание содержимого ячеек).\n- Structure accuracy (правильные row/col associations).\n- Entity extraction precision/recall (материал, количество, единица, тип поверхности).\n- End‑to‑end accuracy: доля строк/записей полностью правильно распознанных.\n\n7) Рекомендация для старта (пошагово)\n1. Соберите 100–300 реальных сканов с примерами таблиц.\n2. Попробуйте коммерческий API (Google Doc AI или ABBYY) на 20–50 документов — оцените качество и стоимость.\n3. Параллельно реализуйте простую open‑source цепочку (OpenCV + PaddleOCR + CascadeTabNet) и сравните.\n4. На основе сравнения решите: дообучать open‑source решения или интегрировать commercial.\n5. Разметьте критические поля/примеры и дообучите LayoutLM/StrucTexT/Donut (если нужно) для стабильной семантической привязки.\n6. Добавьте валидацию/правила и интерфейс верификации.\n\n8) Конкретные инструменты/ресурсы\n- Коммерческие: Google Document AI (Table Parser / Proc), ABBYY FlexiCapture, AWS Textract, Azure Form Recognizer.\n- Open source OCR: PaddleOCR, Tesseract, TrOCR (HuggingFace).\n- Table detection/structure: CascadeTabNet, TableBank, Camelot/Tabula (для born-digital), PaddleOCR table module.\n- Layout-aware IE: LayoutLMv2/v3, StrucTexT, DocFormer.\n- Аннотация: LabelStudio, custom tools, DocLayNet / PubTabNet форматы.\n\nЕсли хотите, могу:\n- Помочь выбрать конкретный стек с учётом бюджета и требований к приватности (напр., on‑prem vs cloud).\n- Оценить примерные трудозатраты по разметке и дообучению, если вы пришлёте 10–20 типичных страниц.\n- Подготовить prototyping plan: минимальный PoC с коммерческим API vs open‑source реализация и чеклисты для оценки качества.	\N	\N	2025-10-30 07:15:25.253689+00
d8322093-1462-4fbd-833f-4e8e4837e2ed	0782f2cf-5664-45e8-80e7-3557030270c3	310087c1-ef51-4c13-9f65-e581845313fe	user	Ручной или автоматический?	\N	\N	2025-10-31 05:48:29.962941+00
fc0f96be-275e-4f34-939d-2f24b4945c57	0782f2cf-5664-45e8-80e7-3557030270c3	310087c1-ef51-4c13-9f65-e581845313fe	assistant	### Клапан противопожарный прямоугольный: Ручной или автоматический?\n\n**Клапаны противопожарные прямоугольные (ППК, ППВ)** могут быть как **ручными**, так и **автоматическими**, в зависимости от модели и требований проекта. Чаще всего используются **автоматические** или **комбинированные** (с ручным управлением), поскольку ручные клапаны требуют постоянного человеческого вмешательства, что не всегда практично в системах пожарной безопасности. Выбор определяется нормативами (СП 60.13330.2020, ФЗ-123) и объектом (например, в промышленных помещениях предпочтительны автоматические).\n\n#### Типы по управлению:\n1. **Автоматический** (основной тип, ~80–90% моделей):\n   - **Принцип срабатывания**:\n     - **Термический**: Клапан закрывается автоматически при достижении температуры (обычно 70°C для быстрого срабатывания, 140–280°C для стандартного). Использует терморасширяющийся элемент (клинкер или пружину, размыкающую при нагреве).\n     - **Электромеханический**: Подключается к пожарной сигнализации (ДПК — дымопожарный извещатель). Сигнал (24 В DC или 220 В AC) активирует сервопривод или соленоид, закрывая заслонку за 10–30 секунд.\n     - **Комбинированный**: Термо- + дымовой датчик для двойной защиты.\n   - **Преимущества**: Быстрое реагирование (без участия человека), интеграция в системы автоматизации (BMS/SCADA). Обязателен для зданий с обязательным пожарным контролем (офисы, ТЦ, больницы).\n   - **Примеры моделей**:\n     - "Вентс VKMP" (автоматический с термоактуатором 74°C, EI 90).\n     - Trox FK-EU (электропривод Belimo, с ручным сбросом).\n   - **Недостатки**: Требует электропитания и обслуживания (проверка датчиков ежегодно).\n\n2. **Ручной** (дополнительный или базовый тип):\n   - **Принцип работы**: Закрытие/открытие осуществляется вручную с помощью рычага, рукоятки или троса (удаленного управления). Нет встроенной автоматики — оператор должен активировать клапан при сигнале тревоги.\n   - **Преимущества**: Простота конструкции, низкая цена (на 20–40% дешевле), не зависит от электричества. Подходит для объектов с низким риском (склады без постоянного персонала) или как резервный вариант.\n   - **Применение**: В небольших системах вентиляции, где автоматика не требуется по нормам, или в комбинации с автоматическими (для ручного тестирования/сброса).\n   - **Примеры моделей**:\n     - "Сказка ППК-Р" (ручной шиберный, с фиксаторами).\n     - Базовые реечные клапаны от "Бриз" (механическое управление).\n   - **Недостатки**: Зависит от оперативности персонала; по нормам (СП 7.13130.2013) ручные клапаны допустимы только если автоматика невозможна или как дополнение.\n\n3. **Комбинированный (смешанный)**:\n   - Автоматическое закрытие + ручное управление (кнопка открывания/закрывания для обслуживания или эвакуации). Это наиболее универсальный вариант, соответствует требованиям большинства проектов.\n   - Пример: Belimo R412G (автоматический с ручным переключателем).\n\n#### Рекомендации по выбору:\n- **Автоматический**: Выбирайте для большинства объектов (обязателен в жилых/общественных зданиях по ПБ 10-03). Срок службы > 10–15 лет, тестирование — раз в 6–12 месяцев.\n- **Ручной**: Для бюджетных или простых установок, но проверьте соответствие нормам (в России — сертификат МЧС).\n- **Стандарты**: Автоматика должна иметь резервное питание (АКБ) и индикацию положения (открыто/закрыто). Степень герметичности — класс В по ГОСТ Р 56115-2014.\n- **Цена**: Ручной — 3 000–8 000 руб.; автоматический — 7 000–25 000 руб. (зависит от размеров и функций).\n\nЕсли вопрос касается конкретной модели (размеры, производитель), стандарта (ГОСТ) или сравнения с другими типами (круглые, дымовые), укажите детали! Или если это о другом оборудовании из предыдущих запросов (КИД или ОКСИД), уточните контекст.	\N	\N	2025-10-31 05:48:37.024091+00
24bd7f6f-f4d3-4d9c-87fd-6ee358acde40	d9297b3c-0e35-4926-959d-92965b87d8d8	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	assistant	Отлично, давайте подберем варианты, учитывая различные участки водопроводных и отопительных систем в 50-этажном жилом доме. Ниже я представляю типовое деление и рекомендуемые решения.\n\n**I. Ввод в здание и основные магистрали (DN100 – DN300+)**\n*Это самые ответственные участки с большим давлением и расходом, от которых зависит надежность всего здания.*\n\n1.  **Основной запорный вентиль на вводе в здание (ХВС/ГВС):**\n    *   **Рекомендуемый тип:** **Дисковый затвор с редуктором (gear operated butterfly valve) или, для критической надежности, Клиновая задвижка.**\n        *   **Плюсы дискового затвора:** Низкая стоимость, компактность, легкий вес, простота монтажа. Редуктор обеспечивает плавное и легкое управление даже при больших диаметрах и высоких давлениях. Хорошо справляется с потоком воды.\n        *   **Минусы дискового затвора:** Менее надежная герметичность на длительной дистанции (со временем может пропускать, особенно при износе седла).\n        *   **Плюсы клиновой задвижки:** Полностью открытый проход, минимальное сопротивление потоку, высокая герметичность в закрытом положении. Очень долговечны.\n        *   **Минусы клиновой задвижки:** Значительно дороже, больше вес и габариты, требуют больше места для монтажа и обслуживания. Требуют большого усилия для открытия/закрытия вручную на больших диаметрах, или установки привода.\n    *   **Материал:** Корпус – чугун/ковкий чугун с эпоксидным покрытием, Диск – нержавеющая сталь, Седло – EPDM (для воды до 90-100°C), PTFE (для более высоких температур или агрессивных сред).\n    *   **Дополнительно:** Желательно наличие байпаса с меньшим вентилем для обслуживания или слива.\n\n2.  **Магистрали в технических помещениях (подвал, техэтаж), коллекторы:**\n    *   **Рекомендуемый тип:** **Дисковые затворы (ручные или с редуктором).**\n    *   **Обоснование:** Оптимальное соотношение цена/качество/компактность для больших диаметров. Если требуется регулирование, можно использовать специальные регулирующие дисковые затворы или отдельные регулирующие клапаны.\n    *   **Материал:** Аналогично вводу.\n\n**II. Стояки и разводка по этажам (DN20 – DN80/100)**\n*Здесь важна не только надежность, но и возможность быстрого отключения отдельных участков без затрагивания всего дома.*\n\n1.  **Запорные краны на стояках ХВС/ГВС/Отопления:**\n    *   **Рекомендуемый тип (DN20-DN50):** **Шаровые краны (полнопроходные).**\n        *   **Плюсы:** Высокая надежность, отличная герметичность (особенно для предотвращения затоплений), долгий срок службы (15-30+ лет), простота эксплуатации ("открыто/закрыто"), минимальное сопротивление потоку.\n        *   **Минусы:** Дороже дисковых затворов для сопоставимых диаметров, особенно если требуется фланцевое соединение.\n    *   **Рекомендуемый тип (DN65-DN80/100):** **Шаровые краны или компактные дисковые затворы.**\n        *   **Обоснование:** Здесь выбор может зависеть от проектного давления, частоты обслуживания и бюджета. Если критична 100% герметичность и готовность платить, лучше шаровые. Если цена — решающий фактор, дисковые подойдут, но с пониманием меньшего срока службы седла.\n    *   **Материал:** Корпус – латунь (для ХВС/ГВС низкого давления), ковкий чугун/нержавеющая сталь (для отопления, высоких температур/давлений или агрессивных сред). Шар – полированная сталь или латунь с хромированием. Уплотнения – PTFE.\n    *   **Дополнительно:** Для отопления и ГВС - высокая термостойкость.\n\n2.  **Отсекающие краны на ответвлениях от стояков к квартирным коллекторам/разводке (DN15 – DN25):**\n    *   **Рекомендуемый тип:** **Шаровые краны.**\n    *   **Обоснование:** Максимальная надежность для предотвращения затопления квартир. Легко доступны для жильцов и обслуживающего персонала.\n    *   **Материал:** Латунь (лучше полнопроходная), часто с рукояткой-бабочкой.\n\n**III. Квартирная разводка (подключение сантехники, DN15)**\n*Здесь главный приоритет — надежность, минимизация риска протечек и простота замены/обслуживания для конечного пользователя.*\n\n1.  **Запорные краны на входе в каждую квартиру:**\n    *   **Рекомендуемый тип:** **Шаровые краны (полнопроходные).**\n    *   **Обоснование:** Исключительно шаровые. Максимальная надежность и долгий срок службы критически важны для защиты имущества.\n    *   **Материал:** Качественная латунь.\n\n2.  **Запорные краны для подключения сантехнических приборов (унитаз, смесители):**\n    *   **Рекомендуемый тип:** **Шаровые краны (угловые или прямые).**\n    *   **Обоснование:** Малые размеры, простота установки, возможность легкого отключения конкретной точки без перекрытия всей квартиры.\n    *   **Материал:** Латунь, многие европейские производители дают гарантию 10-15 лет.\n\n**IV. Системы отопления и HVAC (DN20 – DN300+)**\n*Выбор зависит от температуры, давления и типа теплоносителя.*\n\n1.  **Основные контуры отопления:**\n    *   **Рекомендуемый тип (для больших диаметров):** **Дисковые затворы с редуктором или клиновые задвижки.**\n        *   **Обоснование:** Аналогично ХВС/ГВС магистралям, с учетом температурных режимов.\n    *   **Рекомендуемый тип (для стояков и ответвлений):** **Шаровые краны (стальные или латунные/бронзовые).**\n        *   **Обоснование:** Выбираем исходя из давления и температуры системы. Стальные шаровые краны лучше для систем с высоким давлением и температурой.\n    *   **Материал:** Корпус – сталь/чугун, шар – нержавеющая сталь, уплотнения – PTFE с добавками графита (для высоких температур).\n\n2.  **Запорные краны на радиаторах и фанкойлах:**\n    *   **Рекомендуемый тип:** **Шаровые краны (в большинстве случаев, особенно для простых систем) или вентили (для точной регулировки).**\n    *   **Обоснование:** Компактность, надежность, возможность полного перекрытия. Вентили (типа Danfoss/Herz) также очень популярны для ручной регулировки и автоматики.\n\n**Резюме по выбору с точки зрения долговечности/стоимости:**\n\n*   **Шаровые краны:**\n    *   **Где:** Вся бытовая разводка внутри квартир (DN15-25), стояки (DN20-50), некоторые ответвления малых диаметров в инженерных системах.\n    *   **Почему:** Максимальная надежность, долгий срок службы (15-30+ лет), отличная герметичность, низкий риск протечек. Высокая полная стоимость владения (TCO) из-за почти нулевых затрат на ремонт и минимизации рисков затоплений.\n    *   **Стоимость:** Дороже дисковых затворов на аналогичный диаметр (особенно больших).\n\n*   **Дисковые затворы:**\n    *   **Где:** Основные вводы в здание, магистральные трубопроводы больших диаметров (ХВС/ГВС, отопление, пожарные стояки DN100 и более), коллекторные группы.\n    *   **Почему:** Низкая закупочная стоимость и стоимость монтажа для больших диаметров. Компактность. Достаточная надежность для большинства магистральных функций, где важно быстро перекрыть большой поток, но не требуется абсолютная герметичность годами без обслуживания.\n    *   **Стоимость:** Дешевле шаровых и клиновых задвижек на больших диаметрах. TCO может быть выше за счет более частой замены уплотнений или необходимости полной замены раз в 10-15 лет.\n\n**Общий вывод для 50-этажного дома:**\nИдеальное решение – **комбинированное**. На малых диаметрах и ответственных участках (квартиры, стояки) используем надежные и долговечные шаровые краны, минимизируя риски затоплений и аварий. На магистральных трубопроводах большого диаметра, где цена и монтаж играют существенную роль, применяем дисковые затворы, но с учетом их эксплуатации и потенциальной заменой уплотнений раз в 10-15 лет. Это позволит оптимизировать как первоначальные капитальные затраты (CAPEX), так и операционные расходы (OPEX) на протяжении всего жизненного цикла здания.	gemini-2.5-flash	\N	2025-10-31 11:45:01.115556+00
d1b5ef5e-1bca-49d2-84ff-34c3c785003d	ad63516a-1e13-4ee9-a6fc-ea90123da84f	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	user	в строительной компании есть задача анализировать строительную документацию, отбирать из таблиц данные по материалам, их количеству в привязке к типам поверхностей: например, в таблице указаны разные типы кровли, а к ним разные материалы и разные количества материалов, единицы измерения. Нужно проанализировать эти табличные части pdf документов. В случае сканированных pdf для решения такой задачи ты что посоветуешь?	\N	\N	2025-10-30 07:15:39.218228+00
ae4e0727-1620-4ed4-b6c4-946b5d56be0a	ad63516a-1e13-4ee9-a6fc-ea90123da84f	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	assistant	### Рекомендации по решению задачи анализа таблиц в сканированных PDF для строительной документации\n\nВаша задача — это классический случай Document AI: извлечение структурированных данных из таблиц сканированных PDF (изображений), с фокусом на семантику (привязка материалов, количеств, единиц измерения к типам поверхностей, как типы кровли). Сканированные PDF не содержат selectable текста, поэтому обязательно нужен OCR (распознавание текста с изображений) + извлечение таблиц + пост-обработка для семантики. Это требует комбинации инструментов, так как ни один не решает всё идеально "из коробки".\n\nЯ опираюсь на практические бенчмарки (например, PubTabNet для таблиц, ICDAR для OCR) и опыт сообщества (Hugging Face, GitHub). Для строительных документов (часто с таблицами, спецификой вроде "кровля/штукатурка", единицами "м²/кг") ключ — robust к шуму (пятна, повороты от сканов), пониманию layout и кастомизации под домен. Вот пошаговый совет, с акцентом на целесообразные инструменты.\n\n#### 1. **Общий пайплайн для решения**\n   - **Шаг 1: Предобработка PDF**. Конвертируйте scanned PDF в изображения (страницы как PNG/JPG) для OCR. Используйте:\n     - `pdf2image` (Python, с Poppler): Быстро и бесплатно. Пример: `from pdf2image import convert_from_path; images = convert_from_path('doc.pdf')`.\n     - Улучшите изображения: Deskew (выпрямление), denoise, бинаризация с OpenCV или Pillow. Это повысит OCR-accuracy на 10–20% для строительных сканов (часто низкое качество).\n   - **Шаг 2: OCR и извлечение таблиц**. Распознайте текст и детектируйте таблицы.\n   - **Шаг 3: Структуризация и семантика**. Парсите таблицу в DataFrame/JSON, примените правила/NLP для привязки (например, "материал: асфальт, поверхность: кровля, qty: 100 м²").\n   - **Шаг 4: Пост-обработка и валидация**. Используйте regex для единиц (м², кг), LLM (как GPT-4 via API) для семантической проверки. Сохраняйте в Excel/CSV для компании.\n   - **Автоматизация**: Python-скрипт с библиотеками (PyTorch для ML-моделей) или Airflow для батч-обработки. Тестируйте на 50–100 документах для accuracy >85%.\n\n   **Ожидаемая точность**: Для чистых таблиц — 90%+; для noisy сканов — 70–80% без fine-tuning. Стоимость: Бесплатно для open-source, но GPU ускорит (NVIDIA RTX или cloud как Google Colab).\n\n#### 2. **Рекомендуемые инструменты и подходы**\nЯ разделю на open-source (для разработки) и коммерческие (для production). Поскольку вы упоминали Donut ранее, начну с неё — она как раз подходит для вашей задачи.\n\n- **Donut (Document Understanding Transformer) — мой топ-рекомендация для end-to-end**:\n  - **Почему подходит**: Работает напрямую с изображениями (без отдельного OCR), понимает layout и извлекает structured data в JSON. Для таблиц в строительных PDF может напрямую выводить {"surface_type": "кровля", "material": "шифер", "quantity": 50, "unit": "м²"}. Обучена на receipts/forms, но fine-tune на ваших таблицах (нужно 500–2000 labeled изображений) сделает её идеальной для семантики (привязка материалов к поверхностям).\n  - **Достоинства**:\n    - End-to-end: Один проход — OCR + table parsing + entities.\n    - Robust к scanned/noisy: Лучше классического OCR на rotated/ handwritten таблицах.\n    - Кастомизация: Fine-tune на Hugging Face (модель "naver-clova-ix/donut-base-finetuned-cord-v2"). Для русского/английского в строительстве — добавьте датасет с аннотациями (используйте LabelStudio для labeling).\n    - Интеграция: Вывод в JSON, легко в Pandas для анализа.\n  - **Недостатки**: Медленно без GPU (2–10 сек/страница), базовая модель слаба на кириллице/специфических терминах ("арматура", "бетон М300") — нужен fine-tune. Не для очень сложных таблиц (merged cells).\n  - **Как использовать**:\n    - Установите: `pip install transformers torch`.\n    - Пример кода: Загрузите модель, передайте изображение страницы, получите JSON. Fine-tune: Соберите датасет (таблицы из ваших PDF с bounding boxes для entities), обучите 5–10 эпох на GPU.\n    - **Когда целесообразно**: Если у вас >1000 документов, бюджет на ML-разработчика (1–2 недели на setup) и нужно семантическое понимание. Точность после fine-tune: 85–95% для ключевых полей.\n  - **Альтернатива в экосистеме**: UDoT (улучшенная Donut) или Donut-Swin — для лучших таблиц.\n\n- **Классический OCR + Table Extraction (для быстрого старта или простых случаев)**:\n  - **OCR: PaddleOCR или EasyOCR** (лучше Tesseract для таблиц).\n    - PaddleOCR: Поддерживает 80+ языков (включая русский), table recognition модуль. Точность на scanned: 90%+ для печатного текста.\n    - EasyOCR: Лёгкий, GPU-optional, хорош для mixed text (английский + кириллица в строительстве).\n  - **Table Detection & Parsing**:\n    - Camelot-py или Tabula (после OCR конвертируйте в searchable PDF): Детектируют таблицы по линиям/grid.\n    - ML-based: Table Transformer (Hugging Face, "microsoft/table-transformer-detection") для детекции bounding boxes таблиц, затем OCR внутри.\n    - Nougat (Meta, 2023): End-to-end для PDF-таблиц в LaTeX/Markdown, но для scanned — комбинируйте с OCR. Хорошо для научных/технических документов.\n  - **Достоинства**: Быстро (CPU, <1 сек/страница), бесплатно, легко интегрировать. Для семантики — добавьте spaCy/NLTK для NER (named entity recognition: "материал" как entity).\n  - **Недостатки**: Двухэтапный (OCR может ошибаться на линиях таблиц, парсинг — ломаться на merged cells). Семантика требует ручных правил (regex для "кровля: шифер 100 м²").\n  - **Как использовать**: Конверт → OCR → Table detect → Pandas. Пример: PaddleOCR имеет built-in table module: `ocr = PaddleOCR(use_angle_cls=True); result = ocr.ocr(img, cls=True)`.\n  - **Когда целесообразно**: Для прототипа (1–2 дня setup), малого объёма (<500 PDF) или если таблицы простые (grid без сложного layout). Точность: 75–85% без тюнинга.\n\n- **Коммерческие/Cloud-решения (для production без глубокого ML)**:\n  - **Google Cloud Document AI**: Специально для таблиц/форм. API: Загружаете scanned PDF, получаете JSON с entities и таблицами. Custom Extractor — обучите на 100+ примерах ваших документов (материалы/поверхности как custom entities).\n    - Достоинства: Высокая точность (95%+ после training), handles scanned, multi-page. Интеграция с BigQuery для анализа.\n    - Недостатки: Платно (~$1.50/1000 страниц), требует API-ключа.\n  - **AWS Textract**: Аналогично, с Table/Form extraction. Хорош для строительных таблиц (detects keys like "Тип поверхности").\n    - Достоинства: Масштабируемо, queries для семантики (e.g., "extract quantities for roofing").\n    - Цена: ~$0.0015/страница.\n  - **Azure Form Recognizer (Microsoft)**: Custom models для вашего домена. Поддерживает русский, fine-tune на labeled PDF.\n    - Когда: Если компания уже на Azure/AWS, бюджет >$100/мес, нужно compliance (GDPR для docs).\n  - **Другие**: ABBYY FineReader (desktop, но API), или Nanonets (no-code, train на примерах).\n\n#### 3. **Дополнительные советы по реализации**\n- **Обработка специфики строительных документов**:\n  - Таблицы часто hierarchical (тип → подтип → материал). Используйте graph-based parsing (NetworkX) или LLM (OpenAI API: "Parse this table: [text] into JSON with surface-material-quantity").\n  - Единицы: Стандартизируйте с библиотекой `pint` (Python) для "м²", "тн".\n  - Многоязычность: Если docs на русском — выбирайте OCR с кириллицей (PaddleOCR, Google Vision).\n- **Тестирование и метрики**: Используйте датасет вроде PubTabNet или создайте свой (аннотируйте 20–50 PDF). Метрики: F1 для entities (материал/количество), BLEU для таблиц. Цель — >80% для production.\n- **Бюджет и ресурсы**:\n  - Open-source (Donut/Paddle): Бесплатно, но 1–3 месяца на разработку (ML-инженер).\n  - Cloud: Быстрее (неделя), но recurring costs.\n  - Если мало экспертизы: Начните с no-code как Nanonets или Rossum.ai — upload docs, train model visually.\n- **Потенциальные проблемы**: Handwritten notes в сканах — Donut/TrOCR справятся лучше; сложные таблицы (rotated text) — предобработка must-have.\n- **Следующие шаги**: Протестируйте PaddleOCR + Table Transformer на 5 ваших PDF (бесплатно на Colab). Если accuracy низкая — переходите к Donut fine-tune или Google AI.\n\nЕсли поделитесь примерами PDF (анонимизированными) или деталями (объём, формат таблиц), дам более точный код/план!	\N	\N	2025-10-30 07:15:53.325095+00
fc499454-8746-4aff-8a98-66b67574261a	5656f71c-c591-47b6-be10-afae5f2d4db2	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	user	погода сегодня в москве	\N	\N	2025-10-30 08:58:36.701324+00
1976b598-8a52-4910-8bbd-1d860d27f5c7	5656f71c-c591-47b6-be10-afae5f2d4db2	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	assistant	### Погода в Москве сегодня (на 10 октября 2023 года)\n\n- **Температура**: Днём около +10...+12°C, ночью +5...+7°C.\n- **Условия**: Облачно с прояснениями, возможен небольшой дождь во второй половине дня. Ветер юго-западный, 3–6 м/с.\n- **Влажность**: Около 70–80%.\n- **Осадки**: Вероятность 30–40%.\n\nПогода может измениться, рекомендую проверить актуальные данные на сайтах вроде Gismeteo, Яндекс.Погода или в приложении. Если нужно на завтра или другую дату — уточните! 😊	\N	\N	2025-10-30 08:58:39.343778+00
e6a9b1b9-8e24-4649-9985-a649f5e0582c	fd4aa858-1674-4e59-b366-760567181780	dde5c3c7-8368-4df9-b12b-160ff2cc02ab	user	гКал для ИТП - это что?	\N	\N	2025-10-30 10:33:22.053953+00
3ca5d93f-0c26-401b-8d18-36753e017a65	fd4aa858-1674-4e59-b366-760567181780	dde5c3c7-8368-4df9-b12b-160ff2cc02ab	assistant	### Что такое Гкал для ИТП?\n\nВаш вопрос, вероятно, касается терминов из сферы теплоснабжения и ЖКХ (жилищно-коммунального хозяйства) в России или странах СНГ. Давайте разберём по частям, чтобы было понятно:\n\n#### 1. **Гкал (гигакалория)**\n   - Это единица измерения тепловой энергии, принятая в России для учёта тепла в системах отопления, горячего водоснабжения и вентиляции.\n   - 1 Гкал = 1 000 000 000 калорий (или примерно 1,163 МВт·ч — мегаватт-часов).\n   - Гкал используется для расчёта объёма потреблённого тепла: например, сколько энергии ушло на обогрев дома или нагрев воды. Это стандартная единица по ГОСТ и нормативам (например, в счётчиках тепла).\n\n#### 2. **ИТП (Индивидуальный тепловой пункт)**\n   - ИТП — это устройство (узел) в многоквартирном доме или здании, которое регулирует и распределяет тепло от центральной теплосети.\n   - Оно включает приборы учёта (счётчики тепла), насосы, регуляторы температуры и может быть теплосчётчиком с расчётом в Гкал.\n   - ИТП позволяет индивидуально учитывать расход тепла для конкретного дома или подъезда, а не по общим нормативам.\n\n#### 3. **Гкал для ИТП — что это значит?**\n   - **Гкал для ИТП** — это показатель потребления тепловой энергии, измеряемый и учитываемый именно через индивидуальный тепловой пункт. То есть, ИТП оснащается теплосчётчиком, который фиксирует объём тепла в Гкал (потреблённое на отопление и ГВС).\n   - **Зачем это нужно?**\n     - Для точного расчёта оплаты: вместо средних нормативов (Гкал/м²) жильцы платят по реальному потреблению.\n     - Норматив: По правилам (Постановление № 354), если в доме есть ИТП с счётчиком, учёт ведётся по Гкал, показанным устройством.\n     - Пример: Если счётчик на ИТП показал 500 Гкал за месяц, то эта цифра умножается на тариф (например, 2000 руб./Гкал в вашем регионе), и получается счёт за тепло.\n   - Если ИТП не установлен или счётчик неисправен, используют нормативы (например, 0,02–0,05 Гкал/м² в месяц на отопление, в зависимости от климата и дома).\n\n#### Полезные советы:\n- **Проверить свой дом:** Узнайте в управляющей компании (ТСЖ или УК), есть ли ИТП и счётчик. Если да, то в квитанциях за ЖКУ будет графа "Тепло по ИТП" с указанием Гкал.\n- **Расчёт:** Если нужно посчитать самостоятельно, формула простая: Гкал = (Расход теплоносителя × Разница температур) / Коэффициент (по данным счётчика).\n- **Источники:** Подробнее можно почитать в Федеральном законе № 261-ФЗ "Об энергосбережении" или на сайте Минстроя РФ. Для вашего региона — на портале госуслуг или в местных нормативах.\n\nЕсли это не то, что вы имели в виду (например, другой контекст ИТП — Individual Thermal Point или что-то техническое), уточните, и я помогу разобраться! 😊	\N	\N	2025-10-30 10:33:35.019609+00
ee112f04-8119-4161-b940-dfed5bb00d86	f4a00c7f-cd36-48c2-9561-5dd8384240c1	f8e5ca55-75fd-419d-a30c-42ffa125d9d9	user	а	\N	\N	2025-10-30 10:45:07.461842+00
f6b9b67f-f7cb-4405-ae31-6d7497b279dd	f4a00c7f-cd36-48c2-9561-5dd8384240c1	f8e5ca55-75fd-419d-a30c-42ffa125d9d9	assistant	I'm not sure what you mean by "а" – is that a question, a typo, or the start of something in Russian? Let me know more details, and I'll help out! 😊	\N	\N	2025-10-30 10:45:09.356449+00
e53b7bce-99cc-4653-bf18-b4d1cedbd88a	7682cfc0-7d6a-4026-8ce0-47d4da0c87de	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	user	Имеет ли право генподрядчик согласно текста договора сдвигать сроки ключевых событий в случае существенных задержек в выдаче рабочей документации?\n\nДОГОВОР № 05/2024-КС\nгенерального подряда на строительство\nг. Москва \t\t\t\t\t\t\t\t\t\t02 мая 2024 года\n\nОбщество с ограниченной ответственностью «Специализированный застройщик» (ООО «СЗ»), именуемое в дальнейшем «Застройщик», в лице Генерального директора ИИИ, действующей на основании Устава, с одной стороны, и\nОбщество с ограниченной ответственностью «Строительное управление» (ООО «СУ»), именуемое в дальнейшем «Генподрядчик», в лице Генерального директора ТТТ, действующего на основании Устава, с другой стороны, совместно именуемые «Стороны» и каждая по отдельности – «Сторона», заключили между собой настоящий Договор (далее «Договор»), о нижеследующем \n\n1.\tТЕРМИНЫ И ОПРЕДЕЛЕНИЯ\n\tВ настоящем Договоре следующие термины будут иметь значения, определяемые настоящей статьей:\n1.1. «Объект» – Жилой комплекс, расположенный на Земельном участке, подключенный к городским инженерным коммуникациям, обеспеченный комплексом благоустройства, озеленения и малых форм, построенный Генподрядчиком в ходе реализации Договора в соответствии с Техническим заданием (Приложение №3 к Договору), Проектной и Рабочей документацией, выданной Застройщиком, и подготовленный к вводу в эксплуатацию. Идентификатор проекта: №90-128/КЛ-23.\n1.2. «Застройщик» – Общество с ограниченной ответственностью «Специализированный застройщик», заключившее договор строительного подряда с Генподрядчиком для строительства Объекта на Земельном участке.\n1.3. «Генподрядчик» – Общество с ограниченной ответственностью «Строительное управление» (ООО «СУ») являющееся членом саморегулируемой организации Ассоциации «Объединение профессиональных строителей РусСтрой, действующий на основании свидетельства о допуске к определенному виду или видам работ, которые оказывают влияние на безопасность объектов капитального строительства и выполняющее функции Генерального подрядчика по строительству Объекта на основании Договора, заключенного с Застройщиком.\n1.8. «Договор» – настоящий документ, подписанный Сторонами, включающий в себя текст Договора, приложения и все дополнительные соглашения, которые могут быть подписаны Сторонами в период его действия. Договор заключается между Застройщиком и Генподрядчиком и регулирует правоотношения Сторон. Однако Стороны учитывают, что финансирование Объекта осуществляется путем финансирования Банком и учитывают положения Кредитного договора. Все формы подписываемых документов, должны удовлетворять требования Банка и подлежат предварительному письменному согласованию с Банком. Взаимодействие с Банком по получению необходимых согласований осуществляет Застройщик. При этом получение либо не получение Застройщиком от Банка согласований не изменяют иные права Сторон, а также содержание и условия исполнения Сторонами своих иных обязательств.\n1.10. «Заключение о соответствии» («ЗОС») – заключение органа государственного строительного надзора (Комитета государственного строительного надзора города Москвы (Мосгостройнадзора), о соответствии построенного объекта капитального строительства требованиям технических регламентов и проектной документации, в том числе требованиям энергетической эффективности и требованиям оснащенности объекта капитального строительства приборами учета используемых энергетических ресурсов, оформленное в соответствии с положениями Градостроительных кодексов, распорядительных и нормативных документов Российской Федерации и города Москвы, и дающее право на получение Разрешения на ввод объекта в эксплуатацию.\n1.11. «Разрешение на ввод объекта в эксплуатацию» – документ, выданный органом государственного строительного надзора (Комитетом государственного строительного надзора города Москвы (Мосгостройнадзора), удостоверяющий выполнение строительства Объекта в полном объеме в соответствии с разрешением на строительство, соответствие построенного объекта капитального строительства градостроительному плану земельного участка и проектной документации, оформленный в соответствии с положениями Градостроительных кодексов, распорядительных и нормативных документов Российской Федерации и города Москвы.\n1.12. «Проектная документация» – документация, переданная Застройщиком, согласованная в установленном законодательством порядке, состоящая из текстовой и графической частей, выполненная в соответствии с требованиями нормативных актов в области проектирования и строительства в объеме необходимом для проведения Генподрядчиком работ по строительству Объекта, содержащая описание принятых архитектурных, инженерно-технических, функционально-технологических, конструктивных и иных решений в отношении Объекта, пояснения, результаты расчетов, обосновывающие принятые решения, ссылки на нормативные акты в области проектирования и строительства, а также документация в виде чертежей, схем, планов и других документов в графической форме, разработанная в соответствии с Постановлением Правительства Российской Федерации № 87 от 16.02.2008 г. «О составе разделов проектной документации и требованиях к их содержанию», требованиями Градостроительного кодекса РФ, СНиП, регламентов и других действующих нормативных актов Российской Федерации.\n1.13. «Рабочая документация» – разработанная на основе Проектной документации и состоящая из документов в текстовой и графической форме: рабочих чертежей, спецификаций оборудования и изделий, описаний, содержащих качественные и технические характеристики материалов, оборудования, конструкций, изделий, и являющаяся основанием для производства строительных и монтажных работ необходимых для производства Работ и ввода Объекта в эксплуатацию. В целях Договора Стороны относят Рабочую документацию как часть Проектной документации. \n1.14. «Исполнительная документация» – текстовые и графические материалы, отражающие фактическое исполнение проектных решений и фактическое положение объектов капитального строительства и их элементов в процессе строительства, реконструкции, капитального ремонта объектов капитального строительства по мере завершения определенных в проектной документации работ. Состав и порядок ведения исполнительной документации, предусмотрены Приказом Минстроя России от 16.05.2023 № 344/пр «Об утверждении состава и порядка ведения исполнительной документации при строительстве, реконструкции, капитальном ремонте объектов капитального строительства», регламентируется законодательством Российской Федерации.  \n1.15. «График строительства» - документ, являющийся приложением к Договору, устанавливающий график производства работ, промежуточные и окончательные сроки выполнения Работ, Ключевые события, являющийся Приложением №1 к Договору.\n1.16. «Ведомость договорной цены» - перечень Работ, выполняемых Генподрядчиком, их стоимость и затраты, ведомость объемов Работ и требуемых материалов, согласованные Сторонами в Приложении № 2 к Договору.\n1.17. «График выдачи Рабочей документации» - документ, являющийся приложением к Договору (Приложение № 19), устанавливающий график предоставления Застройщиком Рабочей документации, необходимый Генподрядчику для производства Работ соответствующего этапа.\n1.18. «Акт приемки объекта капитального строительства» («Акт № 1») - подписанный членами приемочной комиссии, подтверждающий готовность Объекта к вводу в эксплуатацию, составленный по форме Акта приемки законченного строительством Объекта (форма КС-11), утвержденной Постановлением Госкомстата РФ от 30.10.1997 №71a.\n1.19. «Акт приемки объекта в эксплуатацию» («Акт № 2») - подписанный Застройщиком, Генподрядчиком и Эксплуатирующей организацией (в случае ее привлечения) по итогам проверки, отображающий недостатки Работ и использованных материалов, дефектов, комплектности и исправности оборудования и инженерных систем, входящих в состав результата Работ, полноты Исполнительной документации и устанавливающий сроки устранения указанных недостатков Генподрядчиком. \n1.20. «Итоговый акт (Акт №3)» – являющийся приложением к Договору, акт сдачи и приемки результата полного объема выполненных Генподрядчиком предусмотренных Договором работ, подписываемый Застройщиком и Генподрядчиком, в соответствии со ст. 753 ГК Гражданского кодекса Российской Федерации (далее – «ГК РФ»), после передачи Генподрядчиком Застройщику Исполнительной документации в полном объеме, получения ЗОС на Объект, в сроки, определенные Договором, в соответствии с утвержденной Проектной документацией, Техническим заданием, Техническими условиями (ТУ), Ведомостью договорной цены, Графиком строительства, и другими Графиками и Приложениями, являющимися неотъемлемой частью Договора, требованиями действующего законодательства, строительными нормами, правилами, регламентами и условиями Договора. \n1.21. «Комплекс работ» - технологически законченный отдельный вид работ по строительству Объекта, включая подготовительные, строительно-монтажные и пусконаладочные работы, а также изготовление Исполнительной документации, выполняемый в объеме, предусмотренном Договором в соответствии с Техническим заданием, Проектной документацией, согласованной в установленном порядке. \n1.22. «Работа(ы)» – означает комплекс работ по Договору (п. 2.1-2.2 Договора), включая строительно-монтажные и пусконаладочные работы, выполняемые по видам, согласованным Сторонами в Договоре и в Приложениях к Договору. Работы выполняются в объеме, предусмотренном Договором в соответствии с Проектной документацией, Техническим заданием. Работы выполняются в соответствии с действующими на территории РФ и субъекта РФ актуализированными строительными нормами и правилами, СП, техническими условиями, ГОСТами, техническими и национальными регламентами, включая, но не ограничиваясь:\n- строительные, строительно-монтажные, специальные и прочие работы и выполнение исполнительной документации;\n- поставка, разгрузка, складирование, хранение на Стройплощадке материалов, оборудования и инвентаря;\n- установка, монтаж, наладка, испытания и подготовка к пуску в эксплуатацию строительного и инженерного оборудования в местах, определенных Проектной документацией, Техническим заданием;\n- монтаж, наладка и сдача в эксплуатацию систем холодного и горячего водоснабжения, канализации, водостока, отопления, вентиляции, электроснабжения и освещения с системой учета энергопотребления по каждому помещению, слаботочных, противопожарных и охранных систем, систем автоматизации и диспетчеризации; \n- устранение дефектов и неполадок, выявленных в Работах и материалах, оборудовании в период выполнения Работ и в течение гарантийного срока;\n- подготовка и передача отдельных видов, этапов, конструкций и стадий работ с оформлением необходимой документации, устранение дефектов в период гарантийного срока.\n1.23. «Техническое задание» - документ, являющийся приложением к Договору, подписанный уполномоченными представителями Сторон, определяющий объем, содержание работ и другие предъявляемые к ним требования, являющийся частью документации обязательной к применению по Договору (Приложение № 3 к Договору).\n1.24. «Стройплощадка (Строительная площадка/строительная площадка)» - ограждаемая территория, используемая для размещения возводимого Объекта, временных зданий и сооружений, техники, отвалов грунта, складирования строительных материалов, изделий, оборудования, инвентаря, размещения служб Генподрядчика и выполнения строительно-монтажных работ. Передается Генподрядчику Застройщиком по Акту приемки-передачи Строительной площадки для выполнения работ по Договору. \n1.25. «Субподрядчики (субподрядчики/подрядчики)» - иные подрядчики, которые привлекаются или могут быть привлечены Генподрядчиком к выполнению работ на Объекте, за неисполнение (ненадлежащее исполнение) обязательства которых Генподрядчик несет ответственность перед Застройщиком. \n1.26. «Скрытые Работы» - работы, скрываемые последующими работами и конструкциями, качество и точность которых невозможно определить после выполнения последующих работ.\n1.27. «Акт по форме КС-2» – документ, применяемый для предварительной приемки выполненных Генподрядчиком работ, подтверждающий фактическое выполнение работ, определенных в фактических объемах в соответствующем периоде с обязательным приложением комплекта документов, указанного в п.7.2 Договора. Оформляется Генподрядчиком по форме и правилам согласно Приложению № 4 к Договору, совместно с справкой о стоимости выполненных работ и затрат по форме КС-3 («Справка по форме КС-З») за отчетный период (по форме Приложения № 4 к Договору);\n1.28. Акт приемки работ по устранению недостатков (дефектов), выявленных в гарантийный срок - документ, оформляемый в целях фиксации приемки работ по устранению недостатков (дефектов), обнаруженных в выполненных Генподрядчиком работах в гарантийный срок после проведения работ. \n1.29. «Временные здания и сооружения» - все временные здания и сооружения любого типа, возводимые или приспособляемые Генподрядчиком на период проведения работ по Объекту, необходимые для производства и завершения работ, а также для обслуживания персонала Генподрядчика в рабочее время. После завершения работ временные здания и сооружения разбираются и вывозятся Генподрядчиком за пределы Объекта за свой счет.\n1.30. «Гарантийный срок» – период времени, в течение которого Генподрядчик гарантирует качество и пригодность результата выполненных работ на Объекте и устраняет в соответствии с условиями Договора своими силами и за свой счет все выявленные Застройщиком или правомочными в соответствии с действующим законодательством третьими лицами недостатки (дефекты), ненадлежащее качество Работ, связанные с исполнением Генподрядчиком своих обязательств по Договору, при отсутствии виновных действий со стороны Застройщика и третьих лиц.\n1.31. «Недостатки (дефекты)» – любые отступления от требований, предусмотренных Договором, Проектной и сметной документацией и строительными нормами, правилами, стандартами и действующим законодательством РФ и города Москвы. Генподрядчик в этом случае несет ответственность в объеме и порядке, предусмотренными условиями Договора и действующим законодательством, до момента полного устранения недостатков (дефектов).\n1.32. «Персонал Генподрядчика» - специалисты и/или рабочие, имеющие необходимую квалификацию, а в случае необходимости - квалификационные сертификаты и другие документы, подтверждающие возможность осуществлять соответствующие Работы на территории Российской Федерации.\n1.33. «Просрочка» – нарушение (несоблюдение) любых сроков, установленных Договором, в том числе начальных и конечных сроков выполнения работ в целом, начальных и конечных сроков выполнения работ по отдельным этапам работ (Ключевых событий).\n1.34. «Ключевое событие» – содержащийся в Графике строительства отдельный этап производства Работ, включающий сроки начала и окончания производства Работ по данному этапу. \n1.35. «Сетевые организации» – организации, эксплуатирующие инженерные сети: ПАО «МОЭК», ОАО «Мосэнергосбыт», ОАО «МОЭСК», ОАО «ОЭК», АО «Мосводоканал», ГУП «Мосводосток», ПАО «МГТС», ГБУ г. Москвы «Система 112», ООО «Корпорация ИформТелеСеть»), инженерные системы, здания и территорию объектов. \n\n2. ПРЕДМЕТ ДОГОВОРА\n2.1. Генподрядчик обязуется выполнить по заданию Застройщика своими и/или привлеченными силами и средствами полный комплекс работ по строительству Объекта, получению ЗОС на Объект, получению совместно с Застройщиком Разрешения на ввод Объекта в эксплуатацию (оказание необходимого содействия для ввода Объекта в эксплуатацию путем выполнения необходимых предусмотренных законом мероприятий, полномочия по проведению которых не могут быть переданы иным лицам), и передать построенный Объект с выполнением всех работ, предусмотренных Договором, Застройщику, в сроки, определенные Договором, в соответствии с утвержденной Проектной документацией, Техническим заданием, Техническими условиями (ТУ) и (или) Техническими заданиями (ТЗ), выданными ресурсоснабжающими предприятиями-монополистами (в части работ порученных Генподрядчику), Ведомостью договорной цены, Графиком строительства, Графиком выдачи Рабочей документации и Приложениями, являющимися неотъемлемой частью Договора, требованиями действующего законодательства, строительными нормами, правилами, регламентами и условиями настоящего Договора, в том числе с осуществлением своими силами и средствами руководства и координации строительства Объекта, а Застройщик обязуется, принять результат Работ и оплатить его в соответствии с условиями Договора.\nСтороны, на основании п. 1 ст. 432 Гражданского кодекса РФ согласовали следующее существенное условие Договора: целью выполнения Работ Генподрядчика является выполнение полного комплекса работ по строительству Объекта с функционирующим оборудованием, в связи с чем для Застройщика представляет интерес лишь построенный, введенный в эксплуатацию (получен ЗОС на Объект), завершённый всеми предусмотренными Договором Работами Объект в целом.\n2.2. Виды, содержание и объем Работ, а также предъявляемые к ним требования, определяются Договором, Техническим заданием, Проектной документацией, Рабочей документацией, а также действующей законодательной распорядительной и нормативной документацией, в том числе, но не ограничиваясь: техническими регламентами, строительными нормами и правилами (СНиП), Государственными строительными нормами (ГСН), территориальными строительными нормами (ТСН), и включают в себя, в том числе:\n2.2.1. Организацию и координацию производства строительных работ.\n2.2.2. Ограждение Строительной площадки, организация проездов к Строительной площадке, освобождение Строительной площадки от мусора, строительство временных дорог и площадок, зданий и сооружений, пункт мойки колес, временных инженерных сетей, выполнение мероприятий по сохранности существующих инженерных сетей и сооружений, зданий, защите и сохранению зеленых насаждений в соответствии с Проектной документацией, Техническим заданием, содержание Строительной площадки в период строительства и ввода Объекта в эксплуатацию.\n2.2.3. Работы подготовительного периода, в том числе, оснащение и обустройство Строительной площадки, установка башенных кранов, бетонно-распределительных стрел и подъемников в соответствии с Проектной документацией, Техническим заданием.\n2.2.4. Строительство подземной и надземной частей зданий в полном объеме, с устройством несущих и ограждающих конструкций, фасадов, выполнением внутренних (включая подготовительные, черновые и финишные) и наружных отделочных работ, клининг помещений, мест общего пользования и мытье окон после окончания работ (перед ЗОС) и повторно, перед подписанием Итогового акта.\n2.2.5. Работы по внутренней отделке выполняются Генподрядчиком в следующих объемах:\n2.2.5.1. Внутренняя отделка мест общего пользования жилой части, двух павильонов, кладовок и паркинга производится в полном объеме в соответствии с Техническим заданием, Проектной документацией, переданной Застройщиком, дизайн-проектами, передаваемыми Застройщиком до начала выполнения соответствующих работ.\n2.2.5.2. Внутренняя отделка квартир не выполняется. \n2.2.6. Монтаж, пуско-наладку и ввод в эксплуатацию внутренних инженерных систем отопления, вентиляции, кондиционирования, дымоудаления, холодного и горячего водоснабжения, канализации, электроснабжения и освещения (внутреннего и наружного), противопожарных систем, слаботочных сетей, систем контроля доступа, автоматизации и диспетчеризации (в том числе коммерческий и технический учет), полного комплекса инженерного оборудования зданий (монтаж, наладка, включение по постоянной схеме, сдача в эксплуатацию) с учетом сдачи систем Объекта в состоянии готовности к эксплуатации.\n2.2.6.1. В помещениях осуществляется ввод инженерных систем с обустройством узлов учета в соответствии с Проектной документацией, Техническим заданием.\n2.2.7. Монтаж, пуско-наладку и ввод в эксплуатацию электрощитовых, вентиляционных камер, индивидуального теплового пункта.\n2.2.8. Монтаж, наладку и ввод в эксплуатацию лифтов и подъемников, включая строительные, отделочные, электромонтажные и слаботочные работы в шахтах, приямках и машинных отделениях, с составлением соответствующей документации.\n2.2.9. Испытания смонтированного оборудования и работы систем, предусмотренные нормативной документацией.\n2.2.10. Выполнение работ по благоустройству территории в соответствии с Проектной документацией и Техническим заданием. \n2.2.11. Работы по поставке материалов и оборудования.\n2.1.12. Работы по координации действий и ответственность за подрядчиков.\n2.2.13. Прочие, прямо не поименованные в данном разделе работы, но необходимые для строительства Объекта в соответствии с Проектной документацией и Техническим заданием, получения ЗОС и ввода Объекта в эксплуатацию, выполнения отделки мест общего пользования согласно, дизайн-проекту.\n2.3. Наружные инженерные сети (водоотведение – канализация хозяйственно-бытовая и ливневая) и сооружения выполняет Генподрядчик, на основании Рабочей документации переданной Застройщиком и Технического задания, путем привлечения других подрядных организаций, при этом Генподрядчик отвечает за безопасность на Строительной площадке, к его обязанностям относится обслуживание Строительной площадки и координация работы всех привлеченных им подрядчиков на Строительной площадке и поставщиков, включая их персонал, а также организация уборки территории Стройплощадки и пяти метров прилегающей к Стройплощадке территории, вывоза мусора, охраны имущества, охраны периметра Стройплощадки, организация точек подключения к сетям механизации (при необходимости) .\nГенподрядчик осуществляет взаимодействие и обеспечивает на Строительной площадке необходимые условия для проведения Сетевыми организациями, привлеченными Застройщиком, работ в целях осуществления технологического присоединения (предоставление места под размещение бытового городка, координация работы, организация точек подключения к сетям механизации и т.д.) \n2.4. Во избежание сомнений, Работы, которые должны быть выполнены Генподрядчиком по Договору, включают все возможные работы, определенно не упомянутые в Договоре и/или Приложениях к нему, но необходимые для строительства, завершения строительства и подготовки к вводу в эксплуатацию Объекта в соответствии с условиями Договора, а также для нормальной, безопасной, надежной, эксплуатации Объекта в целом, в соответствии с его целевым назначением, включая земляные работы, ограждение котлована, дренаж, водопонижение, фундаменты (при необходимости выполнения работ по водопонижению порядок и условия согласовываются Сторонами по дополнительному соглашению) а также все необходимые мероприятия по сохранности наружных инженерных коммуникаций и сооружений (в том числе мероприятия, требуемые эксплуатирующими данные сети и сооружения организациями) и прочее. \nВ связи с этим, если иное прямо не предусмотрено Договором, любое наименование работ, прямо не исключенное из состава Работ и не возложенное на Генподрядчика в соответствии с Договором, считается входящим в объем Работ и в Стоимость Работ по Договору, если такие работы являются необходимыми для достижения результата Работ (завершения строительства Объекта) в соответствии с Техническим заданием и Проектной документацией, Рабочей документацией переданными Генподрядчику при заключении Договора. Генподрядчик подтверждает, что работы, необходимые для достижения результата Работ, определенного в соответствии с Техническим заданием и Проектной документацией, не являются дополнительными работами, если их выполнение не обусловлено изменениями, внесенными Застройщиком в Техническое задание и/или Проектную документацию.\n\n3. СРОКИ ВЫПОЛНЕНИЯ РАБОТ\n3.1. Сроки выполнения работ по Договору по комплексам и видам работ согласованы Сторонами в Графике строительства. \n3.2 Работы, предусмотренные Договором, должны быть выполнены в следующие сроки:\nначало работ по Договору 02 апреля 2024 года.\nокончание работ по Договору не позднее 01 июня 2026 года. \nПри этом Генподрядчик обязуется соблюдать сроки достижения Ключевых событий: \n\n№\tКлючевое событие\tДата начала:\tДата окончания:\n1.\tМонолитные работы подземной части\t20.05.2024 г.\t03.08.2025 г.\n2.\tМонолитные работы надземной части\t25.12.2024 г.\t08.09.2025 г.\n3.\tКладка наружных стен типовых этажей\t28.02.2025 г. \t25.09.2025 г.\n4.\tРаботы по устройству наружных сетей\t15.04.2024 г.\t30.01.2026 г.\n5.\tРаботы по устройству фасада\t01.05.2025 г.\t16.01.2026 г.\n6.\tРаботы по устройству внутренних механических инженерных систем\t22.02.2025 г.\t23.01.2026 г.\n7.\tРаботы по устройству внутренних электрических инженерных систем\t07.05.2025 г.\t23.01.2026 г.\n8.\tОтделочные работы типовых этажей\t25.04.2025 г.\t10.02.2026 г.\n9.\tОтделочные работы лобби (в т.ч. лобби офисно-административного комплекса)\t25.04.2025 г.\t10.02.2026 г.\n10.\tРаботы по благоустройству территории, озеленению, монтажу малых архитектурных форм \t02.08.2025 г. \t27.12.2025 г.\n11.\tПолучение ЗОС\t01.03.2026 г. \t01.04.2026 г.\n12.\tУстранение всех замечаний и подписание Итогового акта (Акта №3)\t01.04.2026 г.\t01.06.2026 г.\n\t\nПри этом в срок до 01 мая 2026 года Стороны обязуются составить Акт №2 (как изложено в п. 13.1 Договора) с исчерпывающим перечнем всех дефектов, подлежащих устранению до подписания Итогового акта.\nПри этом, под практическим завершением по каждому из Ключевых событий подразумевается выполнение Генподрядчиком перечисленных выше видов работ в объеме, достаточном для выполнения последующих видов работ и начала их использования, с возможным наличием технологических проемов и отверстий, необходимых для осуществления прочих видов работ по Договору. Фактическая дата Ключевого события фиксируется актом, составленным Сторонами, а в случае немотивированного отказа или уклонения одной из Сторон от подписания акта о наступлении Ключевого события (при условии, что все работы в рамках соответствующего Ключевого события выполнены надлежащим образом) – актом, составленным без участия Стороны (Сторон), которая(ые) отказывается/ уклоняется от подписания акта.\n3.3. Фактической датой окончания работ по Договору считается дата подписания Сторонами Итогового акта (Акта № 3).\n\n4.\tОСНОВНЫЕ ПОЛОЖЕНИЯ\n4.1. Результатом выполненных и принятых от Генподрядчика работ по Договору является полностью законченный строительством и готовый к эксплуатации Объект, на который оформлен ЗОС, а также подписан Сторонами Итоговый акт (Акт №3).\n4.2. Под работами, выполняемыми Генподрядчиком по Договору, понимаются как работы, выполняемые собственными силами, так и работы, выполняемые его подрядными/субподрядными организациями, за которые Генподрядчик несет такую же ответственность, как и за работы, выполняемые собственными силами. \nНе позднее 10 (десяти) рабочих дней после заключения договора с каждым конкретным подрядчиком Генподрядчик обязан направить уведомление Застройщику, с указанием видов работ, выполняемых данным подрядчиком, с приложением документов (ИНН, ОГРН, учетная карточка организации с контактными телефонами, свидетельство о допуске к работам, если это необходимо для деятельности организации).\n4.3. Стоимость возведения, эксплуатации, последующего демонтажа и вывоза ограждения Строительной площадки (за исключением ограждения принятого Генподрядчиком при приемке Строительной площадки), временных зданий, сооружений, дорог, сетей и коммуникаций (как собственных, так и арендуемых Генподрядчиком или его субподрядчиками), необходимых Генподрядчику или его субподрядчикам для выполнения комплекса работ по строительству Объекта, включена в стоимость работ по Договору и отдельной оплате (сверх установленной Стоимости работ) со стороны Застройщика не подлежит. Право собственности на указанные временные ограждения, здания, сооружения, дороги сети и коммуникации принадлежит Генподрядчику.\n4.4. Временные здания, сооружения, сети и коммуникации должны быть демонтированы Генподрядчиком и удалены со Строительной площадки не позднее 7 (семи) календарных дней с даты завершения Устранений всех замечаний и подписания Итогового акта (Ключевое событие №12). \n4.5. Механизмы, в том числе грузовые подъемники и башенные краны (в комплексе с подготовкой площадки для подкрановых путей и монтажом подкрановых путей), транспорт, строительное оборудование, леса, инструменты, оснастка, подсобные приспособления и т.п., необходимые для выполнения работ по Договору, а также их доставка на территорию строительства и удаление с нее обеспечиваются и оплачиваются Генподрядчиком и отдельной оплате со стороны Застройщика не подлежат.\n4.6. Застройщик предоставляет Генподрядчику на территории строительной площадки на период строительства точки подключения временных инженерных сетей к городским сетям водоснабжения, и электросетям. Параметры электроснабжения на период строительства, описаны в ТУ и рабочей документации раздела «Механизация строительства». В случае, если в ходе строительства будет выявлен недостаток электрической мощности (например, на электропрогрев бетона или отопление бытового городка), то Застройщик обязуется компенсировать затраты Генподрядчику на использование дополнительного дизель-генератора необходимой мощности (доставка, аренда, обслуживание, стоимость топлива). На период до организации временного подключения к сети канализации Генподрядчик самостоятельно и за свой счет обязуется обеспечивать вывоз канализации, что включено в стоимость работ по Договору.\n\t4.6.1. В случае отсутствия на период строительства предоставления Заказчиком Генподрядчику точек подключения временных инженерных сетей к городским сетям водоснабжения и электросетям, то Заказчик компенсирует Генподрядчику стоимость понесенных документально подтвержденных расходов сверх установленного на них городского тарифа. \n4.7. Обустройство временных сетей в пределах Строительной площадки осуществляется Генподрядчиком самостоятельно, включено в Цену работ по Договору и отдельной оплате (сверх установленной Стоимости работ) со стороны Застройщика не подлежит.\n4.8. Стороны пришли к соглашению о следующих условиях распределения между ними расходов по оплате потребленных Генподрядчиком энергоресурсов:\n4.8.1. Затраты Генподрядчика по использованию энергоресурсов (электроэнергией, холодной водой, водоотведением (бытовое и сточное), обеспечение Объекта теплом, а также затраты на оплату тепловой энергии на период проведения пуско-наладочных работ) включены в Цену работ до даты получения ЗОС, указанной в п.3.2. Договора и рассчитанную согласно п.5.3. Договора, и отдельной оплате со стороны Застройщика не подлежат. Стоимость потребленных энергоресурсов Генподрядчик оплачивает Застройщику, расчёты по потребленным Генподрядчиком энергоресурсам осуществляются согласно п. 7.6. Договора.\nВ случае переноса срока получения ЗОС, не по вине Генподрядчика Застройщик обязуется компенсировать расходы Генподрядчика на оплату коммунальных услуг, отопления, а также компенсировать расходы Генподрядчика на охрану, оплату труда ИТР, содержание Строительной площадки в размере 5 000 000 (пять миллионов) рублей в месяц с даты завершения Работ по получению ЗОС (Ключевое событие №11).\nРазмер платы за обеспечение электроэнергией определяются на основании данных о фактическом потреблении электроэнергии Генподрядчиком по действующим тарифам. Фактическое потребление электроэнергии определяется по показаниям контрольно-измерительной аппаратуры (счетчик), а при ее отсутствии – исходя из фактически отработанного агрегатами Генподрядчика и привлеченных им Субподрядчиков времени и мощности агрегата по действующим тарифам.\nРазмер платы за обеспечение холодной водой определяются по показаниям счетчика учета водопотребления и действующим тарифам, утвержденным уполномоченным органом, а в случае его отсутствия в порядке, предусмотренном договором между Застройщиком и соответствующей ресурсоснабжающей организацией.\nРазмер платы за водоотведение (бытовое) определяются расчетным путем исходя из фактического потребления воды Генподрядчиком и привлеченными им Субподрядчиками.\nЗатраты на водоотведение (поверхностного стока), а также водопонижение в период строительства несет Генподрядчик, на основании счетов от Застройщика.\nРазмер платы за потребление Генподрядчиком тепловой энергии на отопление и теплоснабжение определяются по показаниям счетчика тепла и действующим тарифам, утвержденным уполномоченным органом, а в случае его отсутствия в порядке, предусмотренном договором между Застройщиком и соответствующей ресурсоснабжающей организацией.\nГенподрядчик обязуется своевременно заключить договор со специализированной организацией на вывоз илового осадка с моек колёс оборотного цикла, затраты по такому договору входят в стоимость работ по Договору и дополнительно Застройщиком не оплачиваются.\n4.9. При передаче Сторонами Строительной площадки (как от Застройщика Генподрядчику, так и от Генподрядчика Застройщику), а также ежемесячно – до 5 (пятого) числа месяца, следующим за отчетным, Стороны подписывают акт, в котором фиксируют показания приборов учета электроэнергии и воды в точках непосредственного отбора мощности Генподрядчиком, подающейся на Строительную площадку, при этом показания приборов учета фиксируются Сторонами также нарастающим итогом. При отказе представителей Генподрядчика подписывать указанный в настоящем пункте акт, выразившимся в действии, либо бездействии Генподрядчика, либо его представителей, данный акт составляется и подписывается в одностороннем порядке представителем Застройщика, после чего такой акт считается достаточным основанием для учета фактически израсходованной электроэнергии и воды Генподрядчиком при выполнении работ по Договору за истекший период.\nУчет использованной Генподрядчиком электроэнергии и воды по временным сетям осуществляется Застройщиком в точках присоединения (п. 4.6. Договора). Генподрядчик ежемесячно оплачивает Застройщику стоимость фактически израсходованной электроэнергии, воды, а также сброса в сети канализации за истекший месяц по тарифам ресурсоснабжающих организаций в соответствии с п. 7.6. Договора. \n4.10. Генподрядчик несет риск гибели и/или случайного повреждения материалов, оборудования, изделий, конструкций, механизмов, имущества и т.д., находящихся на Строительной площадке, а также результата выполненной работы до даты подписания Сторонами Итогового акта (Акта №3). Генподрядчик также несет риск случайной гибели или случайного повреждения временных зданий, сооружений, сетей и коммуникаций до их демонтажа и удаления.\n4.11. Подписание промежуточных актов приемки работ не означает перехода к Застройщику рисков, определенных в пункте 4.10. Договора. Стороны пришли к соглашению, что в период действия Договора Застройщик вправе требовать от Генподрядчика устранения дефектов и брака по работам, в отношении которых Сторонами уже подписаны Акты по форме КС-2. \nПри этом, подписание промежуточных Актов по форме КС-2 подтверждает выполнение промежуточных работ лишь для проведения расчетов, Акты по форме КС-2 не являются актами предварительной приемки результата отдельного этапа работ, с которыми закон связывает переход риска на Застройщика.\n4.12. С даты принятия Генподрядчиком Строительной площадки и до подписания Сторонами Итогового акта или до момента возврата Стройплощадки Застройщику по иным основаниям, охрану периметра Стройплощадки, охрану строящихся зданий, сооружений, сетей и коммуникаций, входящих в состав Объекта, а также материалов, изделий, конструкций, временных зданий и сооружений, строительной техники и другого имущества, принадлежащего Генподрядчику, его субподрядчикам и поставщикам, обеспечивает Генподрядчик за свой счет. \n4.13. Охрана периметра территории Объекта и доступ на Строительную площадку осуществляется специализированным охранным предприятием, привлеченным Генподрядчиком.\nОплату специализированному охранному предприятию за услуги по охране периметра территории Объекта осуществляет Генподрядчик. \nГенподрядчик обязуется заключить договор со специализированным охранным предприятием, в срок не позднее 15 (пятнадцати) календарных дней с момента подписания Договора.\nСтоимость услуг специализированного охранного предприятия включена в стоимость работ Генподрядчика по Договору и отдельной оплате не подлежит.\nСпециализированное охранное предприятие (ЧОП, ЧОО) должно быть зарегистрировано в соответствии с законодательством РФ, иметь необходимые лицензии и разрешения. \nЗастройщик дополнительно привлекает специализированное охранное предприятие для охраны периметра территории Объекта и контроля доступа на строительную площадку в т.ч. путем организации биометрической системы контроля допуска в КПП.\nГенподрядчик обязуется в течение 1 (одного) календарного месяца с даты заключения Договора установить КПП на Объекте в счет цены Договора, предоставив в нем 2 (Два) места для сотрудников специализированного охранного предприятия Застройщика (первое КПП).\n4.14. С учетом п.п. 4.12. – 4.13. Договора, Генподрядчик, с привлечением специализированного охранного предприятия, за свой счет обеспечивает:\n- круглосуточный допуск на территорию Объекта транспортных средств, механизмов, строительного оборудования, строительных материалов и персонала Застройщика, Генподрядчика и субподрядчиков для выполнения работ по Договору;\n- оснащение Стройплощадки камерами видеонаблюдения;\n- установку в течение 1 (одного) месяца с даты заключения Договора биометрической системы контроля доступа на Объект (Face ID), предоставленную Застройщиком, ее работоспособность и ежедневный сбор данных о всех сотрудниках Генподрядчика и привлеченных им подрядчиков в соответствии с законодательством РФ, в полном объеме. Обе стороны обязуются приложить усилия по интеграции системы контроля периметра Генподрядчика и системы Face ID, предоставленной Застройщиком. Если интеграция технически невозможна, на Объекте применяется Face ID;\n- наличие документарной (журналы, списки) и электронной систем (пропускная электронная система) учета работников на Стройплощадке;\n- наличие на Стройплощадке системы охранно-пожарного оповещения.\n4.15. Стороны подписывают акт приема-передачи Строительной площадки одновременно с подписанием Акта – допуска на Объект по установленной форме.\n4.16. Генподрядчик является собственником строительных и бытовых отходов, избыточного грунта, образующихся в ходе деятельности Генподрядчика при строительстве Объекта и обязуется совершать все необходимые действия, в том числе получать и согласовывать необходимую документацию, требующуюся по нормам экологического законодательства РФ, в том числе от своего имени совершать все действия, необходимые для заключения договоров. От своего имени заключать договоры на транспортировку, вывоз, утилизацию/размещение строительных и бытовых отходов на специализированных полигонах, имеющих действующие лицензии на размещение отходов в местах и состоящих в Государственном реестре объектов размещения отходов. \nПри этом Генподрядчик ежеквартально, до конца месяца, следующего за окончанием квартала, предоставляет Застройщику заверенные подписью исполнительного органа и печатью организации копии актов приема-передачи отходов, контрольных талонов и товарно-транспортных накладных. И другую экологическую документацию по запросу Застройщика.\n4.17. Генподрядчик подтверждает, что до заключения Договора тщательно обследовал Строительную площадку, прилегающую территорию и строения, ознакомился и оценил все условия, связанные с выполнением Работ (в т.ч. ознакомился с проектной документацией, разработанной на дату заключения Договора, полученными положительными заключениями уполномоченной экспертизы), получил от Застройщика информацию по всем вопросам, которые бы могли повлиять на сроки, стоимость и качество выполняемых Работ, изучил имеющиеся отчеты и заключения, составленные на основании обследований, и удовлетворительно осведомлен о: \n- размерах, конфигурации и характере Строительной площадки и прилегающих территорий и строений;\n- результатах исследования местности, гидрологических, геологических и климатических условиях территории Строительной площадки;\n- наличии необходимых коммуникаций и инфраструктуры;\n- расположении инженерных коммуникаций и сооружений, находящихся в зоне влияния строительных работ по объекту;\n- объемах и характере работ, которые предстоит выполнить, в том числе обо всех материалах, которые нужно поставить, чтобы произвести и завершить работы, предусмотренные Договором, а также устранить любые дефекты и несоответствия;\n- потребностях Генподрядчика в обеспечении подъездных путей, бытовых помещений и сооружений, в численности персонала и рабочей силы, в энергоснабжении, водоснабжении, транспортном обслуживании.\nГенподрядчик согласен принять без замечаний и под свою ответственность Строительную площадку и удовлетворен ее состоянием.\n4.18. Стороны определили следующий порядок разработки, согласования и передачи Проектной документации (Рабочей документации).\n4.18.1. Застройщик несет ответственность за качество Проектной документации. \n4.18.2. Застройщик разрабатывает Рабочую документацию и передает ее Генподрядчику со штампом «в производство работ» согласно Графику выдачи Рабочей документации. \nНа этапе рассмотрения и согласования разделов Рабочей документации Генподрядчик знакомится с подготавливаемыми материалами и может направить свои замечания (дополнения) и корректировки до утверждения Рабочей документации и передачи ее в производство работ.\nДокументы, составляющие Проектную документацию, являются взаимодополняющими и совокупными, и требования, установленные в одном документе, являются столь же обязательными, как и при их установлении во всех документах. В случае расхождений или несоответствий Стороны обязаны рассмотреть расхождения и определить путем подписания двустороннего документа по какому документу Проектной документации производятся работы. В дальнейшем Застройщик предпримет все меры для устранения расхождений в документации. \nВ случае отсутствия такого согласования вводится следующий приоритет документов технической документации:\n4.18.2.1. Высший приоритет – Проектная документация стадии «П»; \n4.18.2.2. Следующий уровень – Техническое задание;\n4.18.2.3. Следующий уровень приоритета – Рабочая документация;\n4.19. Генподрядчик имел возможность осуществить проверку всей переданной ему на момент заключения Договора документации, тщательно ознакомился с Техническим заданием, Проектной и прочей документацией, касающейся строительства Объекта, и согласен с тем, что принятая им документация позволяет начать Работы по строительству Объекта по Договору. \n4.20. Никакая другая работа Генподрядчика не является приоритетной в ущерб Работам по Договору.\n\n5. СТОИМОСТЬ РАБОТ\n5.1. Стоимостью работ (далее «Цена работ», «Стоимость работ») по Договору является стоимость полного объема и состава работ, выполняемых Генподрядчиком по Объекту в соответствии с Проектной документацией, Техническим заданием, Ведомостью договорной цены, Базовой стоимостью материалов, другими Приложениями к Договору, действующими строительными нормами и правилами, и другими нормативными документами, условиями Договора. \n5.2. Объемы работ, выполненные Генподрядчиком с отступлением от Проектной или нормативной документации, Технического задания, а также выполненные с дефектами, нарушениями требований, предъявляемых к их качеству или с отступлением от условий Договора, а также не оформленные или не сданные (не принятые от Генподрядчика) в установленном порядке, включению в Стоимость работ по Договору не подлежат. \n5.3. Стороны пришли к соглашению о том, что общая Стоимость работ по Договору в объеме, предусмотренном Техническим заданием согласно Ведомости договорной цены, составляет 3 390 000 000 (Три миллиарда триста девяносто миллионов) рублей 00 копеек, в том числе НДС 20% (565 000 000 рублей 00 копеек). \n5.4. Указанная в настоящем разделе Договора Стоимость работ по Договору согласована Сторонами, является фиксированной (твердой), за которую Генподрядчик обязан выполнить все работы, предусмотренные Техническим заданием, Проектной документацией, СП, СНиП, ГСН, ТСН и СанПиН, ГОСТ, прочими техническими регламентами и нормами, применимыми нормативными и распорядительными документами. Стоимость работ включает в себя все затраты Генподрядчика, необходимые для выполнения полного объема подлежащих выполнению работ или необходимых для этого расходов, включая стоимость работ, оборудования, материалов, изделий, строительной техники и инвентаря, таможенные и транспортные платежи, налоги и сборы, пошлины, штрафы, страхование, иные выплаты Генподрядчика, стоимость рабочей силы или колебания валютного курса по Договору и изменению не подлежит, за исключением случаев, прямо предусмотренных Договором и законодательством.\nВ Стоимости работ учтена стоимость всех, включая прямо не поименованных материалов, конструкций, изделий, оборудования, энергоресурсов, подсобно-вспомогательных и расходных материалов, строительного оборудования и приспособлений, использование машин и механизмов, строительно-монтажных и пуско-наладочных работ, затрат на проведение необходимых испытаний, ревизий, сертификаций, съемок, опробования работы оборудования и систем, получение сертификатов, согласований, заключений и т.п., и выполнение их требований, полного комплекса геодезических работ, содержания Строительной площадки (в том числе коммунальные платежи за потребленные электро/энергию и воду по показаниям узлов учета, обслуживание, охрана, пожарная безопасность и др.), обеспечение временными зданиями и сооружениями, затраты сезонного характера, в т.ч. производство работ в зимнее время, затраты на благоустройство, затрат на получения ЗОС, а также прочих затрат, обеспечивающих строительство Объекта, получение ЗОС и выполнение Генподрядчиком всех работ по Договору.\nСтоимость работ учитывает инфляцию, возможное удорожание стоимости материалов (с учетом положений п. 5.13.), изменение курса национальной и резервных валют, строительно-монтажные и гражданские риски, увеличение сроков выполнения работ (по вине Генподрядчика), гарантийные обязательства, затраты на подготовку Строительной площадки и прилегающей территории, ее содержание и временную эксплуатацию, затраты связанные с мобилизацией строительной техники и персонала Генподрядчика, доставкой материалов, изделий, конструкций и оборудования, необходимых для начала производства работ и их демобилизацией после окончания работ, или в случае прекращения действия Договора, услуги Генподрядчика, затраты, связанные с обеспечением Генподрядчика электроэнергией, теплом, водой бытовой и питьевой, канализацией, связью и иными ресурсами, необходимыми и достаточными для производства Работ на Объекте до даты ЗОС, сметную прибыль, непредвиденные расходы, зимнее удорожание, сезонность проведения работ и прочие погодные условия, затраты на привлечение иностранной рабочей силы, размещение рабочих, все налоги и сборы и пошлины РФ, временные здания и сооружения.\n5.5. Генподрядчик несет единоличную ответственность за правильность и полноту включения в Ведомость договорной цены всех работ и затрат, необходимых для выполнения работ по Договору согласно Технического задания и Проектной документации, и Рабочей документации, переданной Застройщиком на момент подписания Договора. В случае, если по каким бы то ни было причинам Генподрядчик не включил в Ведомость договорной цены работы (основные, сопутствующие, вспомогательные), которые необходимо выполнить согласно Технического задания и Проектной документации, и Рабочей документации, переданной Застройщиком на момент подписания Договора, в рамках Договора, или выявил арифметические ошибки подсчета объема и стоимости, он не вправе требовать увеличения стоимости Работ, указанной в п. 5.3. Договора. Итоговая стоимость работ остаётся неизменной. Занижение или отсутствие вида, объема работ в Ведомости договорной цены, но присутствующих в Техническом задании и Проектной документации, не служит основанием пересмотра стоимости Работ, указанной в п. 5.3. Договора.\n5.6. В Стоимость работ не входят затраты на технический надзор и осуществление мониторингов, требуемые организациями, эксплуатирующими инженерные сети и сооружения (в том числе метрополитен).\nПо требованию Застройщика Генподрядчик обязуется осуществить работы, обозначенные в настоящем пункте Договора, путем заключения договоров с соответствующими организациями с отнесением затрат по таким договорам на Застройщика. В таких случаях Сторонами заключается дополнительное соглашение к Договору с указанием размера затрат и основными условиями.\n5.7. В целях правильного оформления Генподрядчиком Актов по форме КС-2 и Справок по форме КС-3 и последующего промежуточного финансирования работ, а также в целях определения стоимости работ, материалов, изделий или оборудования в случаях, предусмотренных Договором, Стороны согласовывают Ведомость договорной цены.\n5.8. Любые количественные показатели (за исключением Стоимости работ, указанной в п. 5.3. Договора), приведенные в Договоре и приложениях к нему, являются только приблизительными и не принимаются в качестве фактических и точных объемов выполняемых Генподрядчиком работ и, поскольку иное прямо не предусмотрено в Договоре, Генподрядчик во всех случаях обязан выполнить все работы в объеме, необходимом для строительства Объекта, выполнения отделочных работ, получения ЗОС и обеспечения готовности к получению Разрешения на ввод Объекта в эксплуатацию за вознаграждение в форме уплаты Стоимости работ.\n5.9. Стоимость черновой и чистовой отделки, технических дверей (лючки), оконечных приборов (розетки, выключатели, светильники и т.п.) навигации, ОДШ МОПов уточняется после выхода дизайн-проекта и РД, что оформляется соответствующим Дополнительным соглашением. Общий бюджет определен Сторонами в размере 300 000 000 (Триста миллионов) рублей, в т.ч НДС, при этом Стороны согласовали следующий перечень работ:\nОтделка паркинга, лобби и типовых этажей МОП (отделка пола, отделка стен и потолка, устройство МОКАПа автостоянки, МОКАП фрагмента лобби, МОКАП фрагмента типового этажа, МОКАП отделки 15-го этажа МОП, освещение, навигация, мебель, санфаянс, сантехника, двери и лючки первых этажей лобби, декоративные элементы, обрамления дверей и лифтовых порталов, почтовые ящики и прочая мебель, отопление для проведение отделочных работ (кроме работ предусмотренных другими разделами) и передачи объекта до Итогового акта, а также другие работы, предусмотренные Рабочей документацией на отделку.\nСтоимость благоустройства, в т.ч. МАФы/освещение/навигации и т.д., уточняется после выхода дизайн-проекта и РД, что оформляется соответствующим Дополнительным соглашением. Общий бюджет благоустройства определен Сторонами в размере 100 000 000 (Ста миллионов) рублей, в т.ч НДС.\nКровля здания и павильона является эксплуатируемой.\nСтороны согласовали следующий перечень работ:\n- Благоустройство кровель;\n- Устройство всех подстилающих слоев, устройство финишных слоев;\n- Деревья и озеленение;\n- Малые архитектурные формы (МАФы);\n- Подпорные стенки;\n- Монтаж систем наружного освещения, включая уличные фонари, подсветку зданий;\n- Полив территории – установка системы автоматического полива и обслуживание;\n- Установка шлагбаумов;\n- Ограждение территории;\n- другие работы, предусмотренные Рабочей документацией по благоустройству.\n5.10. Застройщик имеет право по своей инициативе в одностороннем порядке принять решение об изменении Проектной документации и/или Технического задания, при этом:\nВ случае если вносимые Застройщиком изменения Проектной документации и/или Рабочей документации и/или Технического задания, дизайн-проектов, Вендор-листа влекут исключение, либо уменьшение объема, состава и/или содержания работ, выполняемых Генподрядчиком по Договору и/или наименования материала, Стоимость работ подлежит уменьшению с последующим изменением Ведомости договорной цены на сумму исключаемых объемов работ и заменяемых материалов с оформлением соответствующего дополнительного соглашения к Договору. \nОб указанном в настоящем пункте решении, Застройщик обязан заблаговременно (до начала выполнения работ, объем которых подлежит исключению/уменьшению/корректировке, либо до размещения Генподрядчиком заказа или закупки соответствующих материалов, изделий или оборудования, либо до выплаты Застройщиком соответствующего аванса на приобретение материалов, оборудования и/или изделий) письменно уведомить Генподрядчика. При этом в случае получения указанного в настоящем пункте уведомления Генподрядчик обязан приостановить подготовку к производству работ, объем которых подлежит исключению/уменьшению/корректировке, и руководствоваться указаниями Застройщика, содержащимися в данном уведомлении. В случае если Генподрядчик проигнорировал указание Застройщика, оговоренное в настоящем пункте Договора, Застройщик вправе не оплачивать Генподрядчику соответствующие выполненные работы, либо уменьшить их оплату по своему усмотрению, уведомив об этом письменно Генподрядчика.\nВ случае если вносимые Застройщиком изменения Проектной документации и/или Рабочей документации и/или Технического задания, дизайн-проектов, Вендор-листа влекут за собой увеличение объема, стоимости и/или содержания работ, выполняемых Генподрядчиком по Договору, Стоимость работ, подлежит увеличению с последующим изменением Ведомости договорной цены с оформлением соответствующего дополнительного соглашения к Договору. \nСтороны обязаны оформить Дополнительное соглашение к Договору в течении 15 (пятнадцати) календарных дней с момента направления Застройщиком уведомления об изменениях, указанных в настоящем пункте Договора, в адрес Генподрядчика.\n5.11 Генподрядчик обязан по основным материалам и оборудованию, указанным в Вендор-листе, привлекать только производителей, письменно согласованных Сторонами в Перечне допустимых производителей (Вендор-листе) (Приложение №12 Договору – по тексту «Вендор-лист»). Финальный выбор фасадного материала, светопрозрачных конструкций (стекла, профиля и фурнитуры), дверей, конвекторов, лифтового оборудования, материалов для чистовой отделки остается за Застройщиком. \nПри этом, Стороны установили порядок выпуска и согласования Рабочей документации в части Работ, касающихся производителей, указанных в Вендор-листе: \n-  при разработке рабочей документации Застройщик обязан разрабатывать рабочую документацию на основе производителей, выделенных жирным шрифтом в Вендор-листе.\n- при отсутствии такого производителя (выделенного жирным шрифтом в Вендор-листе) Застройщик разрабатывает Рабочую документацию с учетом самостоятельного выбора производителя, указанного в Вендор-листе при этом указывает напротив каждой позиции материалов в спецификации «или аналог из Вендор-листа», а Генподрядчик при получении Рабочей документации имеет право инициировать замену производителя на аналогичного, если такая замена не ухудшает технические характеристики систем и/или конструкций, а Застройщик обязан согласовать такие изменения. При этом все расходы на изменения Рабочей документации берет на себя Генподрядчик. \nГенподрядчик имеет право выбрать любого поставщика выбранного Сторонами производителя, при этом возникшая экономия (выгода), связанная с выбором производителя и поставщика, остается за Генподрядчиком.\nФинальное решение по выбору производителя фасадного материала, светопрозрачных конструкций (стекла, профиля и фурнитуры), дверей, конвекторов, материалов для чистовой отделки, лифтов и материалов отделки лифтов принимает Застройщик. В случае, если стоимость фасадного материала, светопрозрачных конструкций (стекла, профиля и фурнитуры), дверей, конвекторов, материалов для чистовой отделки, лифтов и материалов отделки лифтов у производителя, выбранного Застройщиком из Вендор-листа выше, чем стоимость материалов у производителя, выбранного Генподрядчиком из Вендор-листа, Застройщик компенсирует Генподрядчику разницу.\nВ отношении выбора материалов для фасадно-отделочных и/или светопрозрачных (оконные и дверные блоки, витражи), отделочных материалов, Генподрядчик должен руководствоваться Техническим заданием (Приложения: №13 «Техническое задание на выполнение комплекса работ по изготовлению оконных и дверных блоков из алюминиевого профиля», №14 «Техническое задание на выполнение комплекса работ по устройству демонстрационного фрагмента фасада (МОКАП), №15 Техническое задание на выполнение комплекса работ по устройству демонстрационного фрагмента отделки типового этажа (МОКАП), №16 Техническое задание на выполнение комплекса работ по устройству демонстрационного фрагмента отделки лобби (МОКАП)», Приложение № 17 Техническое задание на выполнение комплекса работ по устройству демонстрационного фрагмента отделки 15 этажа (МОКАП), Приложение № 18 Техническое задание на выполнение комплекса работ по устройству демонстрационного фрагмента отделки подземного паркинга (МОКАП) к Договору) и обязательно предварительно перед выбором поставщика предоставить Застройщику по три варианта образца фасадного материала (каждого из 6 элементов фасада в трех цветовых решениях, предусмотренных проектом, включая элементы фасадного материала и элементы из алюминиевых композитных панелей) и светопрозрачных (оконные и дверные блоки, витражи) материалов в колористических решениях, согласованных Застройщиком. При этом Генподрядчик обязуется согласовать с Застройщиком итоговые образцы материалов для выполнения работ для фасадно-отделочных и/или светопрозрачных конструкций. \n5.12. Застройщик имеет право по своей инициативе в одностороннем порядке принять решение о замене материалов, изделий или оборудования, на аналогичные, имеющие соответствующие технические характеристики и потребительские качества, либо о приобретении их у определенного производителя (поставщика) с последующим соответствующим изменением стоимости строительства на разницу в стоимости материалов и/или оборудования и оформлением дополнительного соглашения к Договору. \nОб указанном в настоящем пункте решении Застройщик обязан заблаговременно (до размещения Генподрядчиком заказа или закупки соответствующих материалов, изделий или оборудования) письменно уведомить Генподрядчика. При этом в случае получения указанного в настоящем пункте уведомления Генподрядчик обязан при выборе материалов, оборудования и/или изделий, необходимых для строительства Объекта, а также поставщика, руководствоваться указаниями Застройщика, содержащимися в данном уведомлении. В случае, если Генподрядчик проигнорировал указание Застройщика, оговоренное в настоящем пункте Договора, Застройщик вправе не оплачивать Генподрядчику соответствующие выполненные работы (с целью компенсации из этих сумм стоимости строительно-монтажных работ по замене материалов и стоимости материалов, указанных Застройщиком), либо уменьшить их оплату по своему усмотрению, уведомив об этом письменно Застройщика. \n5.13. В соответствии со ст.709 ГК РФ во избежание разногласий о базовой стоимости материалов и оборудования на дату заключения Договора Сторонами определена базовая стоимость строительных материалов (Приложение № 6 Перечень материалов и оборудования, далее «Перечень материалов и оборудования» или «Ведомость БСМ»). Ведомость БСМ содержит только стоимость материалов/оборудования и не содержит стоимость работ по переработке, изготовлению, транспортные расходы. \nВ случае увеличения стоимости основных материалов и/или оборудования, указанных в Перечне материалов и оборудовании, необходимых Генподрядчику для выполнения работ по Договору, более чем на 5% (пять процентов), Генподрядчик вправе требовать увеличения Стоимости работ по Договору на сумму удорожания материалов или оборудования, но только на разницу сверх 5% (пять процентов) от стоимости соответствующих материалов или оборудования.\nВ случае уменьшения стоимости основных материалов и/или оборудования, указанных в Ведомости БСМ, необходимых Генподрядчику для выполнения работ по Договору, более чем на 5% (пять процентов), Застройщик вправе требовать уменьшения стоимости Договора на сумму удешевления материалов или оборудования, но только на разницу сверх 5% (пять процентов) от стоимости соответствующих материалов и оборудования.\nКомпенсация стоимости материалов производится на основании объемов, указанных в Рабочей документации, с учетом коэффициента расхода материалов (не учитываются объемы, выполненные к моменту пересмотра стоимости).\nВ случае, если стоимость материалов и/или оборудования отличается от цен, определенных в Перечне материалов и оборудования, более, чем на 5% (пять процентов) Генподрядчик обязан до закупки и оплаты авансового платежа направить в адрес Застройщика официальный запрос на согласование стоимости такого материала/оборудования, а Застройщик в срок не более 5 (пяти) рабочих дней обязан согласовать стоимость материала/оборудования или заявить мотивированный отказ. В случае, если Генподрядчиком официальный запрос до размещения заказа и/или оплаты аванса направлен Застройщику не будет, Генподрядчик утрачивает право на компенсацию стоимости удорожания таких материалов или оборудования в соответствии с условиями пункта Договора, в объеме, который не согласовал Застройщик. \nПод рыночной ценой в рамках толкования настоящего пункта понимается цена материалов и/или оборудования, определенная Сторонами в результате проведенного им анализа ценовых предложений производителей и/или поставщиков материалов и оборудования, представленных на строительном рынке региона места выполнения работ.\nОпределение рыночной цены материалов или оборудования, являющейся основанием для расчета компенсационных выплат, предусмотренных настоящим пунктом, а также их расчет производится Застройщиком в следующих случаях:\nа) Получения Застройщиком от Генподрядчика запроса на определение текущей рыночной цены материалов или оборудования и расчета компенсационной выплаты. \nб) По инициативе Застройщика, независимо от получения от Генподрядчика соответствующего запроса.\nИзменение рыночной цены материалов или оборудования, указанных в Ведомости БСМ, подтверждается путем предоставления Генподрядчиком Застройщику обоснованного расчета рыночной цены материалов или оборудования, являющегося основанием для компенсационных выплат, предусмотренных настоящим пунктом. \nПри увеличении рыночной цены материалов или оборудования, указанных в Ведомости БСМ, более чем на 5% (пять процентов) по сравнению с ценой материалов или оборудования, зафиксированной в Ведомости БСМ, Застройщик обязуется возместить (компенсировать) Генподрядчику разницу в цене материалов и оборудования, превышающую указанные 5% (пять процентов). Размер возмещения (компенсации) рассчитывается по формуле: \nК = (Цр - (Цд х 1,05)) х V, где:\nК – размер возмещения (компенсации);\nЦр – согласованная Сторонами рыночная цена материалов или оборудования;\nЦд – цена материалов или оборудования, зафиксированная в Ведомости БСМ;\nV – объём материалов/оборудования с учетом подтвержденного коэффициента расхода материала/оборудования, по которому производится компенсация.\nПри уменьшении рыночной цены материалов или оборудования, указанных в Ведомости БСМ, более чем на 5% (пять процентов) по сравнению с ценой материалов или оборудованием, зафиксированной в Ведомости БСМ, Генподрядчик обязуется возместить (компенсировать) Застройщику разницу в цене материалов или оборудовании, превышающую указанные на 5% (пять процентов). Размер возмещения (компенсации) рассчитывается по формуле: \nК = ((Цд х 0,95) – Цр) x V, где:\nК – размер возмещения (компенсации);\nЦд – цена материалов или оборудования, зафиксированная в Ведомости БСМ;\nЦр – Согласованная Сторонами рыночная цена материалов или оборудования;\nV – объем материалов/оборудования с учетом подтвержденного коэффициент расхода материала/оборудования, по которому производится компенсация.\nПри этом Стороны согласовали следующий порядок согласований и оплаты компенсаций материалов и/или оборудования: \nПо итогам проведенных расчетов компенсаций, Стороны проводят один раз в квартал рабочее совещание и принимают решение о целесообразности оформления Дополнительного соглашения о пересмотре общей Цены работ, и, в случае принятия решения об оформлении такого Дополнительного соглашения, оформляют такое соглашение в течение 15 (пятнадцати) рабочих дней с момента проведения такого совещания. До оформления Дополнительного соглашения о пересмотре Цены работ оплата по Договору осуществляется в ранее установленном в Договоре размере.\nПоложения настоящего пункта Договора не отменяют условие о приблизительных количественных показателях, приведенных в Ведомости договорной цены, согласно п. 5.3. Договора, а объем работ по Договору, включая количество подлежащих применению материалов, изделий или оборудования, будет уточняться Техническим заданием, Рабочей документацией, о чем Стороны оформляют Дополнительное соглашение.\n5.14. Генподрядчик подтверждает, что получил всю необходимую информацию о потенциальных рисках, осложнениях и прочих обстоятельствах, которые могут помешать либо негативно воздействовать на производство работ или их стоимость, а цена работ является справедливой и обоснованной компенсацией за все работы, предусмотренные Договором. Генподрядчик принимает на себя и на свой счет все расходы, риски и трудности, возникающие при выполнении Работ, связанные в том числе с удорожанием Работ (в т.ч. материалов, если иное не предусмотрено условиями Договора).\n5.15. Генподрядчик подтверждает, что согласовывая Цену работ, он имел все данные обо всех необходимых ему для определения цены и объема работ по строительству Объекта материалах, оборудовании, документах и прочую информацию, в связи с чем не может в дальнейшем ссылаться на несправедливость и необоснованность цены работ, а также на неверный расчет площадей и строительных объемов Объекта согласно переданной до подписания Договора Проектной документации. Генподрядчик признает правильность и достаточность Цены работ, содержащейся в Договоре, для покрытия всех расходов, обязательств и ответственности в рамках настоящего Договора, а также в отношении всех прочих вопросов, необходимых для надлежащего производства Работ. Соответственно, Генподрядчик не претендует ни на какие дополнительные платежи, а также не освобождается ни от каких обязательств и/или ответственности, по причине его недостаточной информированности.\n5.16. При возникновении экономии (выгоды) ранее согласованной Стоимости работ, полученной в результате согласования и реализации Застройщиком предложений Генподрядчика по оптимизации проектных решений, не ухудшающих качество строительства и эксплуатационных качеств зданий, сооружений или инженерных систем, сетей, материалов, сумма экономии полностью распределяется Генподрядчику. \n5.17. Цена работ подлежит изменению в случае изменения ставки НДС, цена принятых Работ рассчитывается по ставке НДС, действовавшей на дату приемки Работ, а цена не принятых Работ подлежит расчету согласно измененной ставке НДС в следующем порядке: за основу расчета берется цена не принятых Работ без НДС, далее цена увеличивается на новую ставку НДС, и полученная сумма будет являться новой ценой непринятых Работ с новой ставкой НДС.\n5.18. Во избежание сомнений, Стороны установили, что в Цену работ не включена стоимость следующих работ:\n5.18.1. Снос/демонтаж зданий и сооружений площадки строительства, утилизация и вывоз мусора после сноса. Демонтаж оставшейся на 02.04.2024 подземной части здания и вывоз мусора осуществляет Генподрядчик без изменения стоимости по Договору;\n5.18.2. Строительный надзор;\n5.18.3. Вырубка деревьев и кустарников;\n5.18.4. Корректировка стадии «П», АГР, СТУ, ТУ, прохождение экспертизы документации на стадии «П»;\n5.18.5. Аудит всей рабочей документации;\n5.18.6. Устройство офиса продаж, включая, оплату коммунальных услуг, подключение к электрическим и механическим сетям, установка счетчиков;\n5.18.7. Разработка рабочей документации, в том числе и на наружные сети;\n5.18.8. Авторское сопровождение (фасадов, благоустройства, отделки МОП);\n5.18.9. Аренда, обслуживание и эксплуатация Дизель-генераторной установки (ДГУ);\n5.18.10. Фасадное освещение;\n5.18.11. Наружные сети и сооружения;\n5.18.12. Строительное водопонижение;\n5.18.13. Подсветка кранов, лайтбоксы;\n5.18.14. Устройство МОКапа по благоустройству; \n5.18.15. Разводка вентиляции внутри квартир;\n5.18.16. Мониторинг состояния существующих зданий, инженерных сетей и сооружений, шпунтового ограждения;\n5.18.17. Система обслуживания фасадов;\n5.18.18. Оборудование трансформаторной подстанции ТП 10/0,4 кВ (сама строительная часть ТП и ее отделка включена в стоимость по договору);\n5.18.19. Система автополива территории;\n5.18.20. Чистовая и черновая отделка квартир;\n5.18.21. Меблировка балконов и террас;\n5.18.22. Ограждение строительной площадки и устройство ворот.\n\n6.\tФИНАНСИРОВАНИЕ СТРОИТЕЛЬСТВА. АВАНСИРОВАНИЕ.\n6.1. Финансирование строительства осуществляет Застройщик, в том числе с использованием кредитных средств Банка.\n6.2. Финансирование строительства производится путем оплаты работ, выполненных Генподрядчиком с надлежащим качеством и принятых Застройщиком, и выплаты авансов Генподрядчику и напрямую поставщикам (продавцам), в размере и порядке, предусмотренными Договором.\n6.3. Стороны согласовали, что Застройщик выплачивает Генподрядчику аванс в общем размере 20% (двадцать процентов) от Цены работ, по следующему графику:\n- 5 % (пять процентов) в течение 30 (тридцати) календарных дней с даты заключения Договора; \n- 5% (пять процентов) в течение 4 (четырех) месяцев с даты заключения Договора;  \n- 5% (пять процентов) в течение 8 (восьми) месяцев с даты заключения Договора;  \n- 5% (пять процентов) в течение 12 (двенадцати) месяцев с даты заключения Договора.\n6.4. Оплата авансов, указанных в п.6.3, может также производиться Застройщиком напрямую поставщикам (продавцам) с указанием в платежных документах «за (ООО «СУ-10»)» на основании представленных Генподрядчиком Застройщику заявок с копиями счетов и договоров на поставку. Застройщик обязуется в течение 3 (трех) рабочих дней после совершения авансового платежа направлять Генподрядчику копии платежных поручений с отметкой банка в подтверждение оплаты аванса, на основании чего указанные платежи учитываются Сторонами как авансы, выплаченные Застройщиком Генподрядчику по Договору с даты исполнения платежного поручения банком Застройщика.\n6.5. Авансы, оплачиваемые Застройщиком напрямую поставщикам (продавцам), выплачиваются в течение 10 (Десяти) рабочих дней с даты согласования заявки со стороны Застройщика. \n6.6. В случае выплаты авансов, зачет авансового платежа производится путем пропорционального удержания суммы аванса из суммы выполненных Работ, определенной в Актах по форме КС-2 и Справках по форме КС-3 за отчетный период, с указанием в Справке по форме КС-3 отдельной строкой суммы засчитываемого аванса.\n6.7. Генподрядчик обязан в течение 3 (трех) рабочих дней после оплаты ему аванса предоставить Застройщику счет-фактуру на полученный аванс, оформленный в соответствии с законодательством РФ.\n6.8. Во избежание сомнений, Стороны установили, что совокупная сумма выплаченных Генподрядчику и поставщикам (продавцам) и неотработанных авансов по Договору не может превышать 20% (двадцать процентов) от Цены работ по Договору. Настоящее условие об ограничении размера авансов по Договору имеет приоритет над другими положениями Договора об авансах и условиями финансирования. В случае если Генподрядчиком будет допущено превышение полученных, но не отработанных авансов свыше 20% (двадцать процентов) от Цены работ по Договору, Застройщик вправе приостановить выплату авансов по Договору, что не будет являться для Генподрядчика нарушением платежных обязательств по Договору. \n6.9. Все платежи по Договору осуществляются путем банковского перевода денежных средств на расчетный банковский счет Генподрядчика, кроме авансовых платежей, которые осуществляются переводом на обособленный банковский счет (далее «счет ОБС») Генподрядчика, со счета ОБС Застройщика, либо иным способом, разрешенным действующим законодательством РФ и договором, заключенным Застройщиком с Банком. \nДля выплаты авансов Генподрядчик обязуется совершить все фактические и юридические действия с целью открытия ОБС по форме Банка и предоставить реквизиты ОБС Застройщику не позднее чем через 5 (пять) дней с даты заключения Договора. Генподрядчик обязуется обеспечить наличие такого расчетного счета ОБС на все время действия Договора, до полного расчета между Сторонами по Договору.\nНеисполнение обязательства по открытию ОБС и предоставлению его реквизитов Застройщику исключает ответственность Застройщика за Просрочку оплаты.\n6.10. Все взаиморасчеты по Договору производятся в рублях. Фактической датой совершения платежа по Договору считается дата поступления денежных средств на корреспондентский счет банка получателя.\n\n7.\tПОРЯДОК ОПЛАТЫ ВЫПОЛНЕННЫХ РАБОТ\n7.1. Стороны определили, что отчетным периодом по Договору считается календарный месяц.\n7.2. Не позже 25-го числа отчетного месяца Генподрядчик представляет Застройщику в 3 (трех) экземплярах следующие документы, подписанные Генподрядчиком:\n- Акт по форме КС-2 за отчетный период (по форме Приложения № 4 к Договору);\n- Справка по форме КС-3 за отчетный период (по форме Приложения №4 к Договору);\n- счет и счет-фактуру, оформленные в соответствии с требованиями законодательства РФ;\n- чек-листы проверки качества фактически выполненных работ в отчетном месяце;\n- комплект исполнительной документации, оформленный на фактически выполненные работы в предыдущем отчетном периоде, включая  \n- заверенные копии или оригиналы сертификатов и паспортов изготовителей или поставщиков на примененные материалы, оборудование, изделия и конструкции, лабораторные заключения о соответствии данных материалов, конструкций, изделий проектным характеристикам, выписки из общих и специальных журналов работ, журнала учета выполненных работ (по форме КС-6а), заполненных за отчетный период в соответствии с требованиями действующих нормативных актов Российской Федерации и г. Москвы. \nЗастройщик обязан в течение 5 (пяти) рабочих дней, не считая дня получения, проверить полученные Акт по форме КС-2 и Справку по форме КС-3, подписать их со своей стороны, и вернуть один экземпляр Генподрядчику, либо направить Генподрядчику мотивированный отказ от подписания документов с изложением причин (замечания к Актам по форме КС-2 и Справкам по форме КС-3).\n7.3. Оплата Генподрядчику за выполненные в отчетном месяце работы по Договору осуществляется Застройщиком ежемесячно, на основании Акта по форме КС-2 и Справки по форме КС-3 в следующем порядке:\n7.3.1. Сумма в размере 97 (Девяносто семь) % от стоимости работ, уменьшенная на сумму причитающихся к удержанию в соответствии с п. 6.6 ранее выплаченных Генподрядчику и поставщикам (продавцам) авансов, выплачивается Генподрядчику в течение 22 (Двадцати двух) рабочих дней с даты подписания Застройщиком Актов по форме КС-2, Справок по форме КС-3 и предоставления Генподрядчиком счета-фактуры, оформленного в соответствии с требованиями действующего законодательства РФ, на сумму стоимости выполненных работ в подписанной Сторонами Справке по форме КС-3. \n7.3.2. Оставшиеся 3% (три процента) от стоимости выполненных Генподрядчиком в отчетном месяце работ (далее – Гарантийное удержание) резервируются Застройщиком и выплачиваются Генподрядчику по истечении 12 (двенадцати) месяцев с даты получения Разрешения на ввод объекта в эксплуатацию, при отсутствии каких-либо претензий у Застройщика к Генподрядчику.\n7.4. Зарезервированная по условиям п. 7.3.2. Договора сумма Гарантийного удержания является мерой обеспечения выполнения Генподрядчиком обязательств по условиям Договора, не рассматривается Сторонами как заемные средства, и проценты за пользование зарезервированной суммой начислению и выплате не подлежат. В случае изменения стоимости Работ по Договору сумма Гарантийного удержания в каждом отчетном периоде изменяется так, чтобы финальная удержанная сумма составляла не менее 3% (трех процентов) от Стоимости работ по Договору. Сумма Гарантийного удержания указывается отдельной строкой в Справке по форме КС-3.\nУдержанные Застройщиком в качестве Гарантийного удержания суммы могут использоваться Застройщиком только для компенсации расходов, связанных с неисполнением и/или ненадлежащим исполнением Генподрядчиком гарантийных обязательств Генподрядчика в период гарантийного срока.\n7.5. В случае, если Генподрядчиком не будет предоставлена вся относящаяся к работам необходимая документация, которая должна быть предоставлена Генподрядчиком в соответствии с пунктом 7.2 Договора, Застройщик оставляет за собой право по своему усмотрению потребовать исключение из Актов по форме КС-2 фактически выполненных работ на сумму стоимости работ, в отношении которых не предоставлена документация, до момента предоставления соответствующих документов. Реализация Застройщиком права, предусмотренного настоящим абзацем, не является основанием для начисления процентов за пользование денежными средствами, каких-либо штрафных санкций, взысканий или иных сборов, также не подлежат применению нормы о коммерческом кредите. \n7.6. Уполномоченный представитель Генподрядчика не позднее 05 (Пятого) числа месяца, следующего за отчетным, совместно с уполномоченным представителем Застройщика осуществляет снятие показаний приборов учета, подтверждающих фактический расход Генподрядчиком тепловой энергии на отопление и теплоснабжение, электроэнергии и воды за истекший месяц, и оформляют двухсторонний акт с указанием количества израсходованной электроэнергии, воды и сброса в сети канализации. При отказе представителей Генподрядчика подписывать указанный в настоящем пункте акт, выразившимся в действии, либо бездействии Генподрядчика, либо его представителей, данный акт составляется и подписывается в одностороннем порядке представителем Застройщика, после чего данный акт считается достаточным основанием для возникновения у Генподрядчика обязательства по оплате в установленном настоящем пункте порядке стоимости фактически израсходованной при выполнении работ по Договору воды и сброса в сети канализации за истекший период.\nНа основании указанного акта Застройщик выставляет Генподрядчику, подготовленный на основании акта счет (с указанием стоимости израсходованной тепловой энергии на отопление и теплоснабжение, электроэнергии, воды и сброса в сети канализации по действующим тарифам) и счет-фактуру. В течение 4 (четырех) рабочих дней с момента получения от Застройщика, указанного в настоящем пункте счета Генподрядчик обязан произвести его оплату, в противном случае Застройщик вправе удержать оплату за потребленные в отчетном месяце ресурсы из суммы причитающихся Генподрядчику денежных средств (оплаты работ и/или авансов) за текущий и/или отчетный месяц при условии предварительного уведомления Генподрядчика.\n7.7. Если в Актах по форме КС-2 или Справках по форме КС-3 были допущены ошибки, и эти ошибки были обнаружены после подписания указанных документов, то любая из Сторон вправе потребовать пересмотра этих документов до оформления Итогового акта (Акта №3).\n7.8. Генподрядчик подготавливает все счета в соответствии с требованиями Застройщика и действующего законодательства РФ. \n7.9. Выплата Застройщиком каких-либо платежей Генподрядчику или оплата Застройщиком Генподрядчику какой-либо части работ в соответствии с Договором:\n- не является свидетельством приемки Застройщиком работ, этапа работ или какой-либо их части в смысле статьи 753 Гражданского Кодекса; и \n- не влечет перехода к Застройщику риска случайной гибели или повреждения результата работ. \n\n8. ПРАВА И ОБЯЗАННОСТИ СТОРОН\n8.1. Генподрядчик имеет право:\n8.1.1. Самостоятельно организовывать производство работ в соответствии со сроками, установленными Договором.\n8.1.2. Вносить на рассмотрение Застройщика любые вопросы, замечания и предложения, относящиеся к предмету Договора и требовать принятия по ним решения в разумные сроки, но не менее десяти рабочих дней.\nВносить предложения по оптимизации проектных решений, не ухудшающие эксплуатационных качеств зданий, сооружений или инженерных систем и сетей; согласовывать эти предложения с Застройщиком и далее ― при условии письменного согласования Застройщиком ― с проектной организацией и другими организациями в установленном порядке; реализовывать согласованные предложения при строительстве Объекта.\nВ случае, если предложения Генподрядчика по оптимизации проектных решений ведут к сокращению сроков и/или экономии Генподрядчика без потери качественных характеристик Объекта, работы по корректировке Проектной документации (в случае необходимости) и получение положительного заключения экспертизы осуществляются за счет Генподрядчика.\nВ остальных случаях корректировка проектной документации осуществляется за счет Застройщика.\nРасходы Застройщика, связанные с корректировкой Проектной документации согласно предложениям Генподрядчика по оптимизации проектных решений, включая расходы на получение положительного заключения экспертизы Проектной документации, по согласованию Сторон учитываются при определении возникающей выгоды (п.5.16 Договора).\nПоложения настоящего пункта Договора не отменяют условие о приблизительных количественных показателях, приведенных в Ведомости договорной цены, согласно п. 5.8. Договора, а объем Работ по Договору, включая количество подлежащих применению материалов, изделий или оборудования, определяется Договором, Техническим заданием и Проектной документацией.\n8.1.3. Генподрядчик имеет также иные права, указанные в тексте Договора, а также вытекающие из действующего законодательства Российской Федерации и относящиеся к предмету Договора.\n8.2. Генподрядчик обязан:\n8.2.1. Выполнить и сдать работы по Объекту в объеме и в сроки, предусмотренные Договором и в соответствии с условиями Договора. \nДо начала работ разработать и согласовать с Застройщиком и Техническим Заказчиком проект производства работ, в соответствии с требованиями положений, действующих в Российской Федерации и городе Москве нормативных документов и правил.\n8.2.2. Передать Застройщику до начала работ:\n8.2.2.1. За 1 (один) календарный день до начала производства работ: \n- список ИТР Генподрядчика, участвующих в производстве работ, с указанием видов выполняемых ими работ, приказов на инженерно-технических работников, ответственных за выполнение этих работ; \nСписок своих сотрудников и сотрудников своих подрядчиков, с указанием фамилии и имени для обеспечения Застройщиком допуска указанного персонала на территорию Объекта. При этом доступ автомобилей на территорию Строительной площадки осуществляется без предъявления списков.\n8.2.2.23. Приказ о назначении представителей Генподрядчика, ответственных за выполнение работ по Договору и доверенность на них с указанием их полномочий;\n8.2.2.3. Приказы о назначении представителей Генподрядчика, ответственных за использование электроэнергии, воды, и доверенность на них с полномочиями оформлять акты о количестве израсходованных Генподрядчиком ресурсов;\n8.2.2.4. Приказ о назначении представителей Генподрядчика, ответственных за технику безопасности при производстве строительных работ и пожарную безопасность на Объекте;\n8.2.2.5. Приказ о назначении представителей Генподрядчика, ответственных за электрохозяйство;\n8.2.2.6. Приказ о назначении представителей Генподрядчика, ответственных за работы с грузоподъёмными механизмами, с предоставлением соответствующих допусков и удостоверений ответственных по данному приказу лиц.\n8.2.2.7. Приказ о назначении представителей Генподрядчика, и доверенность на них с полномочиями принимать под роспись корреспонденцию от Застройщика в период действия Договора.\n8.2.3. Назначить в течение 5 (пяти) рабочих дней со дня подписания Договора Руководителя проекта, который будет представлять Генподрядчика и действовать от его имени в ходе исполнения Договора. Сведения, известные такому представителю Генподрядчика, считаются известными и Генподрядчику. Любые извещения, инструкции, информация и другие сообщения, передаваемые Застройщиком Генподрядчику в соответствии с Договором, могут передаваться уполномоченному представителю Генподрядчика, за исключением особо оговоренных случаев. Застройщик вправе до завершения исполнения Договора потребовать от Генподрядчика замены уполномоченного представителя, если своими действиями или бездействиями такой представитель позволит усомниться в своей компетентности и профессиональной пригодности, добросовестности исполнения обязательств.\n8.2.4. Назначить в течение 5 (пяти) рабочих дней с момента подписания Договора Руководителя строительства, который должен иметь соответствующее образование и квалификацию, подтверждённые соответствующими документами, включая, но, не ограничиваясь: дипломы, удостоверения о повышения квалификации, сертификаты, допуски к соответствующим видам работ и иные документы, требуемые в соответствии с действующим законодательством Российской Федерации. \nРуководитель строительства обязан лично контролировать ход всех работ на Строительной площадке и присутствовать на Строительной площадке в течение всего рабочего времени, за исключением дней нахождения в отпуске или отсутствия по болезни. Генподрядчик обязан обеспечить на время отсутствия Руководителя строительства его замену лицом, удовлетворяющим требованиям, предъявляемым к Руководителю строительства. Об отсутствии Руководителя строительства в связи с отпуском, по болезни или иным причинам и о его замещении Генподрядчик незамедлительно уведомляет Застройщика с представлением копий соответствующих приказов о замещении или новом назначении и копий документов, подтверждающих квалификацию лица, замещающего Руководителя строительства.\n8.2.5. Установить при необходимости временное ограждение Строительной площадки, сигнальное освещение, въездные ворота, калитки, галереи, навесы/козырьки и прочие элементы для ограждения, соответствующие по конструктивным и стилистическим решениям существующему ограждению. \nУстановить перед входом/въездом на Строительную площадку информационный щит, содержащий информацию, необходимую в соответствии с законодательством РФ и г. Москвы. При этом Генподрядчик обязуется не помещать и не разрешать размещение рекламных объявлений любого характера на всех ограждениях и заборах на Строительной площадке, объекте и вокруг них независимо от того, были такие ограждения и/или заборы возведены Генподрядчиком или нет.\n8.2.6. Выполнить строительство Объекта в сроки, в объемах и на условиях, определенных Договором, сдать выполненные работы Застройщику, а также уполномоченным представителям Технического Заказчика, эксплуатирующих и муниципальных организаций с оформлением установленной документации.\n8.2.7. Организовать надлежащим образом производство работ, как своими силами и средствами, так и силами, средствами привлекаемых субподрядчиков и поставщиков не снимая с себя ответственности в полном объеме за исполнение условий Договора, в соответствии с условиями Договора, проектной и сметной документацией, строительными нормами, правилами, стандартами, правилами техники безопасности, охраны труда, антитеррористическими мероприятиями, требованиями миграционного контроля, правилами пожарной безопасности, правилами по охране зеленых насаждений, иными нормативно-правовыми документами, действующими на территории РФ, города Москвы.\n Своими силами и средствами обеспечить получение всех необходимых профессиональных допусков, разрешений и допусков на право производства работ, требуемых в соответствии с законодательством Российской Федерации и города Москвы, в том числе разрешения и согласования, связанные с использованием иностранной рабочей силы. \n8.2.8. Обеспечить наличие на Строительной площадке и ведение документации, предусмотренной действующими законодательными, распорядительными и нормативными документами Российской Федерации и г. Москвы.\n8.2.9. По мере выполнения работ формировать папку Исполнительной документации, необходимой в том числе для получения ЗОС. \nИсполнительная документация в объеме выполненных работ по Договору передается Генподрядчиком Застройщику в оригинальном экземпляре, сброшюрованная в папки, с реестром и сопроводительным письмом в 3 (трех) экземплярах и 1 (один) экземпляр в электронном виде (в формате AutoCAD, Excel, Word, Project и др.) через Информационную систему управления проектами. \n1 (один) оригинальный экземпляр и 1 (один) экземпляр в электронном виде передаётся в течение одного месяца, следующим за отчетным периодом, с Актом по форме КС-2, остальные экземпляры Исполнительной документации передаются в течение 30 (тридцати) календарных дней после окончания работ в отчетном месяце.\nПри этом Стороны признают, соглашаются и декларируют, что не предоставление Генподрядчиком Исполнительной документации и (или) ее части в том числе в форматах, предусмотренных настоящим пунктом Договора, является ненадлежащим исполнением Генподрядчиком обязательств по предъявлению результатов выполненных работ к приемке в соответствии с условиями Договора. \nОтсутствие надлежаще оформленной исполнительной документации является основанием для отказа Застройщика от подписания Актов по форме КС-2 и Справок по форме КС-3, до устранения нарушения и передачи Генподрядчиком Застройщику полного комплекта надлежаще оформленной исполнительной документации.\nСтороны особо согласовали, что заключения лабораторных испытаний набора прочности бетона (по истечении 28 (двадцати восьми) суток) предоставляются не позднее 30 (тридцати) календарных дней после окончания работ в отчетном месяце, указанная отсрочка не относится к заключениям лабораторных испытаний набора прочности бетона по истечении 7 (семи) суток (при условии приложения формы чек-листа в соответствии с Приложением №20).\n8.2.10. Обеспечить предусмотренные действующими нормативными документами и техническими условиями освидетельствования выполненных работ, испытания, комплексное опробование смонтированного оборудования с оформлением полного комплекта необходимых документов. Разработать и согласовать (совместно с Генпроектировщиком) программу комплексных испытаний инженерных систем Объекта.\n8.2.11. Использовать материалы, предусмотренные действующей нормативной документацией.\n8.2.12. Обеспечить при строительстве Объекта выполнение мероприятий, предусматривающих сохранность, неизменность и целостность конструкций строящихся и существующих зданий, сооружений и инженерных коммуникаций, в том числе в осенне-зимний период и период весеннего оттаивания, организовать контроль (мониторинг) за их состоянием и в случае наличия изменений немедленно прекратить работы и сообщить об этом Застройщику, в дальнейшем действовать по его указаниям. \nВ случае повреждения конструкций строящихся и существующих зданий, сооружений и инженерных коммуникаций, находящиеся на территории Строительной площадки Генподрядчик обязуется восстановить их за свой счет в разумный срок, согласованный с Застройщиком. \nВ случае если Генподрядчик в установленный срок не приступил и/или приступил, но не исполняет указанную обязанность в согласованный с Застройщиком срок, Застройщик вправе самостоятельно восстановить поврежденные Генподрядчиком объекты или привлечь для этого третьих лиц с отнесением согласованных с Генподрядчиком расходов на счет Генподрядчика в порядке, предусмотренном разделом 14 Договора. Генподрядчик обязан выплатить Застройщику денежные суммы в размере понесенных Застройщиком затрат на восстановление указанных повреждений. Указанные денежные суммы подлежат возмещению Генподрядчиком в течение 10 (десяти) рабочих дней со дня получения соответствующего письменного требования Застройщика.\n8.2.13. Устранить в согласованный с Застройщиком разумный срок за свой счет все недостатки и/или дефекты Объекта, выявленные в процессе строительства и сдачи-приемки Объекта, а также в период гарантийной эксплуатации Объекта, вызванные отступлениями Генподрядчика или привлеченных им субподрядчиков от требований, предусмотренных в Проектной документации и в обязательных для Сторон нормативных документах.\n8.2.14. Выполнить работы по устройству на территории Строительной площадки временных зданий, сооружений, сетей и коммуникаций, необходимых для выполнения работ по Договору. При наличии соответствующих требований в действующих нормативных и правовых документах к размещаемым Генподрядчиком для осуществления работ в соответствии с Договором на территории Строительной площадки временных зданий, временных строений, временных сооружений, временных сетей и временных коммуникаций - разработать и согласовать в установленном порядке проектную документацию, необходимую для их сооружения и эксплуатации. \n8.2.15. Поставить на Строительную площадку необходимые для выполнения строительных работ материалы, изделия, конструкции и оборудование, самостоятельно осуществить их приемку, доставку к месту производства работ, разгрузку и складирование.\nГенподрядчик гарантирует, что качество строительных материалов, оборудования и комплектующих изделий, конструкций и систем, применяемых Генподрядчиком для выполнения работ по Договору, будет соответствовать требованиям Договора и действующего законодательства РФ, иметь соответствующие сертификаты, технические паспорта, иные документы, предусмотренные действующим законодательством РФ.\nГенподрядчик несет ответственность за предоставление строительных материалов, оборудования и комплектующих изделий, конструкций и систем, обремененных правами третьих лиц.\nГенподрядчик не вправе использовать при производстве работ материалы, конструкции, комплектующие изделия и оборудование, не указанные в Договоре, Проектной документации, Рабочей документации не утвержденные Застройщиком (в случае их изменения), а также не соответствующие действующим нормативным требованиям, законодательству РФ и г. Москвы. В случае нарушения этого положения Генподрядчик обязан своими силами и за свой счет заменить не утвержденные Застройщиком материалы, конструкции, комплектующие изделия и оборудование, а также возместить Застройщику убытки, причиненные использованием Генподрядчиком не согласованных с Застройщиком материалов, конструкций, комплектующих изделий и оборудования. \n8.2.16. Обеспечить строительство необходимыми механизмами, транспортом, строительным оборудованием, лесами, инструментами, оснасткой, подсобными приспособлениями и т.п.\n8.2.17. Обеспечить при необходимости согласование порядка ведения работ на Стройплощадке с надзорными органами (в том числе Мосгосстройнадзор и ОАТИ) и эксплуатирующими коммуникации и сооружения организациями (в том числе ГУП «Московский Метрополитен», АО «Мосводоканал», ПАО «МГТС», Московской кольцевой железной дорогой), соблюдение общего порядка на Строительной площадке, выполнение необходимых противопожарных мероприятий, мероприятий по технике безопасности и охране окружающей среды, регулярную уборку Объекта и Стройплощадки от мусора, включая 5-ти метровую зону вокруг Строительной площадки. В случае, если Генподрядчик понес какие-либо не предусмотренные Договором затраты для реализации обязанностей, предусмотренных настоящим пунктом, Застройщик не обязан их компенсировать Генподрядчику.\n8.2.18. Обеспечить персоналу на строительстве Объекта создание необходимых бытовых и санитарно-гигиенических условий, безопасных условий труда. Не размещать для проживания на территории строительства, в бытовых городках, временных зданиях и сооружениях, строящихся зданиях рабочую силу Генподрядчика (Субподрядчиков). Предусматривать в заключаемых с Субподрядчиками договорах условие о запрете проживания на территории Строительной площадки рабочей силы.\n8.2.19. Выполнить комплекс работ по организации штаба строительства Застройщика/Технического заказчика в соответствии с Приложением № 11 к Договору.\n8.2.20. Выполнять на Объекте и Строительной площадке необходимые мероприятия по технике безопасности, противопожарной безопасности, охране окружающей среды, промышленной безопасности, экологической и санитарной безопасности во время проведения работ по Договору. Генподрядчик обязан назначить ответственных представителей для осуществления контроля за соблюдением работниками Генподрядчика (субподрядчика) требований по технике безопасности, противопожарной безопасности, охране окружающей среды, промышленной безопасности, экологической и санитарной безопасности во время проведения работ по Договору.\n8.2.21. Генподрядчик обязан устранить выявленные Застройщиком, и/или Техническим заказчиком, и/или уполномоченными надзорными или контролирующими органами нарушения или отклонения в Работах по Договору от Проектной документации, положений (в том числе рекомендованных) действующих в Российской Федерации и городе Москве, нормативных документов и правил, включая, но не ограничиваясь, норм и правил в области противопожарной безопасности, охраны окружающей среды, охраны труда, промышленной безопасности, по технике безопасности, экологической и санитарной безопасности.\nГенподрядчик обязан:\n- обеспечить информирование Застройщика в течение 1 (одного) рабочего дня о проведении выездных проверок надзорными или контролирующими органами с момента получения уведомления о проведении проверки, получении акта проверки и предписания; \n- обеспечить ведение реестра предписаний и нарушений с указанием сроков их устранения; принять меры по недопущению Генподрядчиком нарушений договорных обязательств в части предоставления информации о проведении проверок;\n- в кратчайший срок подать ходатайство о продлении срока исполнения указанных выше предписаний;\n- еженедельно информировать Застройщика о проделанной работе по снятию нарушений информационным письмом.\n8.2.22. Разрабатывать и осуществлять мероприятия по снижению повреждения оборудования, пожаров и возгораний или нанесения ущерба окружающей среде в соответствии с требованиями положений, действующих в Российской Федерации и городе Москве нормативных документов и правил, Проектной документации.\nВ ходе выполнения работ проводить мероприятия, направленные на предупреждение несчастных случаев на производстве, профессиональных заболеваний, улучшения условий и охраны труда, санитарно-бытового обеспечения персонала.\nОбеспечить в ходе выполнения работ выполнение мероприятий по технике безопасности, охране окружающей среды, пожарной безопасности, по антитеррористической безопасности и пр.\n8.2.23. Заключить договор со специализированным охранным предприятием, в срок не позднее 15 (пятнадцати) календарных дней с момента подписания Договора и предоставить Застройщику копии уставных документов специализированного охранного предприятия.\nГенподрядчик обеспечивает исполнение специализированным охранным предприятием требований Положения об организации и обеспечении охраны и пропускного режима на Объекте (Приложение №7 к Договору).\nГенподрядчик самостоятельно несет ответственность за сохранность Строительной площадки, а также людей, оборудования и материалов и любого другого имущества, расположенного на Строительной площадке, с даты Акта приемки-передачи Строительной площадки до момента передачи Строительной площадки обратно Застройщику.\nПредоставлять Застройщику, Техническому заказчику отчет о любых происшествиях (авариях, травмах, несчастных случаях), возникших при выполнении работ по Договору, в течение 2 (двух) календарных дней с даты происшествия.\nПредоставлять Застройщику по запросу в течение 3 (Трех) календарных дней данные видео и/или аудио фиксации, записи с видеокамер наблюдения (при наличии) и любую другую информацию, полученную Генподрядчиком и/или привлеченным специализированным охранным предприятием в отношении Объекта. Вся собранная информация хранится у Генподрядчика не более 25 (Двадцати пяти) дней, после чего она перезаписывается.\n8.2.24. Укомплектовать строительство персоналом, имеющим надлежащую квалификацию и опыт работы, обеспечить нахождение на Строительной площадке персонала Генподрядчика и привлеченных субподрядчиков в спецодежде с логотипом, позволяющим определить их принадлежность к организации, осуществляющей выполнение работ. \n\tПо требованию Застройщика, Генподрядчик обязуется предоставить документальное подтверждение квалификации персонала Генподрядчика или привлеченных им подрядных организаций. \n8.2.25. Принять от Застройщика разрешительную и Проектную документацию, схемы расположения и каталоги координат и высот, геодезические знаки, устанавливаемых при геодезических разбивочных работах, и обеспечить их сохранность до окончания строительства Объекта.\n8.2.26. Обеспечить разработку в соответствии с Проектной документацией, переданной Застройщиком в производство работ, ППР, ПОС, чертежей «КМД», а также согласование их с Генпроектировщиком и Застройщиком, Техническим заказчиком. \nРазработка чертежей КМД должна выполняться проектной организацией, имеющей право выполнять данный вид работ. Разработанная документация должна соответствовать требованиям нормативных документов, а также Проектной документации объекта. Генподрядчик обязан передать Застройщику разработанную и согласованную Генпроектировщиком документацию марок «КМД» в 4-х экземплярах на бумажном носителе в 1-м экземпляре в электронной форме в формате PDF и в 1-м экземпляре в редактируемых форматах: в формате DWG и в редактируемой форме исходной программы с ссылочными файлами и библиотеками.\nПри этом исключительные права на разработанную документацию, стоимость которых определена Сторонами в размере 1 000,00 (Одна тысяча) рублей и включена в Цену Договора, переходят к Застройщику с момента передачи и дополнительной оплаты не требуют.\n8.2.27. В случае выявления необходимости проведения дополнительных работ, не учтенных в Проектной документации, Генподрядчик обязан в течение 5 (пяти) рабочих дней с даты выявления указанной необходимости уведомить об этом Застройщика для внесения соответствующих изменений и дополнений в Проектную документацию, а также согласования сроков и стоимости выполнения этих работ. Генподрядчик вправе не приступать к выполнению дополнительных работ без оформленного дополнительного соглашения к Договору. В случае, когда не выполнение Генподрядчиком дополнительных работ по причине отсутствия оформленного дополнительного соглашения к Договору, объективно может привести к задержке выполнения иных/последующих работ, то такая задержка не будет являться результатом действий/бездействий Генподрядчика. \nВ течение 1 (Одного) дня письменно известить Застройщика и до получения от него указаний в письменной форме приостановить работы при обнаружении:\n- непригодности или недоброкачественности предоставленной Застройщика проектной и сметной документации;\n- возможных неблагоприятных для Застройщика последствий выполнения его указаний о способе исполнения работ;\n- иных, не зависящих от Генподрядчика обстоятельств, угрожающих качеству результатов выполняемой работы, либо создающих невозможность ее завершения в срок.\n8.2.28. Соблюдать законодательство Российской Федерации, нормативные акты и другие документы, регламентирующие деятельность, относящуюся к предмету Договора.\n8.2.29. В случае привлечения Генподрядчиком либо привлеченным им субподрядчиком иностранной рабочей силы для выполнения работ, предусмотренных Договором, Генподрядчик обязуется самостоятельно и за свой счет оформить все требуемые в соответствии с действующим законодательством РФ разрешения. \nВ случаях использования иностранной рабочей силы Генподрядчик обязан неукоснительно соблюдать требования законодательства РФ о праве использования иностранной рабочей силы, осуществлять контроль над наличием у таких рабочих надлежаще оформленных документов в соответствии с законодательством РФ. При этом Застройщик не вправе вмешиваться во внутреннюю деятельность Генподрядчика, касающуюся его работников и работников, привлекаемых им субподрядчиков. Генподрядчик самостоятельно несет ответственность в полном объеме за нарушение им миграционного законодательства и правил регистрации иностранных граждан и лиц без гражданства, при исполнении Договора. Генподрядчик также несет полную ответственность за соблюдение привлеченными им субподрядными организациями требований законодательства РФ о праве использования иностранной рабочей силы.\n8.2.30. Обеспечить:\nа) беспрепятственный доступ к месту производства работ представителям Застройщика, Технического Заказчика, а также представителям организации, осуществляющей авторский надзор, органов государственного строительного надзора и ведомственных контролирующих органов для осуществления контроля и надзора за ходом выполнения работ, качеством используемых материалов и оборудования, представлять по их требованию отчеты о ходе выполнения работ (предусмотренные п. 8.2.34. Договора), исполнительную и проектную документацию;\nб) передачу Застройщику 4 (четырех) экземпляров Исполнительной документации одновременно с передачей Застройщику согласно п. 7.2. Договора ежемесячных Актов по форме КС-2 и Справок по форме КС-3 за истекший месяц. \nв) предоставление по запросу Застройщика необходимых и предусмотренных Договором документов о состоянии дел по выполнению работ по Договору;\nг) окончательную уборку Объекта перед сдачей (получением ЗОС), включая мытье окон и удаление пятен краски и грязи, и повторную уборку перед подписанием Итогового акта;\nд) постоянный контроль качества используемых материалов, конструкций и изделий, в том числе Генподрядчик обязан осуществлять освидетельствование грунтов дна котлована перед устройством бетонной подготовки.;\nе) согласование с Застройщиком, Техническим заказчиком плана контроля качества строительно-монтажных работ и поставок материалов, конструкций, оборудования.\n8.2.31. Нести все риски, связанные с прохождением процедуры таможенного оформления оборудования, материалов, изделий и конструкций, в случае использования Генподрядчиком либо привлекаемыми им субподрядчиками и поставщиками импортных оборудования, материалов, изделий и конструкций. Представить Застройщику по его запросу документы, подтверждающие факт завершения прохождения таможенного оформления (при наличии данных документов у Генподрядчика). Генподрядчик обязан запросить указанные документы у поставщика.\n8.2.32. Разработать и передать Застройщику до подписания Итогового акта (Акта №3) инструкции по эксплуатации инженерных систем и технологического оборудования, и иной инженерной инфраструктуры Объекта, а также инструкцию по эксплуатации объекта строительства.\n8.2.33. Оформить за свой счет полисы (договоры) страхования строительно-монтажных работ на сумму не менее Стоимости работ по Договору  на условиях «все риски» в пользу Банка (в том числе, но не ограничиваясь: от причинения ущерба Объекту, Строительной площадке, строительной технике и механизмам, по производству монтажных работ, по повреждению объектов, находящихся на Стройплощадке или в непосредственной близости от нее, от различного рода противоправных действий третьих лиц, аварий на инженерных сетях, от оседания, обвала, оползания грунта, от непреднамеренного нарушения норм и правил производства работ лицами, не являющимися ответственными за организацию работ и т.д.) и ответственности перед третьими лицами при наступлении страхового случая, по форме и перечню рисков, удовлетворяющим требования Банка (со сроком страхования до плановой даты ввода Объекта в эксплуатацию) и направить копии указанных полисов Застройщику в течение 15 (пятнадцати) дней с момента заключения Договора.\nОформить за свой счет страхование гражданской ответственности Генподрядчика и связанных с ней рисков на страховую сумму 150 000 000 (Сто пятьдесят миллионов) рублей, по форме и перечню рисков, удовлетворяющим требования Банка, и с указанием пострадавших лиц в качестве выгодоприобретателей. При этом срок страхования должен истекать не ранее плановой даты ввода Объекта в эксплуатацию. Направить копии указанных полисов Застройщику в течение 15 (пятнадцати) дней с момента заключения Договора.\nВ случае, если Генподрядчик не оформит в установленный срок полисы (договоры) страхования строительно-монтажных работ, гражданской ответственности Генподрядчика, то Застройщик имеет право самостоятельно оформить полисы (договоры) страхования строительно-монтажных работ, гражданской ответственности Генподрядчика. Все расходы, связанные с оформлением полисов (договоров) страхования строительно-монтажных работ, гражданской ответственности Генподрядчика должны быть возмещены Генподрядчиком Застройщику в срок не более 3 (трех) рабочих дней на основании требования Застройщика. По выбору Застройщика расходы, связанные с оформлением полисов (договоров) страхования строительно-монтажных работ, могут быть возмещены путем их зачета и/или удержания Застройщиком на основании одностороннего письменного заявления Застройщика в адрес Генподрядчика из сумм денежных обязательств Застройщика перед Генподрядчиком.\n8.2.34. Предоставлять Застройщику Еженедельные отчеты о ходе выполнения работ и о плане выполнения работ в электронном виде по форме Приложения №10. \nОтчеты предоставляются:\nОтчет о ходе выполнения работ в первый понедельник, следующий за отчетной неделей, до 14.00 по московскому времени;\nОтчет о плане проведения работ в последнюю пятницу, предшествующую отчетной неделе, до 14.00 по московскому времени. \nВ отчете указывается: код статьи кодификатора, объем выполненных/планируемых к выполнению работ, единицы измерения, стоимость выполненных/планируемых к выполнению работ, фактический срок начала и окончания (для завершенных на 100% работ) работ, наименование компании-исполнителя.\nОтчеты и приложения предоставляется Застройщику в электронном виде, посредством отправки по электронной почте n.kholopova@octobergroup.ru, a.tyutchenko@octobergroup.ru, malovik@octobergroup.ru.\nОтчет о ходе выполнения работ должен включать нижеследующую информацию:\n(а) Процент фактического выполнения в сравнении с плановым процентом выполнения по каждому виду работ;\n(б) В случае отставания работ от Графика строительства, указать возможные последствия и дать описание мер, необходимых для выполнения работ в сроки, предусмотренные Договором;\n(в) Информацию обо всех критических аспектах, влияющих на ход выполнения работ;\n(г) Графики хода выполнения отдельных видов работ; \n(д) Любую другую информацию, которую Застройщик может периодически запрашивать.\nГенподрядчик обязан принять меры предупреждения и во избежание задержек в ходе выполнения работ, и предпринять все необходимое для обеспечения удовлетворительного хода выполнения работ на всех этапах. Если на каком-либо этапе выполнения работ Генподрядчик начнет отставать от Графика строительства или станет очевидным, что работы не будут выполнены в сроки, предусмотренные указанными Графиком строительства, Генподрядчик обязан немедленно известить Застройщика о принимаемых мерах, необходимых для соблюдения сроков, предусмотренных Договором и Графиком строительства.\n8.2.35.1. Предоставлять Застройщику ежемесячно, не позднее 23-его числа предшествующего месяца, Производственную программу (Приложение № 10 к Договору) на следующий месяц (отчетный период). Производственная программа готовится Генподрядчиком на основании Графика строительства (Приложения №1 к Договору) и согласовывается Застройщиком в срок не более 5 (пяти) рабочих дней при отсутствии мотивированных замечаний.\nВ течение 3 (трех) рабочих дней с момента получения соответствующего требования Застройщика (но не чаще одного раза в квартал,) направить Застройщику надлежащим образом заверенные копии указанных в требовании информации и документов бухгалтерской и финансовой отчётности Генподрядчика по состоянию на дату, указанную в требовании Застройщика.\n8.2.36. Генподрядчик соглашается заключить договор подряда с подрядчиком, выбранным Застройщиком (далее - Номинированный Подрядчик) на условиях, предусмотренных в коммерческом предложении Номинированного Подрядчика. К указанным условиям добавляется генподрядный наценочный процент в размере 12% (двенадцать процентов) от общей суммы, указанной в коммерческом предложении Номинированного Подрядчика, при этом Генподрядчик принимает на себя полную ответственность за Номинированного Подрядчика, в том числе ответственность за использование авансов, выданных Номинированному Подрядчику, за качество и полноту исполнительной документации, а также за дефекты в работе, выявленные в гарантийном периоде. Коммерческое предложение Номинированного Подрядчика должно включать все предполагаемые расходы, необходимые для выполнения работ, в том числе оплату коммунальных услуг и другие связанные с выполнением работ расходы.\n8.2.37. При производстве работ не нарушать права третьих лиц, связанные с использованием любых патентов, торговых марок, авторских прав и иных объектов интеллектуальной собственности, а также оградить Застройщика от возможных исков, заявлений, требований и обращений третьих лиц, связанных с таким нарушением. В таких случаях Генподрядчик полностью за свой счет и своими силами урегулирует вышеуказанные требования третьих лиц.\n8.2.38. Обеспечить надлежащее хранение материалов и оборудования, поставленных на Строительную площадку для целей выполнения работ по Договору.\nВывезти в течение 7 (Семи) календарных дней, исчисляемых с даты подписания Итогового акта либо прекращения (расторжения) Договора, за пределы Строительной площадки принадлежащие Генподрядчику или его субподрядчиками строительные машины и технику, материалы, временные сооружения и другое имущество, в противном случае Застройщик вправе привлечь третье лицо для организации вывоза и ответственного хранения данного имущества с компенсацией Генподрядчиком понесенных расходов либо удержать сумму компенсации понесенных расходов из суммы денежных средств, причитающихся Генподрядчику.\n8.2.39. Обеспечить в установленном порядке оформление и согласование необходимых документов по доставке на Объект экологически чистого грунта, по временному складированию и вывозу грунта, непригодного для вторичного использования, и строительных отходов, по доставке на Объект недостающего грунта с карьеров.\n8.2.40. В счет стоимости работ по Договору не позднее даты подписания Итогового акта, ознакомить персонал управляющей компании работе с оборудованием и инженерными системами Объекта.\n8.2.41. Не передавать любую документацию по работам на Объекте или их отдельной части третьей стороне без письменного разрешения Застройщика, за исключением случаев, когда передача такой документации связана с закупкой материалов, оборудования, оказания услуг контрагентами Генподрядчика, а также случаев, предусмотренных законодательством РФ \n8.2.42. Генподрядчик имеет иные обязанности, указанные в тексте Договора, а также вытекающие из действующего законодательства Российской Федерации и относящиеся к предмету Договора.\n\n8.3. Застройщик имеет право:\n8.3.1. Проводить совещания или принимать участие в рабочих, технических и оперативных совещаниях по строительству и сдаче Объекта, проводимых Генподрядчиком, требовать необходимые разъяснения или обоснования по вопросам, относящимся к предмету Договора, требовать присутствия на совещаниях ответственных представителей Генподрядчика и подрядных и иных организаций, явку которых обязан обеспечить Генподрядчик.\n8.3.2. Требовать от Генподрядчика представления документации, относящейся к предмету Договора без вмешательства в хозяйственную деятельность Генподрядчика. Запрашивать информацию (в том числе в виде письменного отчета, предусмотренного п.8.2.34 Договора) о ходе и состоянии исполнения Генподрядчиком принятых на себя обязательств.\n8.3.3. Требовать от Генподрядчика устранения в согласованные сроки выявленных дефектов, отступлений от Проектной документации и Рабочей документации и нарушений технических условий и требований в соответствии с действующими нормами.\n8.3.4. Приостановить оплату выполненных Генподрядчиком работ в случае непредоставления счет-фактуры на сумму выполненных в отчетном месяце работ.\n8.3.5. В одностороннем порядке принять решение о замене материалов, оборудования и/или изделий, предусмотренных Проектной документацией, и/или Ведомостью договорной цены, и/или Техническим заданием, дизайн-проектами, на иные материалы, оборудование и/или изделия, письменно уведомив об этом Генподрядчика. При этом в случае получения указанного в настоящем пункте уведомления Генподрядчик обязан при выборе материалов, оборудования и/или изделий, необходимых для выполнения работ по Договору, руководствоваться указаниями Застройщика (относительно видов материалов, оборудования и/или изделий), содержащимися в данном уведомлении. В случае, если такая замена повлечет за собой изменение вида, характера, объемов, сроков и стоимости работ и материалов, предусмотренных Договором, Генподрядчик вправе не приступать к выполнению работ с использованием изменённых материалов, оборудования и/или изделий без оформления дополнительного соглашения к Договору. В случае, когда не выполнение Генподрядчиком работ с измененными материалами, оборудованием и/или изделиями по причине отсутствия оформленного дополнительного соглашения к Договору, объективно может привести к задержке выполнения иных/последующих работ, то такая задержка не будет являться результатом действий/бездействий Генподрядчика. \n8.3.6. Заявлять Генподрядчику претензии, связанные с некачественным выполнением работ, требовать от Генподрядчика устранения выявленных дефектов работ и/или материалов, отступлений от Проектной документации и нарушений технических условий.\n8.3.7. Проводить контроль качества содержания Строительной площадки и культуры производства работ, а также соблюдения на Строительной площадке правил охраны труда и техники безопасности. Осуществлять контроль за порядком и сроками производства работ. Количество проверок и сроки их проведения определяются представителем Застройщика единолично.\n8.3.8. В одностороннем порядке принять решение об изменении Проектной документации, Технического задания, дизайн-проектов Генподрядчик обязан выполнить Работы по Договору, руководствуясь указаниями Застройщика, содержащимися в соответствующем уведомлении, и откорректированной Проектной документации. В случае если Генподрядчик проигнорировал указание Застройщика, оговоренное в настоящем пункте Договора, Застройщик вправе не оплачивать Генподрядчику соответствующие выполненные работы, либо уменьшить их оплату по своему усмотрению, уведомив об этом письменно Генподрядчика. Генподрядчик вправе не приступать к выполнению работ, затронутых указанными изменениями без оформленного дополнительного соглашения к Договору. В случае, когда не выполнение Генподрядчиком работ, затронутых указанными изменениями работ по причине отсутствия оформленного дополнительного соглашения к Договору, объективно может привести к задержке выполнения иных/последующих работ, то такая задержка не будет являться результатом действий/бездействий Генподрядчика. \n8.3.9. В любое время требовать от Генподрядчика приостановки выполнения работ полностью либо в части (в том числе отдельных видов работ, либо применения отдельных видов материалов, конструкций, оборудования, изделий). Требование о приостановке выполнения Работ по Договору должно быть предъявлено в письменной форме (путем составления Акта) с указанием причин приостановки и срока его удовлетворения Генподрядчиком.\nПриостановка работ по причине некачественного выполнения отдельных видов работ, либо применения некачественных материалов, конструкций, оборудования, изделий, систем должна быть произведена Генподрядчиком немедленно после выявления вышеуказанных фактов.\nЗа отказ в удовлетворении требования о приостановке работ Генподрядчик несет ответственность, предусмотренную Договором и действующим законодательством РФ. Отказ Генподрядчика в приостановке работ в соответствии с настоящим пунктом фиксируется в журнале производства работ. \nГенподрядчик обязан устранить причины приостановки в пределах сроков (производства работ в целом, либо сроков выполнения работ по отдельным этапам), установленных Договором.\nГенподрядчик не вправе требовать увеличения сроков выполнения работ в целом, либо сроков работ по отдельным этапам, если приостановка вызвана виновными действиями Генподрядчика. \n8.3.10. Застройщик имеет также иные права, указанные в тексте Договора, а также вытекающие из действующего законодательства Российской Федерации и относящиеся к предмету Договора.\n8.4. Застройщик обязан:\n8.4.1. Обеспечить своевременное осуществление технического и авторского надзора за строительством Объекта, оформление техническим и авторским надзором исполнительной документации, полученной от Генподрядчика, ведение журнала авторского надзора. \n8.4.2 Заключить или обеспечить заключение договоров на услуги авторского надзора Генпроектировщика.\n8.4.3. Передавать Генподрядчику по согласованному Сторонами Графику выпуска Рабочей документации Проектную документацию в 4-х бумажных экземплярах (и 1 (один) экземпляр в электронном виде (в формате PDF, DWG, XLS), со штампом «в производство работ», согласованную в установленном порядке,  В случае, если передаваемая Рабочая документация имеет отклонения от принятой Генподрядчиком на дату заключения Договора Проектной и иной документации, полученной Генподрядчиком, а также приложений к настоящему Договору, в совокупности являющимися основанием для определения цены настоящего Договора, то такая документация должна сопровождаться перечнем с указанием отклонений. В случае, если Генподрядчиком будут выполнены работы по документации, имеющей указанные выше отклонения и не имеющей указанного перечня отклонений, то возможные дополнительные расходы Генподрядчика подлежат обязательной компенсации Застройщика. \n8.4.4. Передать Генподрядчику следующие документы:\n8.4.4.1. Копию разрешительной документации в объеме, необходимом для строительства Объекта и ввода его в эксплуатацию.\n8.4.4.2. Копию оформленного в установленном порядке разрешения на строительство Объекта.\n8.4.4.3. Журналы производства работ, оформленные в установленном порядке, в том числе общий журнал работ и журнал авторского надзора.\n8.4.4.4. Согласованный стройгенплан.\nНа момент подписания Договора Генподрядчику передана Проектная документация, получившая положительное заключение Мосгосэкспертизы, Рабочая документация по первому этапу работ и иные документы в соответствии с Актом приема передачи исходной документации. \n8.4.5. Передать Генподрядчику по Акту приема - передачи точки для подключения ресурсоснабжения, если такое подключение предусмотрено условиями Договора.\n8.4.6. Обеспечить финансирование выполняемых Генподрядчиком работ на Объекте, принять и оплатить своевременно и надлежащим образом выполненные Генподрядчиком работы в сроки и на условиях, предусмотренных Договором.\n8.4.7. Организовать приемку своевременно и надлежащим образом выполненных работ Генподрядчика.\n8.4.8. Передать Генподрядчику приказы о назначении инженерно-технических работников, ответственных за строительство Объекта (представителях Застройщика) и за ведение строительного контроля при производстве работ (представителях Технического Заказчика).\n8.4.9. Осуществлять контроль за соблюдением условий Договора Генподрядчиком.\n8.4.10. Обеспечить по требованию Генподрядчика рассмотрение вопросов по предмету Договора и принятие решения по ним в сроки, не влияющие на ход строительства.\n8.4.11. Осуществлять проверку и оформление полученных от Генподрядчика Актов по форме КС-2, Справок по форме КС-3 и других документов, требующих подписи (согласования) Застройщика.\n8.4.12. Обеспечить готовность наружных инженерных сетей и сооружений в сроки, не влияющие на своевременное выполнение Генподрядчиком своих работ по Договору.\n8.4.13. Обеспечить наличие документации, находящейся в компетенции Застройщика и необходимой для оформления ЗОС.\n8.4.14. Не позднее, чем за 4 (четыре) месяца до даты получения ЗОС, указанной в Договоре представить Генподрядчику организацию, которая будет осуществлять эксплуатацию Объекта и иметь в штате сотрудников соответствующей квалификации и подтверждающими квалификацию документами.\n8.4.15. Застройщик имеет также иные обязанности, указанные в тексте Договора, а также вытекающие из действующего законодательства Российской Федерации и относящиеся к предмету Договора.\n8.5. При реализации своих прав и обязанностей, предусмотренных настоящим разделом, а также Договором в целом, стороны должны действовать добросовестно и разумно. \n\n9.\tПОСТАВКИ МАТЕРИАЛОВ, ОБОРУДОВАНИЯ\n9.1. Поставка материалов, конструкций, изделий, оборудования и иной продукции для строительства Объекта включена в договорную стоимость и осуществляется Генподрядчиком. \n9.2. Материалы, конструкции, изделия, оборудование и иная продукция для строительства Объекта, предоставляемые Генподрядчиком для строительства Объекта, должны быть надлежащего качества,  соответствовать проектной документации, действующему законодательству РФ, в том числе применимым нормам, правилам, ГОСТам, стандартам и техническим регламентам и, при необходимости, пройти согласование с Застройщиком по виду, качеству и соответствию требованиям Застройщика, должны иметь соответствующие сертификаты, технические паспорта и другие документы, удостоверяющие их качество. Заверенные Генподрядчиком копии этих документов должны быть предоставлены по письменному запросу Застройщика в течение 10 (десяти) календарных дней с момента их получения Генподрядчиком. При передаче оборудования в монтаж, Генподрядчик обязан сопроводить его документацией предприятия-изготовителя, необходимой для монтажа. \n9.3. Генподрядчик обязан по мотивированному требованию Застройщика провести экспертизу образцов материалов для оценки их качества. При этом расходы на проведение экспертизы оплачиваются лицом, назначившим экспертизу. Если экспертной комиссией (специалистом) будет подтверждена некачественность материалов, расходы, понесенные Застройщиком на проведение экспертизы, оплатит Генподрядчик.\n9.4. В случае выявления превышения предельно-допустимой концентрации (ПДК) химических веществ в воздухе в помещениях Объекта по вине Генподрядчика вследствие применения поставленных им материалов Генподрядчик в период Гарантийного срока за счет собственных средств выполняет все мероприятия по приведению ПДК вредных веществ на Объекте в нормативное состояние, либо компенсирует документально подтвержденные затраты Застройщика и/или привлекаемых организаций по выполнению указанных мероприятий.\n\n10.\tВЕДЕНИЕ СТРОИТЕЛЬНОГО КОНТРОЛЯ ЗА ВЫПОЛНЕНИЕМ РАБОТ ПО ДОГОВОРУ\n10.1. Строительный контроль за строительством Объекта в соответствии с законодательными, распорядительными и нормативными документами осуществляют Генподрядчик (непосредственный производитель работ), Застройщик и Технический Заказчик.\n10.2. Генподрядчик, Застройщик и Технический Заказчик осуществляют контроль за выполнением работ, их качеством, соблюдением сроков их выполнения, качеством применяемых материалов, конструкций, изделий и оборудования, соблюдением Проектной и нормативной документации, а также соответствием объема, качества и стоимости выполняемых работ условиям Договора.\n10.3. Контроль над качеством работ и применяемых материалов, конструкций, изделий и оборудования, соответствием выполняемых работ Проектной документации, соблюдением действующих законодательных, распорядительных и нормативных документов осуществляют также представители авторского надзора проектной организации, государственных надзорных органов, эксплуатирующих организаций.\n10.4. Проведение испытаний материалов, конструкций и инженерных систем проводится в порядке, предусмотренном строительными нормами и правилами, и другими нормативными документами. Испытания, не предусмотренные нормативными документами, Генподрядчик выполняет по заданию Застройщика за отдельную плату, если это не вызвано необходимостью принятия решения по исправлению допущенных Генподрядчиком при выполнении работ отступлений от Проектной, Рабочей или нормативной документации.\n10.5. Материалы, изделия, конструкции, оборудование, не удовлетворяющие требованиям Проектной, Рабочей или нормативной документации, подлежат удалению со Стройплощадки Генподрядчиком за его счет.\n10.6. Застройщик в случае обнаружения при осуществлении контроля за выполнением работ отступления от требований Проектной, Рабочей или нормативной документации, а также условий Договора, обязан немедленно письменно уведомить об этом Генподрядчика. Генподрядчик обязан исполнить полученные в ходе строительства указания Застройщика в кратчайшие сроки (в особых случаях, исключающих возможность продолжения строительства остановить работы до устранения брака или устранения дефектов), не нарушая при этом общего срока выполнения работ по Договору.\n\n11.\tСКРЫТЫЕ РАБОТЫ\n11.1. Генподрядчик может приступать к выполнению последующих работ только после приемки Застройщиком скрытых работ и составления актов освидетельствования этих работ.\nПеречень скрытых работ, подлежащих промежуточному освидетельствованию, принимается в соответствии с действующими нормативными документами.\n11.2. Генподрядчик обязан письменно известить Застройщика о необходимости освидетельствования подлежащих закрытию работ за 2 (два) рабочих дня до освидетельствования.\n11.3. Застройщик вправе потребовать дополнительную проверку любых скрытых работ, включая те, в освидетельствовании которых он принимал участие, если имеются основания предполагать изменение их состояния.\n11.4. В случае, когда Застройщик и/или Технический Заказчик не приглашались на освидетельствование, Генподрядчик по требованию Застройщика обязан за свой счет выполнить вскрытие и повторное закрытие подлежащих освидетельствованию работ. \nПри этом ответственность за Просрочку Генподрядчик несет в полном объеме в соответствии с условиями Договора. \n\n12.\tИЗМЕНЕНИЯ В ПРОЕКТНОЙ ДОКУМЕНТАЦИИ\n12.1. Отдельные изменения, вносимые в процессе работы в Проектную, Рабочую документацию в порядке технического или авторского надзора, или по инициативе Генподрядчика действительны только при условии, что эти изменения письменно удостоверены Застройщиком и соответствуют действующему законодательству и нормативным актам\n12.2. Изменения и дополнения, вносимые в Проектную, Рабочую документацию, должны быть письменно доведены до Генподрядчика, в том числе путем оформления соответствующей записи в журнале работ и выдачи Генподрядчику дополнительных экземпляров Проектной, Рабочей документации, оформленной в установленном порядке.\n12.3. В случае если изменения и дополнения, внесенные в Проектную, Рабочую документацию по инициативе Застройщика, влекут за собой переделки уже выполненных Генподрядчиком работ, эти переделки актируются Сторонами, а их стоимость оформляется Дополнительным соглашением к Договору и подлежит оплате Застройщиком.\n12.4. Застройщик не позднее чем за 60 (шестьдесят) календарных дней обязан предупредить Генподрядчика о планируемых изменениях в Проектную, Рабочую документацию, Техническое задание, Вендор-лист и иную сопутствующую документацию. В случае не уведомления в предусмотренный срок Застройщик обязуется компенсировать Генподрядчику фактические документально подтвержденные понесенные расходы на материалы и оборудование, завезенные на Объект и принятые Застройщиком либо в случае если оборудование/материалы заказаны/внесен аванс Генподрядчиком, то указанные договоры закрываются на выполненном объеме, Генподрядчик поставляет материалы, оборудование которое успели произвести к указанному моменту, а Застройщик компенсирует их стоимость. \n\n13. ПОРЯДОК СДАЧИ ОБЪЕКТА\n13.1. Генподрядчик письменно уведомляет Застройщика о завершении Работ по строительству Объекта в полном объеме, о готовности Объекта и формировании Приемочной комиссии.\nПо результатам работы Приемочной комиссии, которая проводится в течение 10 (Десяти) рабочих дней с момента образования Приемочной комиссии, если Приемочной комиссией будет принято решение о готовности Объекта к получению ЗОС, Стороны оформляют Акт № 1 («Акт приемки объекта капитального строительства»).\nЗастройщик в течение 3 (трех) рабочих дней со дня подписания Акта приемки объекта капитального строительства (Акта № 1), подает в Мосгосстройнадзор заявление о проведении итоговой проверки и выдаче ЗОС.\nВо избежание сомнений, Генподрядчик обязуется в счет Цены работ обеспечить выдачу ЗОС (для чего Застройщик обязуется оказать необходимое Генподрядчику содействие и обеспечить Генподрядчика необходимыми доверенностями и полномочиями).\nГенподрядчик обязуется участвовать совместно с Застройщиком во всех проверках и иных мероприятиях, проводимых органами государственного строительного надзора и иными Государственными органами при рассмотрении вопросов о выдаче заключения органа государственного строительного надзора о соответствии построенного объекта капитального строительства требованиям технических регламентов и проектной документации.\nЕсли в ходе проведения проверок и иных мероприятий, указанных в настоящем пункте, будет затребована дополнительная документация (включая, но не ограничиваясь, акты испытаний, акты разграничения ответственности и другая документация), то в случае, если запрошена документация в компетенции Застройщика, то такую документацию должен представить Застройщик, а если любая другая – то Генподрядчик.\nВ случае если Генподрядчик считает запрос органов государственного строительного надзора и/или иных Государственных органов незаконным, он должен незамедлительно представить Застройщику ответ со ссылкой на положение, содержащееся в нормативно-правовом акте, подтверждающее незаконность запроса.\n13.2. Приемка законченного строительством Объекта начинается Приемочной комиссией в течение 5 (Пяти) рабочих дней со дня получения ЗОС.\nВ течение 30 (Тридцати) календарных дней после даты получения ЗОС и начала работы Приемочной комиссии, Сторонами оформляется Акт № 2 (по тексту Договора «Акт №2 или «Акт приемки объекта в эксплуатацию), отражающий факт наличия или отсутствия Недостатков и/или дефектов результата Работ, комплектности и исправности оборудования и инженерных систем, входящих в состав результата Работ, полноты Исполнительной документации, а также устанавливающий сроки их устранения Генподрядчиком.\nВ случае выявления недостатков или дефектов в результате Работ Стороны составляют Акт № 2 совместно с перечнем недостатков («Дефектной ведомостью» или «Чек-лист»), который будет содержать исчерпывающий перечень дефектов и недостатков выполненных Генподрядчиком работ.\nПеречень дефектов должен содержать следующую информацию: фотографию каждого дефекта, локализацию каждого дефекта (корпус, этаж, оси, строительный конструктив) и ФИО ответственного представителя, выдавшего дефект. \n13.3. После устранения Генподрядчиком всех дефектов и недостатков, указанных в Дефектной ведомости (Чек-лист) к Акту №2 Генподрядчик считается исполнившим свои обязательства по устранению дефектов и недостатков, Генподрядчик передает Объект Эксплуатирующей организации в эксплуатацию, что будет подтверждено подписанной Сторонами Технической «Ключевой справкой»  о передаче объекта под заселение, утв. Постановлением Правительства Москвы от 11.07.2000 №530, и Застройщик обязан принять результат Работ и подписать Итоговый акт (Акт №3).\nВ случае если в течение 15 (Пятнадцати) рабочих дней с даты получения Застройщиком уведомления о начале приемки и подписании Итогового акта (Акта №3), при условии подписания Акта №2 и устранения Генподрядчиком всех указанных в таком акте как значительные дефектов и недостатков, а также передачи Исполнительной документации и прочих документов, Застройщик не направят Генподрядчику по адресу Генподрядчика мотивированный отказ, и при этом не начнут приемку, то Итоговый акт (Акт № 3) может быть подписан Генподрядчиком в одностороннем порядке со всеми вытекающими правами, предоставляемыми Генподрядчику статьей 720, 753 Гражданского Кодекса РФ\nСдача Объекта осуществляется в установленном законодательством РФ и города Москвы порядке путем оформления Генподрядчиком совместно с Застройщиком в соответствии с положениями Градостроительных кодексов, распорядительных и нормативных документов Российской Федерации и города Москвы ЗОС, Разрешения на ввод объекта в эксплуатацию. \n13.4. Промежуточное освидетельствование качества работ в соответствии со строительными нормами и правилами, а также необходимые испытания производятся по мере выполнения работ после получения письменного сообщения от Генподрядчика. \n\n14. ГАРАНТИИ. УСТРАНЕНИЕ НЕДОСТАТКОВ\n14.1. Генподрядчик гарантирует:\n- соответствие качества работ, выполненных на Объекте, Проектной документации, действующим строительным нормам и правилам, инструкциям, стандартам, техническим условиям и другим регламентам, документам, действующими на территории г. Москвы и РФ;\n- надлежащее качество используемых материалов и оборудования, и соответствие их качества требованиям Проектной и Рабочей документации, условиям Договора, государственным стандартам, а также наличие сертификатов, технических паспортов и прочих документов, подтверждающих качество материалов и оборудования и их соответствию;\n- бесперебойное функционирование инженерных систем и оборудования, смонтированного или установленного на Объекте при условии нормальной эксплуатации Объекта;\n- своевременное устранение недостатков и дефектов, выявленных при приемке работ и в гарантийный срок эксплуатации Объекта; \nВсе указанные гарантии качества предоставляются Генподрядчиком и распространяются как на Объект в целом, так и на все конструктивные элементы и инженерные системы (материалы, новое оборудование, системы) и работы, выполненные Генподрядчиком и/или привлеченными им третьими лицами (подрядчиками, поставщиками, исполнителями). \n14.2. В случае применения в строительстве материалов или оборудования, конструкций, изделий, систем, не соответствующих по качеству требованиям российских стандартов (норм, правил), Проектной документации, условиям Договора или не имеющих сертификата производителя, либо не разрешенных к применению на территории РФ, Генподрядчик безвозмездно заменяет эти материалы и производит без оплаты необходимые строительно-монтажные или иные работы, связанные с заменой материалов. \n14.3. Гарантийный срок на выполненные по Договору строительные работы, включающие в себя, в том числе, конструктивные элементы, фасады, кровлю - составляет 5 (пять) лет. \nГарантийный срок на работы по монтажу на Объекте инженерных систем и оборудования составляет 5 (пять) лет, на технологическое и инженерное оборудование составляет 3 (три) года. \nГарантийный срок на отделочные работы и благоустройство составляет 2 (два) года.\nУказанные гарантийные сроки исчисляются с момента подписания Сторонами Итогового акта (Акта №3).\n14.4. Если Гарантийный срок, установленный изготовителем или поставщиком материалов, конструкций, изделий, оборудования на свою продукцию больше срока, указанного в п.14.3 Договора, Генподрядчик обязуется выполнять гарантийные обязательства в отношении работ, произведенных с применением этих материалов, конструкций, изделий, оборудования в течение срока гарантии, установленного изготовителем или поставщиком, но в пределах 3 (трех) лет.\n14.5. В случае выявления в период Гарантийного срока недостатков или дефектов выполненных работ, Генподрядчик обязан за свой счет устранить такие дефекты или недостатки в согласованные Сторонами сроки. \n14.6. При обнаружении в период Гарантийного срока недостатков или дефектов в выполненных работах, Застройщик письменно уведомляет Генподрядчика о дате и времени совместного осмотра выявленных недостатков/дефектов и составлении рекламационного акта (далее – «Уведомление»), при этом Уведомление должно быть вручено Генподрядчику не позднее чем за 96 (девяносто шесть) часов до указанного времени и указанной Застройщиком в Уведомлении даты совместного осмотра выявленных недостатков/дефектов (касается дефектов, которые обнаружены собственниками в принадлежащих им помещениях), и за десять рабочих дней (касается всех остальных дефектов), при этом Стороны установили, что надлежащим направлением/вручением Уведомления Генподрядчику является  направление/вручение его скан-образа Генподрядчику в порядке, предусмотренном п. 14.10 Договора. \nПосле получения Уведомления, в порядке предусмотренном п.14.10 Договора,  Генподрядчик направляет своего уполномоченного представителя в указанные в Уведомлении дату и время для совместного с Застройщиком осмотра выявленных недостатков/дефектов и составления рекламационного акта, при этом в случае неявки уполномоченного представителя Генподрядчика на совместный с Застройщиком осмотр выявленных недостатков/дефектов и составление рекламационного акта, или отказа представителя Генподрядчика от составления и/или подписания рекламационного акта, Застройщик вправе составить односторонний рекламационный акт. В таком случае односторонний рекламационный акт должен быть вручен Генподрядчику не позднее 3 (трех) рабочих дней с даты его составления, при этом Стороны установили, что надлежащим направлением/вручением одностороннего рекламационного акта Генподрядчику является направление/вручение его скан-образа Генподрядчику в порядке, предусмотренном п. 14.10 Договора. \n14.7. Рекламационный акт должен содержать:\n- описание дефекта/недостатка и его местонахождения, а также их фотофиксацию;\n- причину возникновения дефекта/недостатка и отнесение его к гарантийному с указанием какие требования Проектной и/или Рабочей документации, и/или действующих строительных норм и правил, инструкций, стандартов, технических условий и других регламентов, документов, действующих на территории г. Москвы и РФ были нарушены Генподрядчиком/негарантийному;\n- планируемую дату начала работ по устранению дефекта/недостатка и срок его устранения;\n- способ устранения дефекта/недостатка;\n- устранение дефекта/недостатка силами Генподрядчика или привлеченным им третьим лицом в случае, предусмотренном п.14.10. Договора.\n14.8. В случае, если Генподрядчику по истечении 10 (десяти) рабочих дней с даты составления рекламационного акта при его двухстороннем подписании Сторонами, либо с даты направления Генподрядчику одностороннего рекламационного акта в порядке, предусмотренном п.14.6 Договора, не направит Застройщику мотивированные возражения, выявленные в результате осмотра недостатки/дефекты, указанные в рекламационном акте, будут считаться гарантийными и подлежащими устранению Генподрядчиком в порядке и в сроки, установленные в рекламационном акте, а в случае их отсутствия в рекламационном акте, в сроки, установленные в Приложении № 8 к Договору - «Сроки устранения дефектов по типовым обращениям». \nВ случае несогласия Генподрядчика с причинами возникновения дефекта/недостатка и отнесением его к гарантийному, для установления причин возникновения дефекта/недостатка Генподрядчиком должна быть проведена независимая экспертиза. Расходы на экспертизу несет Генподрядчик, за исключением случаев, когда экспертизой будет установлено возникновение дефекта/недостатка вследствие нормального износа Объекта или его частей, неправильной его эксплуатации, нарушении требований Инструкций по его эксплуатации (Руководства по эксплуатации), разработанных Генподрядчиком и согласованных Застройщиком, ненадлежащего ремонта Объекта, произведенного самим Застройщиком или привлеченными им третьими лицами.\nЗастройщик приложит усилия, чтобы управляющая компания приняла к исполнению Инструкцию по эксплуатации (Руководство по эксплуатации) Объекта, разработанную Генподрядчиком (пп. 8.2.32, 8.2.40 Договора) и согласованную Застройщиком. \n14.9. В случае, если:\n- Генподрядчик не приступит к устранению дефекта/недостатка в срок, установленный в рекламационном акте, или\n- Генподрядчик не устранит дефект/недостаток в срок, установленный в рекламационном акте, или\n- Стороны не придут к соглашению о сроке начала выполнения работ по устранению дефекта/недостатка и/или о сроке его устранения при наличии у Генподрядчика мотивированных возражений по сроку устранения дефекта/недостатка, направленных Генподрядчику в порядке и в сроки, предусмотренные п.14.8 Договора, Застройщик вправе привлечь для устранения дефекта/недостатка третье лицо с уведомлением об этом Генподрядчика, а Генподрядчик обязан возместить Застройщику его расходы на устранение дефекта/недостатка третьим лицом в течение 5-х рабочих дней со дня получения от Застройщика документов, подтверждающих произведенные им расходы на устранение дефекта/недостатка.\nВ случае, если Генподрядчик не возместил Застройщику его расходы на устранение дефекта/недостатка в порядке и размере, установленных настоящим пунктом Договора, Застройщик вправе удержать соответствующую сумму задолженности из суммы гарантийного удержания по Договору.\nПомимо возмещения Застройщику расходов на устранение недостатка/дефекта, Генподрядчик обязан возместить Застройщику все убытки, понесенные последним в связи с нарушением Генподрядчиком своих гарантийных обязательств по Договору.\n14.10. Для целей взаимодействия Сторон по исполнению Генподрядчиком своих гарантийных обязательств в порядке, предусмотренном настоящим разделом Договора, Стороны договорились, что любое уведомление или иное сообщение, направляемое Сторонами друг другу, должно быть совершено в письменной форме и передано адресату лично, заказным письмом с уведомлением о вручении или курьерской службой по указанным ниже адресам, а также дублированием уведомления посредством электронной почты:\nАдреса для контактов с Застройщиком:\nПочтовый адрес: 123022, г. Москва, Столярный пер, д.3 корп.5 (ящик для «Совтехстрой»)\nАдрес электронной почты 1: n.kholopova@octobergroup.ru\nАдрес электронной почты 2: malovik@octobergroup.ru\nАдреса для контактов с Генподрядчиком:\nПочтовый адрес: 127018, Москва, ул. Полковая, д. 3, строение 5\nАдрес электронной почты 1: su10@su10.ru\nАдрес электронной почты 2: baranskiy.S.S@mstroy.pro\nЛюбое уведомление Стороне, должно быть направлено посредством почтовой связи, с дублированием посредством электронной. В том случае, если Уведомление не было направлено на какой-либо из указанных адресов (в том числе посредством электронной почты), оно не считается полученным соответствующей Стороной.\n\n15. ПРИОСТАНОВЛЕНИЕ РАБОТ, РАСТОРЖЕНИЕ ДОГОВОРА\n15.1. Основаниями для приостановления работ/видов работ (исполнения обязательств по Договору) и/или одностороннего внесудебного расторжения Договора со стороны Застройщика могут служить:\n15.1.1. Неоднократное (более трех раз) неустранение (отказ от устранения) Генподрядчиком выявленных Застройщиком/Техническим заказчиком недостатков (дефектов) в выполняемых работах и применяемых материалах, оборудовании, изделиях, конструкциях, механизмах, применение материалов, оборудования, изделий, конструкций, механизмов, не соответствующих условиям Договора и Проектной документации. \n15.1.2. Нарушение Генподрядчиком сроков выполнения работ более чем на 60 (шестьдесят) календарных дней относительно сроков, установленных Графиком строительства.\n15.1.3. Задержка Генподрядчиком начала выполнения работ более чем на 15 (пятнадцать) календарных дней по причинам, не зависящим от Застройщика.\n15.1.4. Исключение Генподрядчика из членов СРО, отмена, приостановление или окончание срока действия допуска СРО Генподрядчика или другого документа, дающего ему право осуществлять работы, предусмотренные Договором и непредставление Генподрядчиком данных о новом допуске СРО в течение 7 (семи) календарных дней с момента исключения Генподрядчика из членов СРО, отмены, приостановления или окончания срока действия допуска СРО.\n15.1.5. Незаконное привлечение к трудовой деятельности иностранного гражданина или лица без гражданства Генподрядчиком или его привлеченными к работам подрядчиками, если такие действия повлекли остановку работ на Объекте на срок более 30 (Тридцати) календарных дней.\n15.1.6. Нарушение Генподрядчиком правил охраны труда и техники безопасности и общего порядка производства работ на Объекте, содержания Строительной площадки, строительного городка, временных дорог и сетей, режима охраны и уборки территории более двух раз в течение одного календарного месяца.\n15.1.7. Начало процедуры ликвидации Генподрядчика.\n15.1.8. Наличие введенной судом в отношении Генподрядчика любой, предусмотренной законодательством процедуры банкротства.\n15.1.9. Наличие вступившего в законную силу решения суда о взыскании с Генподрядчика денежных средств, в совокупности превышающих 10% от Стоимости работ.\n15.1.10. Наличие предписаний, выданных органами, осуществляющими строительный надзор, в отношении строительства Объекта, если нарушения, указанные в предписаниях, повлекли за собой приостановление работ более чем на 60 (шестьдесят) календарных дней или не позволяют продолжить выполнение работ.\n15.1.11. Отставание от графика строительства Объекта на 3 (три) месяца и более;\n15.1.12. Выявление факта нецелевого использования авансов, выданных Генподрядчику по Договору и/или Генподрядчиком субподрядчикам в рамках исполнения Договора.\n15.1.13. Неоднократного (два и более раз в течение одного календарного месяца) несоблюдения (отступления от требований, предусмотренных Договором, Проектной документацией, стандартами, нормами и правилами, а также иными действующими нормативно-правовыми актами) Генподрядчиком требований к качеству работ и/или технологии проведения работ.\n15.1.14. Невыполнение Генподрядчиком обоснованных требований Застройщика, предъявленных в соответствии с условиями Договора.\n15.1.15. Иные объективные причины, которые могут препятствовать своевременному исполнению обязательств Генподрядчика по Договору.\n15.2. Основаниями для приостановления работ со стороны Генподрядчика, а также для продления сроков выполнения работ по Договору могут служить:\n15.2.1. Просрочка исполнения обязательств по передаче Застройщиком Рабочей документации в объеме, необходимом для выполнения своевременного выполнения работ, более чем на 30 (тридцать) календарных дней совокупно по всем разделам Проектной документации.\n15.2.2. Задержка перечисления Застройщиком платежей против сроков, определенных Договором, более чем на 45 (сорок пять) календарных дней, за исключением случаев приостановки платежей Застройщиком в соответствии с условиями Договора.\n15.3. Помимо случаев, установленных Договором досрочное расторжение Договора возможно по соглашению Сторон.\n15.4. Застройщик вправе до окончания действия Договора в одностороннем внесудебном порядке отказаться от исполнения Договора по основаниям, предусмотренным в п. 15.1 Договора (с учетом подпунктов), уведомив Генподрядчика в письменном виде, что влечет одностороннее внесудебное прекращение (расторжение) Договора. \nПри этом Договор будет считаться прекращенным (расторгнутым) в дату получения Генподрядчиком соответствующего уведомления об отказе от исполнения Договора в соответствии с настоящим пунктом, если в уведомлении не предусмотрено иное. В случае прекращения (расторжения) Договора в соответствии с настоящим пунктом Договора Генподрядчик не вправе требовать возмещения ему убытков, связанных с расторжением Договора, в том числе, разницы между ценой Договора и ценой фактически оплаченных работ.\n15.5. В случае досрочного прекращения (расторжения) Договора Стороны в течение 10 (десяти) рабочих дней с момента прекращения (расторжения) Договора оформляют соглашение об урегулировании взаиморасчетов по Договору, после чего в течение 10 (десяти) рабочих дней с момента подписания данного соглашения Стороны обязаны произвести взаиморасчеты, в том числе, если размер перечисленных Генподрядчику денежных средств (авансов и любых иных выплат) превышает стоимость выполненных и принятых Застройщиком работ, Генподрядчик обязан произвести возврат излишне перечисленных Генподрядчику денежных средств.\nЗастройщик принимает и оплачивает материалы и оборудование, приобретенное Генподрядчиком в целях исполнения обязательств по Договору до расторжения Договора при условии соответствия материалов и оборудования Проектной документации и требованиям по качеству и согласования их приобретения Генподрядчиком (если такое обязательное согласование предусмотрено Договором). В отношении не поставленных на Строительную площадку материалов или оборудования, по выбору Застройщика или передаются права по договорам поставки, согласно которым Генподрядчиком выплачен аванс и которые невозможно расторгнуть без финансовых потерь, или Генподрядчик осуществляет приемку материалов и оборудования по количеству и качеству и впоследствии передает их Застройщику.\nГенподрядчик обязуется по требованию Застройщика передать в собственность и по выбору последнего ограждение Строительной площадки, временные здания, сооружения, дороги, сети и коммуникации, выполненные Генподрядчиком для строительства Объекта, за стоимость, которая рассчитывается исходя из стоимости указанных работ и материалов согласно Ведомости договорной цены, за вычетом суммы, ранее оплаченной в отношении указанных работ и материалов.\n15.6. В случае прекращения (расторжения) Договора до завершения строительства Объекта, результат произведенных работ считается переданным от Генподрядчика Застройщику:\n– с момента подписания Сторонами акта сдачи-приемки незавершенного строительством Объекта и Строительной площадки, который Стороны обязаны подписать в течение 30 (Тридцать) календарных дней с момента прекращения (расторжения) Договора, либо,\n– в случае бездействия Генподрядчика по передаче результата выполненных работ и Строительной площадки и/или его уклонения от такой передачи - с момента подписания Застройщиком одностороннего акта о приемке незавершенного строительством Объекта и Строительной площадки, подписываемого Застройщиком в одностороннем порядке без участия Генподрядчика и/или привлеченных им субподрядных организаций, не ранее, чем по истечении 5 (пяти) рабочих дней с последней даты периода, когда в соответствии с Договором Сторонами должен был быть подписан акт передачи результата выполненных работ и Строительной площадки.\n15.7. Досрочное расторжение Договора по любым основаниям не снимает с Генподрядчика ответственности за качество уже выполненных работ и не освобождает Генподрядчика от соблюдения принятых на себя гарантийных обязательств по выполненным им или привлеченными им субподрядчиками работам, а Застройщика от обязанности по оплате фактически выполненных Генподрядчиком и принятых от него работ с учетом условий Договора.\n15.8. В случае досрочного расторжения Договора Генподрядчик обязуется в течение 15 (пятнадцати) рабочих дней с даты такого расторжения предоставить Застройщику сведения о выполненных Генподрядчиком на дату расторжения Договора работах и их стоимости, с приложением документов, подтверждающих факт выполнения указанных работ и обосновывающих их стоимость, передать результат выполненных работ по строительству Объекта, а также Проектную, Рабочую, разрешительную и Исполнительную документацию Застройщику по акту сдачи-приемки в срок не позднее 30 (тридцати ) рабочих дней с даты получения уведомления о прекращении (расторжении) Договора. \nВ случае досрочного прекращения (расторжения) Договора и наличия факта подписания Акта сдачи-приемки незавершенного строительством Объекта и Строительной площадки согласно п. 15.6. Договора, Застройщик имеет право ограничить доступ сотрудников Генподрядчика и привлеченных им субподрядчиков к Объекту и предпринять все необходимые действия для освобождения Строительной площадки от имущества Генподрядчика и привлеченных им субподрядчиков. \nПоложения настоящего пункта являются обоснованием перед третьими лицами прав Застройщика на ограничение доступа сотрудников Генподрядчика и привлеченных им субподрядчиков на Объект и совершения действий, направленных на освобождение Строительной площадки от имущества Генподрядчика и привлеченных им субподрядчиков.\n15.9. Стороны пришли к соглашению, что в момент расторжения Договора Застройщику переходит право собственности на оплаченные (в том числе путем выплат целевых авансовых платежей) Генподрядчику материалы, оборудование, изделия, конструкции, механизмы, имущество и т.д., необходимые для строительства Объекта, в том числе, расположенные на Строительной площадке. \nВ случае, когда материалы, оборудование, изделия, конструкции, механизмы и иное имущество, необходимые для строительства Объекта были оплачены частично (или частично проавансированы), Застройщик вправе оставить такое имущество за собой (обратить в свою собственность) с доплатой разницы между оплаченным и зафиксированной по Договору стоимостью такого имущества, уведомив об этом Генподрядчика. \nВ случаях, указанных в настоящем пункте, Застройщик вправе без какого – либо дополнительного согласования с Генподрядчиком владеть, пользоваться и распоряжаться материалами, оборудованием, изделиями, конструкциями, механизмами и прочим имуществом приобретенном/поставленном для строительства Объекта, а Генподрядчик обязан передать Застройщику накладные, сертификаты и все иные документы, относящиеся к указанным материалам, оборудованию, изделиям, конструкциям, механизмам и прочему имуществу в срок не позднее 10 (десяти) рабочих дней со дня расторжения Договора.\n15.10. Стороны определили, что в случае расторжения Договора по любым основаниям, условия Договора, которые в силу своего содержания предполагают их применение и после расторжения Договора (в том числе гарантийные обязательства (срок, порядок выполнения, ответственность за нарушение гарантийных обязательств) раздел 14 Договора, положения о контактах и разрешении споров в разделах 18 и 19 Договора, регулирование отношений Сторон в период после расторжения в разделе 15 Договора), сохраняют свое действие и после расторжения Договора и применяются Сторонами.\n15.11. Стороны определили, что в случае расторжения Договора, зарезервированные денежные средства в соответствии с положениями п. 7.3.2. Договора остаются у Застройщика в целях обеспечения исполнения обязательств Генподрядчика на срок 18 (восемнадцать) месяцев с даты расторжения Договора. Застройщик вправе из указанной суммы самостоятельно производить зачет своих денежных требований к Генподрядчику в связи с не устранением Генподрядчиком выявленных дефектов в установленный Сторонами срок, но с предварительным письменным уведомление Генподрядчика о таком зачете. По истечении 18 (восемнадцати) месяцев с даты расторжения Договора, Застройщик перечисляет Генподрядчику на основании выставленного счета и письменного обращения, оставшиеся из зарезервированных сумм денежные средства после произведенных удержаний, если таковые производились.\n15.12. В случае принятия в установленном порядке решения о консервации работ на Объекте Застройщик оплачивает Генподрядчику все выполненные и принятые работы до момента приостановления работы. Стороны обязаны совместно рассмотреть и согласовать сроки, стоимость и порядок консервации Объекта. \nЕсли на момент принятия решения о консервации, при условии наличия факта подписания Акта сдачи-приемки незавершённого строительством Объекта, Генподрядчик не подтвердил фактически выполненными и принятыми Заказчиком работами денежные средства, полученные им по Договору, Генподрядчик обязан вернуть Заказчику указанные денежные средства в течение 10 (десяти) дней с момента предъявления соответствующего требования.\n15.13. Генподрядчик вправе в одностороннем порядке отказаться от исполнения Договора, в следующих случаях:\n15.13.1. Застройщик нарушает сроки приемки работ и/или оплаты выполненных и принятых работ, предусмотренные Договором, более чем на 30 (тридцать) календарных дней;\n15.13.2. Застройщик нарушает сроки передачи Рабочей документации, предусмотренные Договором, более чем на 90 (девяносто) календарных дней;\n15.13.3. Наступление процесса ликвидации Застройщика, исключающей правопреемство;\n15.13.4. Признание Застройщика в порядке, установленном законодательством РФ, несостоятельным (банкротом).\n\n16.ОБСТОЯТЕЛЬСТВА НЕПРЕОДОЛИМОЙ СИЛЫ (ФОРС-МАЖОР)\n16.1. Стороны освобождаются от ответственности за частичное или полное неисполнение своих обязательств по Договору, если это неисполнение явилось следствием обстоятельств непреодолимой силы, возникших после заключения Договора, в результате событий чрезвычайного характера, а именно: наводнение, пожар, землетрясение, военные действия, военное положение, акты и действия государственных органов, делающие невозможным исполнение обязательств по Договору, которые Стороны не могли предвидеть или предотвратить доступными мерами и если эти обстоятельства непосредственно повлияли на исполнение Договора. Срок исполнения обязательств изменяется, но не более чем на срок, в течение которого действовали обстоятельства непреодолимой силы, а также последствия, вызванные этими обстоятельствами.\n16.2. При наступлении указанных обстоятельств Сторона, для которой создалась невозможность исполнения обязательств по Договору обязана в течение 72 часов с момента наступления указанных в п.16.1. обстоятельств известить об этом другую Сторону. Извещение должно содержать данные о характере обстоятельств и оценку их влияния на неисполнение Стороной своих обязательств по Договору и предполагаемый срок выполнения обязательств. \n16.3. Неуведомление или ненадлежащее уведомление лишает Сторону права ссылаться на обстоятельства непреодолимой силы, как на обстоятельства, исключающие ответственность за неисполнение своих обязательств по Договору. Наличие и продолжительность обстоятельств непреодолимой силы должны подтверждаться документом, выданным соответствующим компетентным органом. \n16.4. По прекращении указанных в п. 16.1 Договора обстоятельств, Сторона по возможности должна в течение 24 (Двадцати четырех) часов известить об этом другую Сторону в письменном виде. В извещении должен быть указан срок, в который предполагается исполнить обязательства по Договору.\n16.5. В случае, когда такие обстоятельства и их последствия продолжают действовать более 6 (шести) месяцев, Стороны обязуются провести переговоры относительно возможности дальнейшего исполнения Договора.\n16.6. В случае принятия органами государственной власти и управления РФ, и субъекта РФ актов о временном приостановлении выполнении строительно-монтажных работ на территории г. Москвы, Генподрядчик направляет в адрес Застройщика соответствующее уведомление, при это Генподрядчик имеет право на соразмерное продление сроков выполнения Работ по Договору, Просрочка за нарушение сроков в указанный период не начисляется.\n16.7. Стороны согласны, что ограничительные меры, введенные Правительством РФ, местными органами власти и управления в связи с частичной мобилизацией, специальной военной операцией на дату заключения Договора, не рассматриваются Сторонами как обстоятельства непреодолимой силы и не влияют на способность каждой из Сторон выполнять надлежащим образом свои обязательства по Договору.\n\n17.\tОТВЕТСТВЕННОСТЬ СТОРОН\n17.1. Стороны несут взаимную ответственность за неисполнение или ненадлежащее исполнение своих обязательств по Договору в соответствии с условиями Договора и законодательством РФ.\n17.2. При задержке платежей более чем на 30 (тридцать) календарных дней против сроков, определенных Договором, Генподрядчик вправе взыскать с Застройщика неустойку в размере 0,1% (Ноль целых одна десятая процента) от несвоевременно оплаченной суммы за каждый день Просрочки, но не более 10% (Десяти процентов) от суммы задолженности. Положения настоящего пункта не применяются к Просрочке осуществления Застройщиком авансовых платежей.\n17.3. За нарушение обязательств по Договору Застройщик вправе требовать с Генподрядчика уплаты неустоек и штрафов, максимальный размер которых Стороны установили в размере 100 000 000 (сто миллионов) рублей, в следующем порядке:\n17.3.1. За нарушение сроков достижения Ключевого события (кроме получения ЗОС) более чем на 30 (тридцать) дней против сроков, установленных Графиком строительства, неустойку в размере 100 000 (сто тысяч) рублей за каждый день Просрочки.\nВ случае нарушение сроков выполнения работ по нескольким видам работ, входящим в разные Комплексы работ, неустойка рассчитывается за периоды Просрочки соответствующих видов работ по каждому Комплексу. \nВ случае нарушения сроков выполнения работ по нескольким видам работ, входящим в один Комплекс работ, неустойка рассчитывается за период Просрочки вида работ с наибольшей Просрочкой от стоимости Комплекса работ. \nВ случае нарушения сроков работ по устранению недостатков или дефектов, выявленных в ходе приемки законченного строительства, Застройщик вправе требовать с Генподрядчика уплаты неустойки только в случае подписания Сторонами в срок акта с замечаниями или подписанием Застройщиком в срок одностороннего акта. В таком случае, нарушение срока работ по устранению недостатков или дефектов начинает исчисляться с момента подписания такого акта. \n17.3.2. За нарушение срока получения ЗОС, при условии исполнения Застройщиком всех предусмотренных Договором обязательств, необходимых для надлежащего исполнения Генподрядчиком своих обязанностей по его получению, неустойку в размере 300 000 (триста тысяч) рублей за каждый день Просрочки. \n17.3.3. Стороны договорились, что Застройщик вправе применить к Генподрядчику неустойку в порядке, указанном в пункте 17.3.1. Договора, или в порядке, указанном в пункте 17.3.2. Договора, по своему усмотрению.\nВ случае если Застройщиком с Генподрядчика была фактически взыскана (получена) неустойка за нарушение сроков достижения Ключевого события в соответствии с п. 17.3.1. Договора, Застройщик вправе требовать с Генподрядчика неустойку за нарушение сроков получения ЗОС или конечного срока выполнения работ по Договору в порядке, установленном в пункте 17.3.2. Договора, но с зачетом всех сумм неустоек, фактически взысканных (полученных) Застройщиком с Генподрядчика в порядке ст. 17.3.1. Договора.  \n17.3.4. В случае выявления факта нарушения Генподрядчиком требований, установленных в Приложении № 5 к Договору «Ответственность Генподрядчика за нарушение требований по безопасности строительства, культуре производства и охране труда», представителем Застройщика выдается предписание об устранении Генподрядчиком соответствующих нарушений с указанием срока устранения. В случае неисполнения в установленный срок Генподрядчиком выданного предписания Застройщик вправе взыскать с Генподрядчика неустойку (штраф) за каждый случай нарушения, размер неустойки (штрафа) определен в Приложении № 5 к Договору. При применении условий данного пункта Застройщик обязуется действовать добросовестно и разумно, не злоупотреблять правом.\n17.3.5. В случае если по результатам подготовки технических планов помещений будет установлено, что фактическая общая площадь каких-либо помещений в составе Объекта: \n- меньше соответствующей площади, предусмотренной Проектной документацией, Застройщик вправе взыскать с Генподрядчика неустойку (штраф), рассчитанную как произведение 100 000 (сто тысяч) рублей за квадратный метр и разницы в квадратных метрах между предусмотренной общей площадью таких помещений Проектной документацией в составе Объекта, и соответствующей площадью помещений, указанной в  техническом плане, а кроме того потребовать возмещения причиненных убытков, включая расходы на корректировку Проектной документации в целях приведения в соответствие с фактическими площадями, а также на получение положительного заключения экспертизы откорректированной Проектной документации.\n- больше соответствующей площади, предусмотренной Проектной документацией, Генподрядчик вправе взыскать с Застройщика неустойку (штраф), рассчитанную как произведение 100 000 (сто тысяч) рублей за квадратный метр и разницы в квадратных метрах между предусмотренной общей площадью таких помещений, указанной в техническом плане. При этом расходы на корректировку Проектной документации в целях приведения в соответствие с фактическими площадями, а также на получение положительного заключения экспертизы откорректированной Проектной документации оплачиваются Застройщиком. \nСтороны пришли к соглашению, что условия настоящего пункта Договора применяются при следующих отклонениях:\n- более 0,5 кв. м. при общей площади помещения.\n17.4. Стороны соглашаются, что размер убытков, подлежащих возмещению в случаях, предусмотренных настоящим Договором, ограничивается в каждом случае размером реального ущерба, а упущенная выгода возмещению не подлежит.\n17.4.1. Генподрядчик возмещает Застройщику убытки в виде уплаты/возмещения сумм штрафов или иных денежных санкций, назначенных Застройщику, Техническому Заказчику, или их должностным лицам, государственными органами, органами местного самоуправления, осуществляющими государственный (муниципальный) контроль (надзор), в том числе органами Федеральной миграционной службы России, Мосгосстройнадзором, ОАТИ г. Москвы, если такие санкции связанны с действиями Генподрядчика либо привлеченных им подрядчиков.\n17.4.2.  Генподрядчик возмещает Застройщику убытки в виде компенсаций, неустоек, штрафов, которые будут взысканы с Застройщика по решению суда или выплачены по мировому соглашению в пользу участников долевого устроительства и/или третьих лиц, заключивших соответствующий договор с Застройщиком, за недостатки или дефекты в приобретенных помещениях в Объекте или за Просрочку устранения недостатков/дефектов в период гарантийных обязательств, если такие недостатки и дефекты имелись в работах, выполненных Генподрядчиком по Договору.\nЗастройщик обязуется предпринимать все необходимые действия для минимизации убытков, а также уведомлять Генподрядчика о судебных процессах, по результатам которых с Генподрядчика могут быть взысканы убытки.\n17.5. Каждая из Сторон обязана оплатить предусмотренные разделом 17 Договором денежные средства в качестве меры ответственности по Договору не позднее 10 (Десяти) рабочих дней с даты получения соответствующего письменного требования другой Стороны.\n17.6. Выплата неустоек (штрафов), предусмотренных Договоров, не освобождает виновную Сторону от возмещения другой Стороне реального ущерба, возникшего вследствие нарушения условий Договора.\n17.7. В случае досрочного расторжения Договора Генподрядчик несет ответственность за качество работ, выполненных и принятых в установленном порядке до момента расторжения Договора.\n17.8. Нарушение требований проектной документации, технических регламентов, обязательных требований стандартов, строительных норм и правил, других нормативных документов в области строительства при выполнении Работ по Договору и др. влечет наложение на Генподрядчика административной ответственности в соответствии с Кодексом РФ об административных правонарушениях.\n17.9. В случае неисполнения либо ненадлежащего исполнения Генподрядчиком принятых на себя в соответствии с Договором обязательств Застройщик вправе в соответствии со ст. 55.14 Градостроительного кодекса Российской Федерации направить официальное обращение в саморегулируемую организацию, членом которой является Генподрядчик, о необходимости применения в отношении Генподрядчика мер ответственности, предусмотренных ст. 55.15 Градостроительного кодекса Российской Федерации.\n17.10. Застройщик не несет ответственности за убытки Генподрядчика (Субподрядчика), возникающие в результате его хозяйственной деятельности, кроме случаев, когда такие убытки вызваны действием/бездействием Застройщика.\n17.11. В случае если при выполнении работ по Договору Генподрядчик либо привлеченные им субподрядчики причинили ущерб (убытки) имуществу третьих лиц, Генподрядчик обязан самостоятельно возместить причиненный третьим лицам ущерб (убытки), а в случае взыскания третьими лицами сумм ущерба (убытков) с Застройщика – возместить Застройщику взысканные суммы в течение десяти рабочих дней с даты получения соответствующего письменного требования Застройщика с приложением документов, подтверждающих взыскание денежных средств.\n17.12. Застройщик вправе в одностороннем порядке зачесть любую причитающуюся ему к выплате Генподрядчиком сумму из сумм, подлежащих выплате Генподрядчику согласно условиям Договора, с предварительным письменным уведомлением об этом Генподрядчика.\n17.13. В случае выполнения Генподрядчиком работ с отступлением от утвержденной Застройщиком Проектной, Рабочей документации, либо по неутвержденной Застройщиком Проектной, Рабочей документации, либо по несогласованной в установленном порядке Проектной, Рабочей документации, Генподрядчик обязан безвозмездно выполнить работы заново с возмещением Застройщику документально подтвержденных убытков в размере реального ущерба, причиненных Просрочкой исполнения обязательств.\n17.14. Генподрядчик заверяет и гарантирует Застройщику, в порядке ст. 431.2 ГК РФ о нижеследующем:\n17.14.1. Генподрядчиком уплачиваются все налоги и сборы в соответствии с действующим законодательством РФ, а также им ведется и своевременно подается в налоговые и иные государственные органы налоговая, статистическая и иная государственная отчетность в соответствии с действующим законодательством РФ; \n17.14.2. Все операции Генподрядчика по покупке строительных материалов и иного оборудования у своих поставщиков, поставке материалов и/или оборудования на Объект, оплата выполненных работ субподрядчиков, выполнение и оплата работ по Договору полностью отражены в первичной документации Генподрядчика, в бухгалтерской, налоговой, статистической и любой иной отчетности, обязанность по ведению которой возлагается на Генподрядчика.\nГенподрядчик не допускает искажения сведений о фактах хозяйственной жизни (совокупности таких фактов) и объектах налогообложения в первичных документах, бухгалтерском и налоговом учете, в бухгалтерской и налоговой отчетности, а также не отражает в бухгалтерском и налоговом учете, в бухгалтерской и налоговой отчетности факты хозяйственной жизни выборочно, игнорируя те из них, которые непосредственно не связаны с получением налоговой выгоды;\n17.14.3. Генподрядчик гарантирует и обязуется отражать в налоговой отчетности налог на добавленную стоимость (НДС), уплаченный Застройщиком Генподрядчику в составе цены стоимость работ по Договору; \n17.14.4. Генподрядчик зарегистрирован в ЕГРЮЛ надлежащим образом, исполнительный орган находится и осуществляет функции управления по месту регистрации юридического лица, и в нем нет дисквалифицированных лиц, лица, подписывающие от его имени первичные документы и счета-фактуры, имеют на это все необходимые полномочия и доверенности.\n17.14.5. Генподрядчик располагает персоналом, имуществом и материальными ресурсами, необходимыми для выполнения своих обязательств по Договору, а в случае привлечения иных организаций (соисполнителей, субподрядчиков и иных лиц) принимает все меры должной осмотрительности, чтобы такие организации соответствовали данному требованию.\n\n18.\tПОРЯДОК РАССМОТРЕНИЯ СПОРОВ\n18.1. Спорные вопросы, возникающие в ходе исполнения Договора, разрешаются Сторонами путем ведения переговоров, достигнутые договоренности фиксируются дополнительным соглашением Сторон, а в случае недостижения согласия спор передается на рассмотрение Арбитражного суда города Москвы в установленном порядке.\n18.2. При возникновении между Застройщиком и Генподрядчиком спора по поводу недостатков выполненной работы или их причин, а также невозможности урегулирования этого спора переговорами, может быть назначена независимая экспертиза. Расходы на экспертизу несет сторона, потребовавшая ее назначения, а если она назначена по соглашению Застройщика и Генподрядчика – обе стороны поровну.\n18.3. Договор предусматривает обязательный досудебный претензионный порядок урегулирования споров и разногласий между Сторонами. Письменная претензия направляется по адресу соответствующей Стороны, указанному в Договоре. Срок рассмотрения и ответа на претензию – 10 (десять) рабочих дней с момента получения соответствующего письменного требования Стороной-получателем.\n\n19.\tПРОЧИЕ УСЛОВИЯ\n19.1. Договор вступает в силу с момента его подписания Сторонами, применяется к отношениям между Сторонами, возникшим с 02 апреля 2024 года, и действует до исполнения всех обязательств по Договору и окончания гарантийных обязательств.\n19.2. Стороны пришли к соглашению о том, что:\n- Стороны не вправе уступать права (требования) и/или обязанности (перевод долга) по Договору без предварительного письменного согласия другой Стороны;\n-\tЗастройщик обязуется не передавать права и обязанности по Договору третьим лицам без предварительного письменного согласия Банка.\n19.3. Проектная документация на строительство Объекта не может быть использована Генподрядчиком в иных целях, кроме определенных Договором.\n19.4. Стороны обязуются не разглашать, не передавать и не делать каким-либо еще способом доступными третьим лицам сведения, содержащиеся в документах, оформляющих взаимодействие Сторон в рамках Договора, иначе как с письменного согласия Сторон, кроме случаев, когда такое разглашение и передача необходимы для выполнения Сторонами своих обязательств по Договору, и случаев, предусмотренных законодательством РФ. \nСтороны обязуются соблюдать конфиденциальность в отношении условий Договора, получаемой информации по Договору, если иное не требуется для выполнения работ по Договору.\nС переданной информацией могут быть ознакомлены лишь те лица из числа работников Сторон, которые непосредственно связаны с проведением работ по Договору.\nГенподрядчик выражает свое согласие на раскрытие Застройщиком конфиденциальной информации сотрудникам Банка для целей заключения с Банком соглашений в рамках осуществления проектного финансирования строительства Объекта и дальнейшей работы по таким соглашениям. Стороны обязуются предоставлять Банку информацию, необходимую для выполнения обязательств Застройщика в рамках Кредитного договора.\n19.5. Любая договоренность между Сторонами, изменяющая условия Договора или влекущая за собой новые обязательства, не предусмотренные Договором, считается действительной, если она подтверждена Сторонами в письменной форме в виде дополнительного соглашения к Договору, при условии получения предварительного письменного согласия Банка.\n19.6. При изменении законодательства, строительных норм и правил, а также других нормативных документов, ссылка на которые зафиксирована в тексте Договора, считаются действующими вновь принятые документы с момента ввода их в действие.\n19.7. Стороны обязуются предоставить друг другу следующие документы:\n19.7.1. Заверенные печатью организации копии: устава, свидетельства о государственной регистрации юридического лица, информационного письма об учете в ЕГРПО, выписки о членстве в СРО, свидетельство о постановке юридического лица на учет в налоговом органе.\n19.7.2. Заверенную печатью организации копию протокола (или выписки из протокола) о назначении руководителя (либо доверенности, дающей конкретному лицу право подписи Договора).\n19.7.3. Заверенную печатью организации копию выписки из Единого государственного реестра юридических лиц (ЕГРЮЛ), выданной налоговым органом не позднее одного месяца с даты заключения Договора.\n19.7.4. Стороны заверяют и гарантируют друг другу, что Сторонами получены все необходимые внутренние корпоративные одобрения, если таковые требуются, в связи с заключением настоящего Договора, представители Сторон, подписывающие настоящий Договор, были надлежащим образом уполномочены на его заключение;\nОригиналы документов каждой Стороны об одобрении заключения Договора, если такое одобрение требуется, Стороны обязуются передать друг другу в течение 10 (Десяти) рабочих дней с даты подписания Договора. \n19.8. Все юридически значимые сообщения и заявления Сторон друг к другу связанные с исполнением Договора, вручаются одной Стороной другой Стороне нарочным либо направляются по соответствующим почтовым адресам, указанным в ст. 21 Договора, почтовым отправлением в виде телеграммы либо ценным письмом с описью вложения.\n19.8.1. Стороны подтверждают, что переписка и иные уведомления, связанные с исполнением Сторонами своих обязательств по настоящему Договору (за исключением юридически значимых сообщений и заявлений согласно п. 19.8. Договора) могут направляться с использованием электронных средств связи (электронные сообщения). \nСообщения направляются по следующим адресам электронной почты:  \nа) в адрес Застройщика: n.kholopova@octobergroup.ru, a.tyutchenko@octobergroup.ru, malovik@octobergroup.ru;  \nб) в адрес Генподрядчика: su10@su10.ru, baranskiy.S.S@mstroy.pro;\nПроекты документов, а также скан-копии документов, могут быть предварительно направлены по электронной почте, с адресов электронной почты, указанных выше.  \nОригинал отправленных по электронной почте подписанных скан-копий документов Стороны обязуются передавать друг другу не позднее 10 (десяти) рабочих дней с даты отправки скан-копии документа. \n19.9. Стороны пришли к соглашению, что, если законодательством РФ прямо не предусмотрено иное, почтовое отправление, отправленное Почтой России, считается полученным другой Стороной по истечении одного рабочего дня с даты поступления почтового отправления в отделение связи по месту нахождения Стороны-получателя. \n19.10. Стороны обязуются письменно уведомлять друг другу о всяком изменении своего адреса, банковских и иных реквизитов в течение 3 (Трех) рабочих дней со дня вступления в силу указанных изменений.\n19.11. Стороны подписанием Договора подтверждают, что в соответствии с требованиями ст. 13.3. Федерального закона от 25.12.2008 № 273-ФЗ «О противодействии коррупции» принимают все возможные меры по предупреждению коррупции, в том числе при исполнении Договора. При исполнении своих обязательств по настоящему Договору Стороны, их аффилированные лица, работники или посредники (в случае наличия таковых) не выплачивают, не предлагают выплатить и не разрешают выплату каких-либо денежных средств или ценностей, прямо или косвенно, любым лицам для оказания влияния на действия или решения этих лиц с целью получить какие-либо неправомерные преимущества или достичь иные неправомерные цели.\nСтороны отказываются от стимулирования каким-либо образом работников друг друга, в том числе путем предоставления денежных сумм, подарков, безвозмездного выполнения в их адрес работ (услуг) и другими, не поименованными здесь способами, ставящими работника в определенную зависимость и направленным на обеспечение выполнения этим работником каких-либо действий в пользу стимулирующей его стороны.\nВ случае возникновения у одной из Сторон подозрений, что произошло или может произойти нарушение каких-либо положений настоящего пункта, указанная Сторона обязуется уведомить другую Сторону в письменной форме. В письменном уведомлении Сторона обязана сослаться на факты и/или предоставить материалы, достоверно подтверждающие или дающие основание предполагать, что произошло или может произойти нарушение каких-либо положений настоящего пункта любой из Сторон, аффилированными лицами, работниками или посредниками. Сторона, нарушившая обязательства по соблюдению требований, предусмотренных настоящим пунктом, несёт ответственность, установленную законодательством Российской Федерации и Договором.\n19.12. Договор составлен в двух экземплярах, имеющих одинаковую юридическую силу, по одному для каждой из Сторон.\n20. ПРИЛОЖЕНИЯ\nПосле подписания Сторонами считать неотъемлемой частью Договора следующие приложения:\n20.1. Приложение № 1 - График строительства.\n20.2. Приложение № 2 - Ведомость договорной цены. Ведомость объемов и материалов.\n\tПриложение № 2.1 - Укрупнённая ведомость договорной цены.\n20.3. Приложение № 3 - Техническое задание.\n20.4. Приложение № 4 - Образец акта по форме КС-2 и справки по форме КС-3.\n20.5. Приложение № 5 - форма Итогового акта (Акта №3) \n20.6. Приложение № 6 - Перечень материалов и оборудования.\n20.7. Приложение № 7 - Положение об организации и обеспечении охраны и пропускного режима на Объекте.\n20.8. Приложение № 8 - Сроки устранения дефектов по типовым обращениям.\n20.9. Приложение № 9 - Ответственность Генподрядчика за нарушение требований по безопасности строительства, культуре производства и охране труда. \n20.10. Приложение № 10 – Производственная программа. Форма еженедельного отчета\n20.11. Приложение № 11 – Техническое задание на выполнение комплекса работ по организации штаба строительства Застройщика/Технического заказчика (на выполнение комплекса работ по организации бытовыми помещениями).\n20.12. Приложение № 12 - Перечень допустимых производителей (Вендор-лист).\n20.13. Приложение № 13 - Техническое задание на выполнение комплекса работ по изготовлению оконных и дверных блоков из алюминиевого профиля.\n20.14. Приложение № 14 – Техническое задание на выполнение комплекса работ по устройству демонстрационного фрагмента фасада (МОКАП). \n20.15. Приложение № 15 Техническое задание на выполнение комплекса работ по устройству демонстрационного фрагмента отделки типового этажа (МОКАП).\n20.16. Приложение № 16 Техническое задание на выполнение комплекса работ по устройству демонстрационного фрагмента отделки лобби (МОКАП).\n20.17. Приложение № 17 Техническое задание на выполнение комплекса работ по устройству демонстрационного фрагмента отделки 15 этажа (МОКАП).\n20.18. Приложение № 18 Техническое задание на выполнение комплекса работ по устройству демонстрационного фрагмента отделки подземного паркинга (МОКАП).\n20.19. Приложение № 19 График выдачи рабочей документации.\n20.20. Приложение № 20 Форма Чек-листа.\n\n21. РЕКВИЗИТЫ, ПОДПИСИ И ПЕЧАТИ СТОРОН	\N	\N	2025-10-30 12:05:59.012814+00
b808e34f-93a4-42b3-8030-8eab63eabfd5	7682cfc0-7d6a-4026-8ce0-47d4da0c87de	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	assistant	### Анализ права Генподрядчика на сдвиг сроков ключевых событий при задержках в выдаче рабочей документации\n\nНа основе предоставленного текста Договора № 05/2024-КС (генподряд на строительство), я проанализировал релевантные положения. Договор регулирует сроки выполнения работ, включая ключевые события (определены в п. 1.34 и п. 3.2 как этапы производства работ с фиксированными датами начала и окончания, указанными в Приложении №1 — График строительства). Рабочая документация (РД) выдаётся Застройщиком по Графику выдачи РД (Приложение №19, п. 1.17, п. 2.1, п. 3.1, п. 4.18.2, п. 8.4.3).\n\n**Краткий вывод:** Да, Генподрядчик имеет право на **сдвиг (продление) сроков ключевых событий** в случае **существенных задержек** в выдаче РД, но только при выполнении строгих условий договора. "Существенные задержки" в договоре трактуются как просрочка более 30 календарных дней (п. 15.2.1). Это не автоматическое право — требуется уведомление Застройщика, и сдвиг возможен только в части, напрямую зависящей от РД. Застройщик несёт ответственность за своевременную выдачу РД (п. 4.18.2, п. 8.4.3), но может требовать обоснования от Генподрядчика. Если задержка меньше 30 дней или по вине Генподрядчика, право на сдвиг отсутствует, и применяются неустойки (раздел 17).\n\n#### Основные договорные положения, подтверждающие право на сдвиг\n1. **Определение сроков и зависимость от РД (разделы 2 и 3):**\n   - Работы выполняются "в соответствии с ... Графиком выдачи Рабочей документации" (п. 2.1). РД является основой для производства работ по этапам (п. 4.18.2: Застройщик передаёт РД "в соответствии с Графиком выдачи РД"; п. 1.13: РД — основание для работ и ввода в эксплуатацию).\n   - Ключевые события (например, монолитные работы, устройство фасада, инженерные системы — п. 3.2) привязаны к общему Графику строительства, но фактически зависят от timely выдачи РД. Если РД не выдана, Генподрядчик не может начать или завершить этап (п. 8.2.1: Генподрядчик обязан разработать ППР на основе РД; п. 8.2.26: согласование с Застройщиком).\n   - Фактическая дата ключевого события фиксируется актом (п. 3.2). Если задержка РД препятствует этому, акт не подписывается, что открывает путь к корректировке.\n\n2. **Право на приостановку работ и продление сроков (п. 15.2 — основное положение):**\n   - **П. 15.2.1:** Основанием для приостановки работ со стороны Генподрядчика и **продления сроков выполнения работ по Договору** является "Просрочка исполнения обязательств по передаче Застройщиком Рабочей документации в объеме, необходимом для выполнения своевременного выполнения работ, более чем на 30 (тридцать) календарных дней совокупно по всем разделам Проектной документации."\n     - Это напрямую позволяет сдвигать сроки ключевых событий (как часть общих сроков по п. 3.1–3.3), если задержка РД >30 дней и она влияет на этапы.\n     - "Существенные задержки" = >30 дней совокупно (не по отдельным разделам, а в целом). Если задержка меньше — права на автоматический сдвиг нет.\n   - **Порядок реализации:** Генподрядчик должен письменно уведомить Застройщика о задержке и приостановке (п. 8.2.27: уведомление в 1 день при обнаружении обстоятельств, угрожающих срокам; п. 19.8 — форма уведомлений). Стороны корректируют График строительства дополнительным соглашением (п. 19.5).\n   - Продление соразмерно задержке (не более, чем на период задержки РД; аналогично форс-мажору в п. 16.1).\n\n3. **Изменения в документации и сроки (разделы 4, 8, 12):**\n   - Застройщик несёт ответственность за качество и timely выдачу РД (п. 4.18.1–4.18.2). Генподрядчик может направить замечания на этапе согласования (п. 4.18.2).\n   - Если задержка РД приводит к необходимости изменений, Генподрядчик уведомляет Застройщика (п. 8.2.27: в 5 дней о дополнительных работах; п. 12.4: Застройщик предупреждает о изменениях за 60 дней, иначе компенсирует расходы).\n   - Сдвиг возможен через дополнительное соглашение (п. 8.1.2: Генподрядчик вносит предложения по оптимизации/корректировке; п. 10.6: Застройщик уведомляет о отступлениях, Генподрядчик корректирует сроки без ущерба общему графику).\n   - Приоритет документов: Проектная документация > ТЗ > РД (п. 4.18.2.1–4.18.2.3), но задержка РД не отменяет зависимость этапов от неё.\n\n4. **Ответственность и последствия (раздел 17):**\n   - Если сдвиг не обоснован (задержка РД <30 дней или по вине Генподрядчика), применяются неустойки: 100 000 руб./день за просрочку ключевого события >30 дней (п. 17.3.1); 300 000 руб./день за ЗОС (п. 17.3.2).\n   - Но если задержка по вине Застройщика (РД), неустойки не начисляются (п. 17.3: только при исполнении Застройщиком обязательств). Генподрядчик может требовать неустойку за просрочку платежей (п. 17.2), но не напрямую за РД — вместо этого продление (п. 15.2).\n   - Убытки: Застройщик компенсирует "фактические документально подтвержденные расходы" при нарушениях (п. 12.4), включая неиспользованные материалы из-за задержки РД.\n\n#### Условия, при которых право реализуется\n- **Минимальный порог задержки:** >30 дней совокупно по всем разделам РД (п. 15.2.1). Если задержка "существенная" (по смыслу вопроса), но <30 дней — Генподрядчик обязан продолжать работы на основе имеющейся документации (п. 4.19: ознакомлен с исходной ПД на момент заключения) и нести риски просрочки.\n- **Необходимость обоснования:** Задержка должна быть "в объеме, необходимом для выполнения работ" (п. 15.2.1). Генподрядчик фиксирует влияние на ключевые события (например, через еженедельные отчёты, п. 8.2.34).\n- **Процедура:**\n  1. Уведомить Застройщика письменно (п. 8.2.27, п. 19.8).\n  2. Приостановить работы по affected этапам.\n  3. Согласовать корректировку Графика строительства (доп. соглашение, п. 19.5; одобрение Банка, п. 1.8).\n  4. Фиксировать актами (п. 3.2).\n- **Ограничения:** \n  - Не влияет на сроки, не зависящие от РД (например, подготовительные работы).\n  - Если Генподрядчик не уведомил timely, теряет право (аналогично форс-мажору, п. 16.3).\n  - Застройщик может оспорить, если задержка не "существенная" (претензионный порядок, п. 18.3).\n\n#### Рекомендации\n- Генподрядчику: Фиксируйте задержки РД актами/отчётами (п. 8.2.34, Приложение №10). Требуйте доп. соглашения для формального сдвига.\n- Если спор: Досудебный порядок (п. 18.3: претензия, 10 дней на ответ), затем Арбитражный суд Москвы (п. 18.1).\n- Договор жёсткий в пользу Застройщика (фиксированная цена, п. 5.4; риски на Генподрядчике, п. 4.17), но п. 15.2 балансирует за счёт продления при задержках РД.\n\nЕсли нужны уточнения по конкретным ключевым событиям или приложениям (например, График выдачи РД), предоставьте дополнительный текст.	\N	\N	2025-10-30 12:06:14.99211+00
22632c3d-f647-4112-82e1-942247d33ece	1cb201c2-d7c5-4acd-9a6a-a2af1e4f62ec	d8c1330a-ae1a-407a-ad2c-897ab85102dd	user	Напиши мне технологический стек для реализации корпоративного чата с api  openai и Rag. Распиши подробно реализацию	\N	\N	2025-10-30 12:40:59.931064+00
485ab0e5-2a5a-44d6-8190-d736dfea39cf	1cb201c2-d7c5-4acd-9a6a-a2af1e4f62ec	d8c1330a-ae1a-407a-ad2c-897ab85102dd	assistant	Отличная задача! Создание корпоративного чата с RAG (Retrieval-Augmented Generation) на базе OpenAI — это мощное решение для управления внутренними знаниями компании.\n\nДавайте подробно разберем технологический стек и этапы реализации.\n\n### **Краткий Обзор Архитектуры**\n\nМы создаем систему, состоящую из трех основных частей:\n1.  **Чат-приложение (Frontend + Backend):** Стандартный корпоративный мессенджер с каналами, личными сообщениями, аутентификацией.\n2.  **Система Индексации Знаний (Offline-процесс):** Процесс, который читает корпоративные документы (из Confluence, Google Docs, PDF-файлов), разбивает их на части, векторизует и сохраняет в специальной векторной базе данных.\n3.  **RAG-компонент (API-endpoint):** "Мозг" системы. Когда пользователь задает вопрос AI-боту в чате, этот компонент находит релевантную информацию в векторной базе, формирует расширенный запрос к OpenAI и возвращает ответ, основанный на знаниях компании.\n\n---\n\n### **Технологический стек**\n\nВот рекомендуемый, современный и масштабируемый стек:\n\n#### **1. Frontend (Клиентская часть)**\n\n*   **Фреймворк:** **React.js** или **Vue.js**. React является industry-standard с огромной экосистемой.\n*   **UI-библиотека:** **Material-UI (MUI)** или **Tailwind CSS**. Tailwind дает больше гибкости и скорости в стилизации, MUI предоставляет готовые компоненты "из коробки".\n*   **Управление состоянием:** **Redux Toolkit** или **Zustand**. Zustand намного проще и отлично подходит для приложений среднего размера.\n*   **Real-time коммуникация:** **Socket.IO Client**. Для мгновенного обмена сообщениями.\n*   **Сборка:** **Vite**. Современный и очень быстрый сборщик проектов.\n\n#### **2. Backend (Серверная часть)**\n\n*   **Язык/Фреймворк:** **Python + FastAPI**. Идеальный выбор. Python — король AI/ML, а FastAPI — современный, асинхronный, быстрый веб-фреймворк с автоматической генерацией документации Swagger, что очень удобно для API.\n*   **Real-time коммуникация:** **python-socketio** + **Uvicorn** (ASGI-сервер). Для реализации веб-сокетов на стороне сервера.\n*   **Аутентификация:** **JWT (JSON Web Tokens)**. Стандарт для API. Библиотеки: `passlib` для хеширования паролей, `python-jose` для работы с JWT.\n*   **ORM (Работа с базой данных):** **SQLAlchemy** с **Alembic** для миграций.\n\n#### **3. Базы данных**\n\n*   **Основная база данных:** **PostgreSQL**. Надежная, мощная, open-source реляционная БД для хранения пользователей, сообщений, каналов и т.д.\n*   **Векторная база данных:** **Pinecone**, **Weaviate** или **ChromaDB**.\n    *   **Pinecone:** Управляемый сервис (SaaS). Очень быстрый и масштабируемый, но платный. Отличный выбор, чтобы быстро стартовать.\n    *   **Weaviate:** Open-source, можно развернуть самостоятельно (например, в Docker). Мощный, есть GraphQL API.\n    *   **ChromaDB:** Open-source, очень проста в настройке, может работать даже in-memory или на диске без отдельного сервера. Идеальна для PoC (Proof of Concept) и небольших проектов.\n\n#### **4. AI / RAG Компонент**\n\n*   **Оркестрация AI-пайплайна:** **LangChain** или **LlamaIndex**. Это MUST-HAVE. Эти фреймворки невероятно упрощают создание RAG-цепочек. LangChain более универсальный, LlamaIndex больше заточен именно под RAG. **Рекомендую LangChain**.\n*   **Модель для эмбеддингов (векторизации):** **OpenAI `text-embedding-3-small` / `large`** или open-source аналоги от Hugging Face (например, `sentence-transformers`). Модель OpenAI платная, но очень качественная.\n*   **LLM (Большая языковая модель):** **OpenAI GPT-4 aбо GPT-3.5-Turbo**. GPT-4 дает более качественные и продуманные ответы.\n*   **API:** OpenAI Python SDK (`openai`).\n\n#### **5. DevOps & Развертывание**\n\n*   **Контейнеризация:** **Docker** и **Docker Compose** (для локальной разработки и production).\n*   **CI/CD:** **GitHub Actions** или **GitLab CI**.\n*   **Развертывание:** **Облачная платформа (AWS, Google Cloud, Azure)**. Например, запуск контейнеров в AWS ECS или Kubernetes (EKS). PostgreSQL можно взять как управляемый сервис (AWS RDS).\n*   **Веб-сервер/Прокси:** **Nginx**. Для distribuzione статики, SSL-терминации и как reverse-proxy для Backend.\n\n---\n\n### **Архитектурная схема**\n\n```mermaid\ngraph TD\n    subgraph "Пользователь"\n        User[Клиент в браузере (React)]\n    end\n\n    subgraph "Cloud Infrastructure (e.g., AWS)"\n        Nginx[Nginx Reverse Proxy]\n\n        subgraph "Backend Services (Docker Containers)"\n            Backend[FastAPI Backend]\n            RAG_API[RAG API Endpoint]\n        end\n\n        subgraph "Data Stores"\n            Postgres[PostgreSQL]\n            VectorDB[Vector Database]\n        end\n\n        subgraph "External APIs"\n            OpenAI[OpenAI API]\n        end\n    end\n\n    User -- HTTPS --> Nginx\n    Nginx -- HTTP --> Backend\n\n    Backend -- CRUD --> Postgres[Сохранение/Чтение сообщений, пользователей]\n\n    %% Стандартный чат\n    User -- WebSocket --> Backend\n\n    %% RAG-запрос\n    User -- Запрос к @AI --> Backend\n    Backend -- Запрос на обработку --> RAG_API\n    RAG_API -- 1. Создать embedding запроса --> OpenAI\n    RAG_API -- 2. Поиск похожих векторов --> VectorDB[Поиск контекста по базе знаний]\n    VectorDB -- 3. Возвращает relevant chunks --> RAG_API\n    RAG_API -- 4. Формирует промпт (Контекст + Запрос) --> OpenAI[GPT-4]\n    OpenAI -- 5. Генерирует ответ --> RAG_API\n    RAG_API -- Возвращает ответ --> Backend\n    Backend -- Отправляет ответ в чат --> User\n\n    %% Offline индексация (не в реальном времени)\n    Indexer[Offline Indexing Script] -- Читает Документы --> Docs[Confluence, PDFs, etc.]\n    Indexer -- 1. Разбивает на чанки --> LangChain\n    LangChain -- 2. Векторизует чанки --> OpenAI[Embedding API]\n    LangChain -- 3. Сохраняет вектора и текст --> VectorDB\n```\n\n---\n\n### **Подробная реализация**\n\n#### **Этап 1: Настройка и базовый чат (MVP без AI)**\n\n1.  **Настройка проекта:**\n    *   Создайте монорепозиторий или два отдельных репозитория (frontend, backend).\n    *   Настройте `docker-compose.yml` для локального запуска `frontend`, `backend`, `postgres`, `nginx`.\n    *   В backend-проекте настройте виртуальное окружение Python, установите FastAPI, SQLAlchemy, python-socketio.\n\n2.  **Backend (FastAPI):**\n    *   **Модели данных (SQLAlchemy):** `User`, `Channel`, `Message`.\n    *   **Аутентификация:** Создайте эндпоинты `/register` и `/login`. При успешном логине возвращайте JWT-токен. Создайте middleware для защиты эндпоинтов.\n    *   **API чата:** CRUD-эндпоинты для каналов (`/channels`). Эндпоинт для получения истории сообщений в канале.\n    *   **WebSocket:** Настройте `Socket.IO` сервер. Логика: `connect` (аутентификация пользователя по токену), `disconnect`, `join_room` (присоединение к каналу), `leave_room`, `on_message` (обработка нового сообщения, сохранение в PostgreSQL и рассылка всем в "комнате").\n\n3.  **Frontend (React):**\n    *   Создайте страницы: `LoginPage`, `RegisterPage`, `ChatPage`.\n    *   Настройте роутинг.\n    *   Реализуйте логику аутентификации (сохранение токена в `localStorage`).\n    *   Создайте компоненты: `ChannelList`, `MessageList`, `MessageInput`.\n    *   В `ChatPage` установите WebSocket-соединение с сервером при загрузke и обрабатывайте события (получение новых сообщений, обновление списка пользователей).\n\n#### **Этап 2: Реализация RAG-пайплайна (Индексация)**\n\nЭто чаще всего offline-процесс, который вы запускаете периодически (например, раз в ночь).\n\n1.  **Создание скрипта индексации (indexing.py):**\n    *   Используйте `LangChain`. Он предоставляет готовые `DocumentLoaders`.\n    *   **Загрузка документов:**\n        *   `PDFLoader` для PDF-файлов.\n        *   `ConfluenceLoader` для страниц Confluence.\n        *   `GoogleDriveLoader` для документов из Google Drive.\n        *   Или напишите свой загрузчик для внутренних систем.\n    *   **Разбиение на чанки (Chunking):** Документы слишком велики для контекста LLM. Их нужно разбить на небольшие, логически связанные куски.\n        ```python\n        from langchain.text_splitter import RecursiveCharacterTextSplitter\n\n        text_splitter = RecursiveCharacterTextSplitter(chunk_size=1000, chunk_overlap=200)\n        chunks = text_splitter.split_documents(documents)\n        ```\n    *   **Векторизация и сохранение:**\n        *   Инициализиujte клієнт векторної БД (Pinecone, Weaviate) та модель ембеддингів.\n        *   В цикле пройдитесь по всем `chunks`, для каждого получите векторное представление (embedding) и сохраните его вместе с исходным текстом чанка и метаданными (например, ссылка на источник) в векторную базу данных.\n\n        ```python\n        from langchain_openai import OpenAIEmbeddings\n        from langchain_pinecone import Pinecone\n\n        embeddings = OpenAIEmbeddings(model="text-embedding-3-small")\n        # chunks - это список документов после сплиттера\n        # index_name - имя вашего индекса в Pinecone\n        vector_store = Pinecone.from_documents(chunks, embeddings, index_name="corporate-knowledge")\n        ```\n        LangChain делает этот процесс очень простым.\n\n#### **Этап 3: Интеграция AI-бота в чат**\n\n1.  **Создание RAG API-эндпоинта на Backend:**\n    *   Создайте новый эндпоинт, например, `POST /api/ai/query`.\n    *   Внутри этого эндпоинта реализуйте логику "вопрос-ответ".\n\n2.  **Логика RAG-ответа (с использованием LangChain):**\n    *   Когда пользователь в чате пишет `@AI Как оформить отпуск?`, frontend отправляет на этот эndpoint `{ "query": "Как оформить отпуск?" }`.\n    *   **Backend выполняет следующие шаги:**\n        1.  **Инициализация:** Подключитесь к векторной базе данных и инициализируйте LLM.\n        2.  **Создание Retriever:** Retriever — это объект LangChain, который умеет искать информацию в `vector_store`.\n            ```python\n            vector_store = Pinecone.from_existing_index("corporate-knowledge", embeddings)\n            retriever = vector_store.as_retriever(search_kwargs={"k": 5}) # Найти 5 наиболее релевантных чанков\n            ```\n        3.  **Создание Промпта:** Это самый важный шаг. Вы должны строго указать модели использовать только предоставленный контекст.\n            ```python\n            from langchain.prompts import PromptTemplate\n\n            template = """\n            Ты — полезный ассистент компании "N". Отвечай на вопрос пользователя, основываясь ИСКЛЮЧИТЕЛЬНО на предоставленном ниже контексте.\n            Если в контексте нет информации для ответа, прямо скажи: "К сожалению, в моей базе знаний нет информации по этому вопроsu".\n            Не придумывай ответы. Цитируй источник, если это возможно.\n\n            Контекст:\n            {context}\n\n            Вопрос:\n            {question}\n\n            Ответ:\n            """\n            prompt = PromptTemplate(template=template, input_variables=["context", "question"])\n            ```\n        4.  **Создание цепочки (Chain):** LangChain объединяет все шаги в единый объект.\n            ```python\n            from langchain_openai import ChatOpenAI\n            from langchain.chains import RetrievalQA\n\n            llm = ChatOpenAI(model_name="gpt-4", temperature=0)\n\n            qa_chain = RetrievalQA.from_chain_type(\n                llm=llm,\n                chain_type="stuff", # "stuff" - einfach alles in den Kontext packen\n                retriever=retriever,\n                chain_type_kwargs={"prompt": prompt},\n                return_source_documents=True # Чтобы вернуть источники\n            )\n            ```\n        5.  **Получение ответа:**\n            ```python\n            query = "Как оформить отпуск?"\n            result = qa_chain({"query": query})\n\n            answer = result["result"]\n            source_documents = result["source_documents"] # Здесь будут ссылки на источники\n\n            # Отправляем 'answer' и 'source_documents' обратно пользователю\n            ```\n\n3.  **Frontend-интеграция:**\n    *   Когда пользователь отправляет сообщение, начинающееся с `@AI`, вызовите API-эндпоинт `/api/ai/query`.\n    *   Отобразите индикатор загрузки, пока ждете ответа.\n    *   Получив ответ, отобразите его в чате особым образом: с иконкой бота, возможно, с блоком "Источники", где будут ссылки на корпоративные документы, откуда была взята информация.\n\nПоздравляю! Теперь у вас есть полнофункциональный корпоративный чат с AI-ассистентом, который отвечает на вопросы на основе вашей собственной базы знаний.	\N	\N	2025-10-30 12:42:07.446083+00
69c27bc9-82ab-4c30-96d3-6d1ce1e0fd53	6ab653a3-c823-49eb-a183-b86a4d8681a7	adea9c9c-2d73-45b4-a801-e576e0b57f74	user	Может ли авторский надзор делать изменения рабочей документации в журнале авторского надзора	\N	\N	2025-10-30 12:48:31.020972+00
747af103-aee5-4718-ac2d-3aa94db5ca6c	6ab653a3-c823-49eb-a183-b86a4d8681a7	adea9c9c-2d73-45b4-a801-e576e0b57f74	assistant	### Может ли авторский надзор вносить изменения в рабочую документацию через журнал авторского надзора?\n\nВ российском законодательстве (Градостроительный кодекс РФ, СП 48.13330.2011 "Организация строительства" и ГОСТ Р 21.1101-2013 "Система проектной документации для строительства") авторский надзор (АН) — это форма контроля со стороны разработчика проекта (архитектора, проектировщика или организации) за соответствием выполненных работ утвержденной проектной документации. Давайте разберем ваш вопрос шаг за шагом.\n\n#### 1. **Роль журнала авторского надзора**\n   - Журнал АН — это официальный документ (форма по приложению к СП 48.13330.2011), в который фиксируются:\n     - Результаты выездов/осмотров на объект.\n     - Выявленные расхождения между проектом и реализацией.\n     - Замечания, рекомендации и предложения по корректировке.\n     - Акты приемки этапов работ с учетом проекта.\n     - Подписи представителей заказчика, подрядчика и автора проекта.\n   - Журнал **не предназначен для прямого внесения изменений** в рабочую документацию (РД). Он служит для **фиксации и документирования** процесса надзора, а не для редактирования самой РД. Изменения вносятся не в журнал, а в оригинальные документы проекта.\n\n#### 2. **Возможность внесения изменений в рабочую документацию в рамках АН**\n   - **Да, авторский надзор может инициировать изменения**, но с определенными ограничениями и процедурами:\n     - В процессе АН автор проекта (или уполномоченное лицо) выявляет несоответствия (например, ошибки в чертежах, необходимость адаптации под реальные условия) и фиксирует их в журнале как **замечания или рекомендации**.\n     - На основе этих замечаний автор может **выпустить корректировки к рабочей документации** (дополнительные чертежи, спецификации, пояснительные записки). Это называется "корректировка проектной документации" (ст. 48 ГрК РФ).\n     - Корректировки должны быть:\n       - Согласованы с заказчиком и (при необходимости) с экспертизой (если изменения существенные, влияют на безопасность или превышают 5% стоимости).\n       - Подписаны автором проекта и внесены в обновленную версию РД.\n       - Зарегистрированы в журнале АН (как факт внесения изменений и их обоснование).\n     - Примеры изменений: уточнение размеров конструкций, замена материалов (если это не меняет концепцию проекта), адаптация под найденные геологические условия.\n   - **Важно**: Изменения **не могут быть внесены самостоятельно подрядчиком** без согласования с автором. Автор АН отвечает за то, чтобы любые отклонения не нарушали норм (СНиП, СП) и не создавали риски.\n\n#### 3. **Ограничения и ответственность**\n   - **Что нельзя делать в журнале АН**:\n     - Вносить прямые правки в чертежи или спецификации (это делается в РД).\n     - Игнорировать процедуру экспертизы или согласования для значимых изменений.\n   - **Ответственность**: Автор АН несет ответственность за качество надзора (ст. 52 ГрК РФ). Если изменения внесены неправильно, это может привести к отказу в вводе объекта в эксплуатацию, штрафам или судебным искам.\n   - **Обязательность АН**: Для большинства объектов капитального строительства АН обязателен (ст. 52 ГрК РФ), за исключением простых случаев (например, ИЖС до 3 этажей без экспертизы).\n\n#### 4. **Практические рекомендации**\n   - Если вы — автор проекта: Ведите журнал последовательно, фиксируйте все выезды (минимум 1–2 раза в месяц, в зависимости от этапа). Для изменений готовьте отдельные документы (например, "Корректировка №X к РД") и ссылайтесь на них в журнале.\n   - Если вы — заказчик или подрядчик: Требуйте от автора АН письменных подтверждений изменений перед их реализацией.\n   - Для уточнения: Обратитесь к конкретному договору подряда или проконсультируйтесь с юристом/экспертом по строительному праву, так как детали зависят от региона и типа объекта.\n\nЕсли у вас есть дополнительные детали (например, тип объекта или этап строительства), я могу дать более targeted ответ!	\N	\N	2025-10-30 12:48:42.016813+00
f75e0f9d-44fd-470b-8bee-17aa66ed39be	ffe86343-2893-43a2-8a96-6a2c4d99b7d1	adea9c9c-2d73-45b4-a801-e576e0b57f74	user	Может ли авторский надзор делать изменения рабочей документации в журнале авторского надзора	\N	\N	2025-10-30 12:51:00.248297+00
510430a1-7c2c-4723-8f86-bec6ee8bcf9d	ffe86343-2893-43a2-8a96-6a2c4d99b7d1	adea9c9c-2d73-45b4-a801-e576e0b57f74	assistant	Короткий ответ: нет — запись в журнале авторского надзора сама по себе не является официальным изменением рабочей проектной документации. Она может фиксировать замечание, указание или требование, но для внесения изменений в рабочую документацию требуется отдельная формальная процедура.\n\nПояснение и практика:\n- Журнал авторского надзора предназначен для фиксации контроля, замечаний, предписаний и согласований между автором (проектировщиком), подрядчиком и заказчиком. Запись в журнале — бумажное (или электронное) подтверждение переговоров/указаний.\n- Если замечание влечёт за собой изменение чертежей, спецификаций или смет, то такие изменения оформляются как корректировка рабочей документации: выпуск уточняющих листов/изменений (взамен или дополнение), внесение редакций в ведомости, разработка дополнительного проекта и т. п.\n- Формальное изменение документации обычно требует согласия заказчика (и/или генподрядчика), подписи ответственных лиц (проектировщик/главный инженер) и часто отражается в дополнительном соглашении к договору (если изменяются объемы/сроки/стоимость).\n- Для несущественных уточнений (конструктивные разъяснения, технологические указания), которые не меняют проект в целом, автор может дать указание через журнал; подрядчик может выполнить это по журнальной записи, но лучше оформить письменное распоряжение либо выдачу рабочих чертежей/пояснений.\n\nРекомендуемая процедура при необходимости изменить рабочую документацию:\n1. Автор фиксирует проблему и предлагает изменение (запись в журнале с предложением).\n2. Оформляется проектное изменение (лист изменения, доп. чертежи, пояснительная записка).\n3. Согласование с заказчиком (и при необходимости — с надзором, сметчиком).\n4. Подписи ответственных лиц и уведомление подрядчика; внесение изменений в экземпляры рабочей документации на стройплощадке.\n5. При изменении объёмов/стоимости — оформление доп. соглашения к договору и корректировка сметы/графика.\n\nПоследствия несоблюдения: выполнение работ по устным/журнальным указаниям без формализации может привести к спорам по оплате и качеству — подрядчик рискует выполнять работу за свой счёт, заказчик — получить несогласованное решение.\n\nЕсли нужно, могу:\n- Сформулировать типовую запись в журнале (текст для записи/уведомления).\n- Предложить шаблон оформления изменения рабочей документации и порядок согласования согласно договору.	\N	\N	2025-10-30 12:51:22.538886+00
facb73f3-49f2-4795-82d4-749bd8e05896	1551744a-b580-41a3-af69-3cd6acc19916	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	user	Имеет ли право генподрядчик согласно текста договора сдвигать сроки ключевых событий в случае существенных задержек в выдаче рабочей документации?\n\nДОГОВОР № 05/2024-КС\nгенерального подряда на строительство\nг. Москва \t\t\t\t\t\t\t\t\t\t02 мая 2024 года\n\nОбщество с ограниченной ответственностью «Специализированный застройщик» (ООО «СЗ»), именуемое в дальнейшем «Застройщик», в лице Генерального директора ИИИ, действующей на основании Устава, с одной стороны, и\nОбщество с ограниченной ответственностью «Строительное управление» (ООО «СУ»), именуемое в дальнейшем «Генподрядчик», в лице Генерального директора ТТТ, действующего на основании Устава, с другой стороны, совместно именуемые «Стороны» и каждая по отдельности – «Сторона», заключили между собой настоящий Договор (далее «Договор»), о нижеследующем \n\n1.\tТЕРМИНЫ И ОПРЕДЕЛЕНИЯ\n\tВ настоящем Договоре следующие термины будут иметь значения, определяемые настоящей статьей:\n1.1. «Объект» – Жилой комплекс, расположенный на Земельном участке, подключенный к городским инженерным коммуникациям, обеспеченный комплексом благоустройства, озеленения и малых форм, построенный Генподрядчиком в ходе реализации Договора в соответствии с Техническим заданием (Приложение №3 к Договору), Проектной и Рабочей документацией, выданной Застройщиком, и подготовленный к вводу в эксплуатацию. Идентификатор проекта: №90-128/КЛ-23.\n1.2. «Застройщик» – Общество с ограниченной ответственностью «Специализированный застройщик», заключившее договор строительного подряда с Генподрядчиком для строительства Объекта на Земельном участке.\n1.3. «Генподрядчик» – Общество с ограниченной ответственностью «Строительное управление» (ООО «СУ») являющееся членом саморегулируемой организации Ассоциации «Объединение профессиональных строителей РусСтрой, действующий на основании свидетельства о допуске к определенному виду или видам работ, которые оказывают влияние на безопасность объектов капитального строительства и выполняющее функции Генерального подрядчика по строительству Объекта на основании Договора, заключенного с Застройщиком.\n1.8. «Договор» – настоящий документ, подписанный Сторонами, включающий в себя текст Договора, приложения и все дополнительные соглашения, которые могут быть подписаны Сторонами в период его действия. Договор заключается между Застройщиком и Генподрядчиком и регулирует правоотношения Сторон. Однако Стороны учитывают, что финансирование Объекта осуществляется путем финансирования Банком и учитывают положения Кредитного договора. Все формы подписываемых документов, должны удовлетворять требования Банка и подлежат предварительному письменному согласованию с Банком. Взаимодействие с Банком по получению необходимых согласований осуществляет Застройщик. При этом получение либо не получение Застройщиком от Банка согласований не изменяют иные права Сторон, а также содержание и условия исполнения Сторонами своих иных обязательств.\n1.10. «Заключение о соответствии» («ЗОС») – заключение органа государственного строительного надзора (Комитета государственного строительного надзора города Москвы (Мосгостройнадзора), о соответствии построенного объекта капитального строительства требованиям технических регламентов и проектной документации, в том числе требованиям энергетической эффективности и требованиям оснащенности объекта капитального строительства приборами учета используемых энергетических ресурсов, оформленное в соответствии с положениями Градостроительных кодексов, распорядительных и нормативных документов Российской Федерации и города Москвы, и дающее право на получение Разрешения на ввод объекта в эксплуатацию.\n1.11. «Разрешение на ввод объекта в эксплуатацию» – документ, выданный органом государственного строительного надзора (Комитетом государственного строительного надзора города Москвы (Мосгостройнадзора), удостоверяющий выполнение строительства Объекта в полном объеме в соответствии с разрешением на строительство, соответствие построенного объекта капитального строительства градостроительному плану земельного участка и проектной документации, оформленный в соответствии с положениями Градостроительных кодексов, распорядительных и нормативных документов Российской Федерации и города Москвы.\n1.12. «Проектная документация» – документация, переданная Застройщиком, согласованная в установленном законодательством порядке, состоящая из текстовой и графической частей, выполненная в соответствии с требованиями нормативных актов в области проектирования и строительства в объеме необходимом для проведения Генподрядчиком работ по строительству Объекта, содержащая описание принятых архитектурных, инженерно-технических, функционально-технологических, конструктивных и иных решений в отношении Объекта, пояснения, результаты расчетов, обосновывающие принятые решения, ссылки на нормативные акты в области проектирования и строительства, а также документация в виде чертежей, схем, планов и других документов в графической форме, разработанная в соответствии с Постановлением Правительства Российской Федерации № 87 от 16.02.2008 г. «О составе разделов проектной документации и требованиях к их содержанию», требованиями Градостроительного кодекса РФ, СНиП, регламентов и других действующих нормативных актов Российской Федерации.\n1.13. «Рабочая документация» – разработанная на основе Проектной документации и состоящая из документов в текстовой и графической форме: рабочих чертежей, спецификаций оборудования и изделий, описаний, содержащих качественные и технические характеристики материалов, оборудования, конструкций, изделий, и являющаяся основанием для производства строительных и монтажных работ необходимых для производства Работ и ввода Объекта в эксплуатацию. В целях Договора Стороны относят Рабочую документацию как часть Проектной документации. \n1.14. «Исполнительная документация» – текстовые и графические материалы, отражающие фактическое исполнение проектных решений и фактическое положение объектов капитального строительства и их элементов в процессе строительства, реконструкции, капитального ремонта объектов капитального строительства по мере завершения определенных в проектной документации работ. Состав и порядок ведения исполнительной документации, предусмотрены Приказом Минстроя России от 16.05.2023 № 344/пр «Об утверждении состава и порядка ведения исполнительной документации при строительстве, реконструкции, капитальном ремонте объектов капитального строительства», регламентируется законодательством Российской Федерации.  \n1.15. «График строительства» - документ, являющийся приложением к Договору, устанавливающий график производства работ, промежуточные и окончательные сроки выполнения Работ, Ключевые события, являющийся Приложением №1 к Договору.\n1.16. «Ведомость договорной цены» - перечень Работ, выполняемых Генподрядчиком, их стоимость и затраты, ведомость объемов Работ и требуемых материалов, согласованные Сторонами в Приложении № 2 к Договору.\n1.17. «График выдачи Рабочей документации» - документ, являющийся приложением к Договору (Приложение № 19), устанавливающий график предоставления Застройщиком Рабочей документации, необходимый Генподрядчику для производства Работ соответствующего этапа.\n1.18. «Акт приемки объекта капитального строительства» («Акт № 1») - подписанный членами приемочной комиссии, подтверждающий готовность Объекта к вводу в эксплуатацию, составленный по форме Акта приемки законченного строительством Объекта (форма КС-11), утвержденной Постановлением Госкомстата РФ от 30.10.1997 №71a.\n1.19. «Акт приемки объекта в эксплуатацию» («Акт № 2») - подписанный Застройщиком, Генподрядчиком и Эксплуатирующей организацией (в случае ее привлечения) по итогам проверки, отображающий недостатки Работ и использованных материалов, дефектов, комплектности и исправности оборудования и инженерных систем, входящих в состав результата Работ, полноты Исполнительной документации и устанавливающий сроки устранения указанных недостатков Генподрядчиком. \n1.20. «Итоговый акт (Акт №3)» – являющийся приложением к Договору, акт сдачи и приемки результата полного объема выполненных Генподрядчиком предусмотренных Договором работ, подписываемый Застройщиком и Генподрядчиком, в соответствии со ст. 753 ГК Гражданского кодекса Российской Федерации (далее – «ГК РФ»), после передачи Генподрядчиком Застройщику Исполнительной документации в полном объеме, получения ЗОС на Объект, в сроки, определенные Договором, в соответствии с утвержденной Проектной документацией, Техническим заданием, Техническими условиями (ТУ), Ведомостью договорной цены, Графиком строительства, и другими Графиками и Приложениями, являющимися неотъемлемой частью Договора, требованиями действующего законодательства, строительными нормами, правилами, регламентами и условиями Договора. \n1.21. «Комплекс работ» - технологически законченный отдельный вид работ по строительству Объекта, включая подготовительные, строительно-монтажные и пусконаладочные работы, а также изготовление Исполнительной документации, выполняемый в объеме, предусмотренном Договором в соответствии с Техническим заданием, Проектной документацией, согласованной в установленном порядке. \n1.22. «Работа(ы)» – означает комплекс работ по Договору (п. 2.1-2.2 Договора), включая строительно-монтажные и пусконаладочные работы, выполняемые по видам, согласованным Сторонами в Договоре и в Приложениях к Договору. Работы выполняются в объеме, предусмотренном Договором в соответствии с Проектной документацией, Техническим заданием. Работы выполняются в соответствии с действующими на территории РФ и субъекта РФ актуализированными строительными нормами и правилами, СП, техническими условиями, ГОСТами, техническими и национальными регламентами, включая, но не ограничиваясь:\n- строительные, строительно-монтажные, специальные и прочие работы и выполнение исполнительной документации;\n- поставка, разгрузка, складирование, хранение на Стройплощадке материалов, оборудования и инвентаря;\n- установка, монтаж, наладка, испытания и подготовка к пуску в эксплуатацию строительного и инженерного оборудования в местах, определенных Проектной документацией, Техническим заданием;\n- монтаж, наладка и сдача в эксплуатацию систем холодного и горячего водоснабжения, канализации, водостока, отопления, вентиляции, электроснабжения и освещения с системой учета энергопотребления по каждому помещению, слаботочных, противопожарных и охранных систем, систем автоматизации и диспетчеризации; \n- устранение дефектов и неполадок, выявленных в Работах и материалах, оборудовании в период выполнения Работ и в течение гарантийного срока;\n- подготовка и передача отдельных видов, этапов, конструкций и стадий работ с оформлением необходимой документации, устранение дефектов в период гарантийного срока.\n1.23. «Техническое задание» - документ, являющийся приложением к Договору, подписанный уполномоченными представителями Сторон, определяющий объем, содержание работ и другие предъявляемые к ним требования, являющийся частью документации обязательной к применению по Договору (Приложение № 3 к Договору).\n1.24. «Стройплощадка (Строительная площадка/строительная площадка)» - ограждаемая территория, используемая для размещения возводимого Объекта, временных зданий и сооружений, техники, отвалов грунта, складирования строительных материалов, изделий, оборудования, инвентаря, размещения служб Генподрядчика и выполнения строительно-монтажных работ. Передается Генподрядчику Застройщиком по Акту приемки-передачи Строительной площадки для выполнения работ по Договору. \n1.25. «Субподрядчики (субподрядчики/подрядчики)» - иные подрядчики, которые привлекаются или могут быть привлечены Генподрядчиком к выполнению работ на Объекте, за неисполнение (ненадлежащее исполнение) обязательства которых Генподрядчик несет ответственность перед Застройщиком. \n1.26. «Скрытые Работы» - работы, скрываемые последующими работами и конструкциями, качество и точность которых невозможно определить после выполнения последующих работ.\n1.27. «Акт по форме КС-2» – документ, применяемый для предварительной приемки выполненных Генподрядчиком работ, подтверждающий фактическое выполнение работ, определенных в фактических объемах в соответствующем периоде с обязательным приложением комплекта документов, указанного в п.7.2 Договора. Оформляется Генподрядчиком по форме и правилам согласно Приложению № 4 к Договору, совместно с справкой о стоимости выполненных работ и затрат по форме КС-3 («Справка по форме КС-З») за отчетный период (по форме Приложения № 4 к Договору);\n1.28. Акт приемки работ по устранению недостатков (дефектов), выявленных в гарантийный срок - документ, оформляемый в целях фиксации приемки работ по устранению недостатков (дефектов), обнаруженных в выполненных Генподрядчиком работах в гарантийный срок после проведения работ. \n1.29. «Временные здания и сооружения» - все временные здания и сооружения любого типа, возводимые или приспособляемые Генподрядчиком на период проведения работ по Объекту, необходимые для производства и завершения работ, а также для обслуживания персонала Генподрядчика в рабочее время. После завершения работ временные здания и сооружения разбираются и вывозятся Генподрядчиком за пределы Объекта за свой счет.\n1.30. «Гарантийный срок» – период времени, в течение которого Генподрядчик гарантирует качество и пригодность результата выполненных работ на Объекте и устраняет в соответствии с условиями Договора своими силами и за свой счет все выявленные Застройщиком или правомочными в соответствии с действующим законодательством третьими лицами недостатки (дефекты), ненадлежащее качество Работ, связанные с исполнением Генподрядчиком своих обязательств по Договору, при отсутствии виновных действий со стороны Застройщика и третьих лиц.\n1.31. «Недостатки (дефекты)» – любые отступления от требований, предусмотренных Договором, Проектной и сметной документацией и строительными нормами, правилами, стандартами и действующим законодательством РФ и города Москвы. Генподрядчик в этом случае несет ответственность в объеме и порядке, предусмотренными условиями Договора и действующим законодательством, до момента полного устранения недостатков (дефектов).\n1.32. «Персонал Генподрядчика» - специалисты и/или рабочие, имеющие необходимую квалификацию, а в случае необходимости - квалификационные сертификаты и другие документы, подтверждающие возможность осуществлять соответствующие Работы на территории Российской Федерации.\n1.33. «Просрочка» – нарушение (несоблюдение) любых сроков, установленных Договором, в том числе начальных и конечных сроков выполнения работ в целом, начальных и конечных сроков выполнения работ по отдельным этапам работ (Ключевых событий).\n1.34. «Ключевое событие» – содержащийся в Графике строительства отдельный этап производства Работ, включающий сроки начала и окончания производства Работ по данному этапу. \n1.35. «Сетевые организации» – организации, эксплуатирующие инженерные сети: ПАО «МОЭК», ОАО «Мосэнергосбыт», ОАО «МОЭСК», ОАО «ОЭК», АО «Мосводоканал», ГУП «Мосводосток», ПАО «МГТС», ГБУ г. Москвы «Система 112», ООО «Корпорация ИформТелеСеть»), инженерные системы, здания и территорию объектов. \n\n2. ПРЕДМЕТ ДОГОВОРА\n2.1. Генподрядчик обязуется выполнить по заданию Застройщика своими и/или привлеченными силами и средствами полный комплекс работ по строительству Объекта, получению ЗОС на Объект, получению совместно с Застройщиком Разрешения на ввод Объекта в эксплуатацию (оказание необходимого содействия для ввода Объекта в эксплуатацию путем выполнения необходимых предусмотренных законом мероприятий, полномочия по проведению которых не могут быть переданы иным лицам), и передать построенный Объект с выполнением всех работ, предусмотренных Договором, Застройщику, в сроки, определенные Договором, в соответствии с утвержденной Проектной документацией, Техническим заданием, Техническими условиями (ТУ) и (или) Техническими заданиями (ТЗ), выданными ресурсоснабжающими предприятиями-монополистами (в части работ порученных Генподрядчику), Ведомостью договорной цены, Графиком строительства, Графиком выдачи Рабочей документации и Приложениями, являющимися неотъемлемой частью Договора, требованиями действующего законодательства, строительными нормами, правилами, регламентами и условиями настоящего Договора, в том числе с осуществлением своими силами и средствами руководства и координации строительства Объекта, а Застройщик обязуется, принять результат Работ и оплатить его в соответствии с условиями Договора.\nСтороны, на основании п. 1 ст. 432 Гражданского кодекса РФ согласовали следующее существенное условие Договора: целью выполнения Работ Генподрядчика является выполнение полного комплекса работ по строительству Объекта с функционирующим оборудованием, в связи с чем для Застройщика представляет интерес лишь построенный, введенный в эксплуатацию (получен ЗОС на Объект), завершённый всеми предусмотренными Договором Работами Объект в целом.\n2.2. Виды, содержание и объем Работ, а также предъявляемые к ним требования, определяются Договором, Техническим заданием, Проектной документацией, Рабочей документацией, а также действующей законодательной распорядительной и нормативной документацией, в том числе, но не ограничиваясь: техническими регламентами, строительными нормами и правилами (СНиП), Государственными строительными нормами (ГСН), территориальными строительными нормами (ТСН), и включают в себя, в том числе:\n2.2.1. Организацию и координацию производства строительных работ.\n2.2.2. Ограждение Строительной площадки, организация проездов к Строительной площадке, освобождение Строительной площадки от мусора, строительство временных дорог и площадок, зданий и сооружений, пункт мойки колес, временных инженерных сетей, выполнение мероприятий по сохранности существующих инженерных сетей и сооружений, зданий, защите и сохранению зеленых насаждений в соответствии с Проектной документацией, Техническим заданием, содержание Строительной площадки в период строительства и ввода Объекта в эксплуатацию.\n2.2.3. Работы подготовительного периода, в том числе, оснащение и обустройство Строительной площадки, установка башенных кранов, бетонно-распределительных стрел и подъемников в соответствии с Проектной документацией, Техническим заданием.\n2.2.4. Строительство подземной и надземной частей зданий в полном объеме, с устройством несущих и ограждающих конструкций, фасадов, выполнением внутренних (включая подготовительные, черновые и финишные) и наружных отделочных работ, клининг помещений, мест общего пользования и мытье окон после окончания работ (перед ЗОС) и повторно, перед подписанием Итогового акта.\n2.2.5. Работы по внутренней отделке выполняются Генподрядчиком в следующих объемах:\n2.2.5.1. Внутренняя отделка мест общего пользования жилой части, двух павильонов, кладовок и паркинга производится в полном объеме в соответствии с Техническим заданием, Проектной документацией, переданной Застройщиком, дизайн-проектами, передаваемыми Застройщиком до начала выполнения соответствующих работ.\n2.2.5.2. Внутренняя отделка квартир не выполняется. \n2.2.6. Монтаж, пуско-наладку и ввод в эксплуатацию внутренних инженерных систем отопления, вентиляции, кондиционирования, дымоудаления, холодного и горячего водоснабжения, канализации, электроснабжения и освещения (внутреннего и наружного), противопожарных систем, слаботочных сетей, систем контроля доступа, автоматизации и диспетчеризации (в том числе коммерческий и технический учет), полного комплекса инженерного оборудования зданий (монтаж, наладка, включение по постоянной схеме, сдача в эксплуатацию) с учетом сдачи систем Объекта в состоянии готовности к эксплуатации.\n2.2.6.1. В помещениях осуществляется ввод инженерных систем с обустройством узлов учета в соответствии с Проектной документацией, Техническим заданием.\n2.2.7. Монтаж, пуско-наладку и ввод в эксплуатацию электрощитовых, вентиляционных камер, индивидуального теплового пункта.\n2.2.8. Монтаж, наладку и ввод в эксплуатацию лифтов и подъемников, включая строительные, отделочные, электромонтажные и слаботочные работы в шахтах, приямках и машинных отделениях, с составлением соответствующей документации.\n2.2.9. Испытания смонтированного оборудования и работы систем, предусмотренные нормативной документацией.\n2.2.10. Выполнение работ по благоустройству территории в соответствии с Проектной документацией и Техническим заданием. \n2.2.11. Работы по поставке материалов и оборудования.\n2.1.12. Работы по координации действий и ответственность за подрядчиков.\n2.2.13. Прочие, прямо не поименованные в данном разделе работы, но необходимые для строительства Объекта в соответствии с Проектной документацией и Техническим заданием, получения ЗОС и ввода Объекта в эксплуатацию, выполнения отделки мест общего пользования согласно, дизайн-проекту.\n2.3. Наружные инженерные сети (водоотведение – канализация хозяйственно-бытовая и ливневая) и сооружения выполняет Генподрядчик, на основании Рабочей документации переданной Застройщиком и Технического задания, путем привлечения других подрядных организаций, при этом Генподрядчик отвечает за безопасность на Строительной площадке, к его обязанностям относится обслуживание Строительной площадки и координация работы всех привлеченных им подрядчиков на Строительной площадке и поставщиков, включая их персонал, а также организация уборки территории Стройплощадки и пяти метров прилегающей к Стройплощадке территории, вывоза мусора, охраны имущества, охраны периметра Стройплощадки, организация точек подключения к сетям механизации (при необходимости) .\nГенподрядчик осуществляет взаимодействие и обеспечивает на Строительной площадке необходимые условия для проведения Сетевыми организациями, привлеченными Застройщиком, работ в целях осуществления технологического присоединения (предоставление места под размещение бытового городка, координация работы, организация точек подключения к сетям механизации и т.д.) \n2.4. Во избежание сомнений, Работы, которые должны быть выполнены Генподрядчиком по Договору, включают все возможные работы, определенно не упомянутые в Договоре и/или Приложениях к нему, но необходимые для строительства, завершения строительства и подготовки к вводу в эксплуатацию Объекта в соответствии с условиями Договора, а также для нормальной, безопасной, надежной, эксплуатации Объекта в целом, в соответствии с его целевым назначением, включая земляные работы, ограждение котлована, дренаж, водопонижение, фундаменты (при необходимости выполнения работ по водопонижению порядок и условия согласовываются Сторонами по дополнительному соглашению) а также все необходимые мероприятия по сохранности наружных инженерных коммуникаций и сооружений (в том числе мероприятия, требуемые эксплуатирующими данные сети и сооружения организациями) и прочее. \nВ связи с этим, если иное прямо не предусмотрено Договором, любое наименование работ, прямо не исключенное из состава Работ и не возложенное на Генподрядчика в соответствии с Договором, считается входящим в объем Работ и в Стоимость Работ по Договору, если такие работы являются необходимыми для достижения результата Работ (завершения строительства Объекта) в соответствии с Техническим заданием и Проектной документацией, Рабочей документацией переданными Генподрядчику при заключении Договора. Генподрядчик подтверждает, что работы, необходимые для достижения результата Работ, определенного в соответствии с Техническим заданием и Проектной документацией, не являются дополнительными работами, если их выполнение не обусловлено изменениями, внесенными Застройщиком в Техническое задание и/или Проектную документацию.\n\n3. СРОКИ ВЫПОЛНЕНИЯ РАБОТ\n3.1. Сроки выполнения работ по Договору по комплексам и видам работ согласованы Сторонами в Графике строительства. \n3.2 Работы, предусмотренные Договором, должны быть выполнены в следующие сроки:\nначало работ по Договору 02 апреля 2024 года.\nокончание работ по Договору не позднее 01 июня 2026 года. \nПри этом Генподрядчик обязуется соблюдать сроки достижения Ключевых событий: \n\n№\tКлючевое событие\tДата начала:\tДата окончания:\n1.\tМонолитные работы подземной части\t20.05.2024 г.\t03.08.2025 г.\n2.\tМонолитные работы надземной части\t25.12.2024 г.\t08.09.2025 г.\n3.\tКладка наружных стен типовых этажей\t28.02.2025 г. \t25.09.2025 г.\n4.\tРаботы по устройству наружных сетей\t15.04.2024 г.\t30.01.2026 г.\n5.\tРаботы по устройству фасада\t01.05.2025 г.\t16.01.2026 г.\n6.\tРаботы по устройству внутренних механических инженерных систем\t22.02.2025 г.\t23.01.2026 г.\n7.\tРаботы по устройству внутренних электрических инженерных систем\t07.05.2025 г.\t23.01.2026 г.\n8.\tОтделочные работы типовых этажей\t25.04.2025 г.\t10.02.2026 г.\n9.\tОтделочные работы лобби (в т.ч. лобби офисно-административного комплекса)\t25.04.2025 г.\t10.02.2026 г.\n10.\tРаботы по благоустройству территории, озеленению, монтажу малых архитектурных форм \t02.08.2025 г. \t27.12.2025 г.\n11.\tПолучение ЗОС\t01.03.2026 г. \t01.04.2026 г.\n12.\tУстранение всех замечаний и подписание Итогового акта (Акта №3)\t01.04.2026 г.\t01.06.2026 г.\n\t\nПри этом в срок до 01 мая 2026 года Стороны обязуются составить Акт №2 (как изложено в п. 13.1 Договора) с исчерпывающим перечнем всех дефектов, подлежащих устранению до подписания Итогового акта.\nПри этом, под практическим завершением по каждому из Ключевых событий подразумевается выполнение Генподрядчиком перечисленных выше видов работ в объеме, достаточном для выполнения последующих видов работ и начала их использования, с возможным наличием технологических проемов и отверстий, необходимых для осуществления прочих видов работ по Договору. Фактическая дата Ключевого события фиксируется актом, составленным Сторонами, а в случае немотивированного отказа или уклонения одной из Сторон от подписания акта о наступлении Ключевого события (при условии, что все работы в рамках соответствующего Ключевого события выполнены надлежащим образом) – актом, составленным без участия Стороны (Сторон), которая(ые) отказывается/ уклоняется от подписания акта.\n3.3. Фактической датой окончания работ по Договору считается дата подписания Сторонами Итогового акта (Акта № 3).\n\n4.\tОСНОВНЫЕ ПОЛОЖЕНИЯ\n4.1. Результатом выполненных и принятых от Генподрядчика работ по Договору является полностью законченный строительством и готовый к эксплуатации Объект, на который оформлен ЗОС, а также подписан Сторонами Итоговый акт (Акт №3).\n4.2. Под работами, выполняемыми Генподрядчиком по Договору, понимаются как работы, выполняемые собственными силами, так и работы, выполняемые его подрядными/субподрядными организациями, за которые Генподрядчик несет такую же ответственность, как и за работы, выполняемые собственными силами. \nНе позднее 10 (десяти) рабочих дней после заключения договора с каждым конкретным подрядчиком Генподрядчик обязан направить уведомление Застройщику, с указанием видов работ, выполняемых данным подрядчиком, с приложением документов (ИНН, ОГРН, учетная карточка организации с контактными телефонами, свидетельство о допуске к работам, если это необходимо для деятельности организации).\n4.3. Стоимость возведения, эксплуатации, последующего демонтажа и вывоза ограждения Строительной площадки (за исключением ограждения принятого Генподрядчиком при приемке Строительной площадки), временных зданий, сооружений, дорог, сетей и коммуникаций (как собственных, так и арендуемых Генподрядчиком или его субподрядчиками), необходимых Генподрядчику или его субподрядчикам для выполнения комплекса работ по строительству Объекта, включена в стоимость работ по Договору и отдельной оплате (сверх установленной Стоимости работ) со стороны Застройщика не подлежит. Право собственности на указанные временные ограждения, здания, сооружения, дороги сети и коммуникации принадлежит Генподрядчику.\n4.4. Временные здания, сооружения, сети и коммуникации должны быть демонтированы Генподрядчиком и удалены со Строительной площадки не позднее 7 (семи) календарных дней с даты завершения Устранений всех замечаний и подписания Итогового акта (Ключевое событие №12). \n4.5. Механизмы, в том числе грузовые подъемники и башенные краны (в комплексе с подготовкой площадки для подкрановых путей и монтажом подкрановых путей), транспорт, строительное оборудование, леса, инструменты, оснастка, подсобные приспособления и т.п., необходимые для выполнения работ по Договору, а также их доставка на территорию строительства и удаление с нее обеспечиваются и оплачиваются Генподрядчиком и отдельной оплате со стороны Застройщика не подлежат.\n4.6. Застройщик предоставляет Генподрядчику на территории строительной площадки на период строительства точки подключения временных инженерных сетей к городским сетям водоснабжения, и электросетям. Параметры электроснабжения на период строительства, описаны в ТУ и рабочей документации раздела «Механизация строительства». В случае, если в ходе строительства будет выявлен недостаток электрической мощности (например, на электропрогрев бетона или отопление бытового городка), то Застройщик обязуется компенсировать затраты Генподрядчику на использование дополнительного дизель-генератора необходимой мощности (доставка, аренда, обслуживание, стоимость топлива). На период до организации временного подключения к сети канализации Генподрядчик самостоятельно и за свой счет обязуется обеспечивать вывоз канализации, что включено в стоимость работ по Договору.\n\t4.6.1. В случае отсутствия на период строительства предоставления Заказчиком Генподрядчику точек подключения временных инженерных сетей к городским сетям водоснабжения и электросетям, то Заказчик компенсирует Генподрядчику стоимость понесенных документально подтвержденных расходов сверх установленного на них городского тарифа. \n4.7. Обустройство временных сетей в пределах Строительной площадки осуществляется Генподрядчиком самостоятельно, включено в Цену работ по Договору и отдельной оплате (сверх установленной Стоимости работ) со стороны Застройщика не подлежит.\n4.8. Стороны пришли к соглашению о следующих условиях распределения между ними расходов по оплате потребленных Генподрядчиком энергоресурсов:\n4.8.1. Затраты Генподрядчика по использованию энергоресурсов (электроэнергией, холодной водой, водоотведением (бытовое и сточное), обеспечение Объекта теплом, а также затраты на оплату тепловой энергии на период проведения пуско-наладочных работ) включены в Цену работ до даты получения ЗОС, указанной в п.3.2. Договора и рассчитанную согласно п.5.3. Договора, и отдельной оплате со стороны Застройщика не подлежат. Стоимость потребленных энергоресурсов Генподрядчик оплачивает Застройщику, расчёты по потребленным Генподрядчиком энергоресурсам осуществляются согласно п. 7.6. Договора.\nВ случае переноса срока получения ЗОС, не по вине Генподрядчика Застройщик обязуется компенсировать расходы Генподрядчика на оплату коммунальных услуг, отопления, а также компенсировать расходы Генподрядчика на охрану, оплату труда ИТР, содержание Строительной площадки в размере 5 000 000 (пять миллионов) рублей в месяц с даты завершения Работ по получению ЗОС (Ключевое событие №11).\nРазмер платы за обеспечение электроэнергией определяются на основании данных о фактическом потреблении электроэнергии Генподрядчиком по действующим тарифам. Фактическое потребление электроэнергии определяется по показаниям контрольно-измерительной аппаратуры (счетчик), а при ее отсутствии – исходя из фактически отработанного агрегатами Генподрядчика и привлеченных им Субподрядчиков времени и мощности агрегата по действующим тарифам.\nРазмер платы за обеспечение холодной водой определяются по показаниям счетчика учета водопотребления и действующим тарифам, утвержденным уполномоченным органом, а в случае его отсутствия в порядке, предусмотренном договором между Застройщиком и соответствующей ресурсоснабжающей организацией.\nРазмер платы за водоотведение (бытовое) определяются расчетным путем исходя из фактического потребления воды Генподрядчиком и привлеченными им Субподрядчиками.\nЗатраты на водоотведение (поверхностного стока), а также водопонижение в период строительства несет Генподрядчик, на основании счетов от Застройщика.\nРазмер платы за потребление Генподрядчиком тепловой энергии на отопление и теплоснабжение определяются по показаниям счетчика тепла и действующим тарифам, утвержденным уполномоченным органом, а в случае его отсутствия в порядке, предусмотренном договором между Застройщиком и соответствующей ресурсоснабжающей организацией.\nГенподрядчик обязуется своевременно заключить договор со специализированной организацией на вывоз илового осадка с моек колёс оборотного цикла, затраты по такому договору входят в стоимость работ по Договору и дополнительно Застройщиком не оплачиваются.\n4.9. При передаче Сторонами Строительной площадки (как от Застройщика Генподрядчику, так и от Генподрядчика Застройщику), а также ежемесячно – до 5 (пятого) числа месяца, следующим за отчетным, Стороны подписывают акт, в котором фиксируют показания приборов учета электроэнергии и воды в точках непосредственного отбора мощности Генподрядчиком, подающейся на Строительную площадку, при этом показания приборов учета фиксируются Сторонами также нарастающим итогом. При отказе представителей Генподрядчика подписывать указанный в настоящем пункте акт, выразившимся в действии, либо бездействии Генподрядчика, либо его представителей, данный акт составляется и подписывается в одностороннем порядке представителем Застройщика, после чего такой акт считается достаточным основанием для учета фактически израсходованной электроэнергии и воды Генподрядчиком при выполнении работ по Договору за истекший период.\nУчет использованной Генподрядчиком электроэнергии и воды по временным сетям осуществляется Застройщиком в точках присоединения (п. 4.6. Договора). Генподрядчик ежемесячно оплачивает Застройщику стоимость фактически израсходованной электроэнергии, воды, а также сброса в сети канализации за истекший месяц по тарифам ресурсоснабжающих организаций в соответствии с п. 7.6. Договора. \n4.10. Генподрядчик несет риск гибели и/или случайного повреждения материалов, оборудования, изделий, конструкций, механизмов, имущества и т.д., находящихся на Строительной площадке, а также результата выполненной работы до даты подписания Сторонами Итогового акта (Акта №3). Генподрядчик также несет риск случайной гибели или случайного повреждения временных зданий, сооружений, сетей и коммуникаций до их демонтажа и удаления.\n4.11. Подписание промежуточных актов приемки работ не означает перехода к Застройщику рисков, определенных в пункте 4.10. Договора. Стороны пришли к соглашению, что в период действия Договора Застройщик вправе требовать от Генподрядчика устранения дефектов и брака по работам, в отношении которых Сторонами уже подписаны Акты по форме КС-2. \nПри этом, подписание промежуточных Актов по форме КС-2 подтверждает выполнение промежуточных работ лишь для проведения расчетов, Акты по форме КС-2 не являются актами предварительной приемки результата отдельного этапа работ, с которыми закон связывает переход риска на Застройщика.\n4.12. С даты принятия Генподрядчиком Строительной площадки и до подписания Сторонами Итогового акта или до момента возврата Стройплощадки Застройщику по иным основаниям, охрану периметра Стройплощадки, охрану строящихся зданий, сооружений, сетей и коммуникаций, входящих в состав Объекта, а также материалов, изделий, конструкций, временных зданий и сооружений, строительной техники и другого имущества, принадлежащего Генподрядчику, его субподрядчикам и поставщикам, обеспечивает Генподрядчик за свой счет. \n4.13. Охрана периметра территории Объекта и доступ на Строительную площадку осуществляется специализированным охранным предприятием, привлеченным Генподрядчиком.\nОплату специализированному охранному предприятию за услуги по охране периметра территории Объекта осуществляет Генподрядчик. \nГенподрядчик обязуется заключить договор со специализированным охранным предприятием, в срок не позднее 15 (пятнадцати) календарных дней с момента подписания Договора.\nСтоимость услуг специализированного охранного предприятия включена в стоимость работ Генподрядчика по Договору и отдельной оплате не подлежит.\nСпециализированное охранное предприятие (ЧОП, ЧОО) должно быть зарегистрировано в соответствии с законодательством РФ, иметь необходимые лицензии и разрешения. \nЗастройщик дополнительно привлекает специализированное охранное предприятие для охраны периметра территории Объекта и контроля доступа на строительную площадку в т.ч. путем организации биометрической системы контроля допуска в КПП.\nГенподрядчик обязуется в течение 1 (одного) календарного месяца с даты заключения Договора установить КПП на Объекте в счет цены Договора, предоставив в нем 2 (Два) места для сотрудников специализированного охранного предприятия Застройщика (первое КПП).\n4.14. С учетом п.п. 4.12. – 4.13. Договора, Генподрядчик, с привлечением специализированного охранного предприятия, за свой счет обеспечивает:\n- круглосуточный допуск на территорию Объекта транспортных средств, механизмов, строительного оборудования, строительных материалов и персонала Застройщика, Генподрядчика и субподрядчиков для выполнения работ по Договору;\n- оснащение Стройплощадки камерами видеонаблюдения;\n- установку в течение 1 (одного) месяца с даты заключения Договора биометрической системы контроля доступа на Объект (Face ID), предоставленную Застройщиком, ее работоспособность и ежедневный сбор данных о всех сотрудниках Генподрядчика и привлеченных им подрядчиков в соответствии с законодательством РФ, в полном объеме. Обе стороны обязуются приложить усилия по интеграции системы контроля периметра Генподрядчика и системы Face ID, предоставленной Застройщиком. Если интеграция технически невозможна, на Объекте применяется Face ID;\n- наличие документарной (журналы, списки) и электронной систем (пропускная электронная система) учета работников на Стройплощадке;\n- наличие на Стройплощадке системы охранно-пожарного оповещения.\n4.15. Стороны подписывают акт приема-передачи Строительной площадки одновременно с подписанием Акта – допуска на Объект по установленной форме.\n4.16. Генподрядчик является собственником строительных и бытовых отходов, избыточного грунта, образующихся в ходе деятельности Генподрядчика при строительстве Объекта и обязуется совершать все необходимые действия, в том числе получать и согласовывать необходимую документацию, требующуюся по нормам экологического законодательства РФ, в том числе от своего имени совершать все действия, необходимые для заключения договоров. От своего имени заключать договоры на транспортировку, вывоз, утилизацию/размещение строительных и бытовых отходов на специализированных полигонах, имеющих действующие лицензии на размещение отходов в местах и состоящих в Государственном реестре объектов размещения отходов. \nПри этом Генподрядчик ежеквартально, до конца месяца, следующего за окончанием квартала, предоставляет Застройщику заверенные подписью исполнительного органа и печатью организации копии актов приема-передачи отходов, контрольных талонов и товарно-транспортных накладных. И другую экологическую документацию по запросу Застройщика.\n4.17. Генподрядчик подтверждает, что до заключения Договора тщательно обследовал Строительную площадку, прилегающую территорию и строения, ознакомился и оценил все условия, связанные с выполнением Работ (в т.ч. ознакомился с проектной документацией, разработанной на дату заключения Договора, полученными положительными заключениями уполномоченной экспертизы), получил от Застройщика информацию по всем вопросам, которые бы могли повлиять на сроки, стоимость и качество выполняемых Работ, изучил имеющиеся отчеты и заключения, составленные на основании обследований, и удовлетворительно осведомлен о: \n- размерах, конфигурации и характере Строительной площадки и прилегающих территорий и строений;\n- результатах исследования местности, гидрологических, геологических и климатических условиях территории Строительной площадки;\n- наличии необходимых коммуникаций и инфраструктуры;\n- расположении инженерных коммуникаций и сооружений, находящихся в зоне влияния строительных работ по объекту;\n- объемах и характере работ, которые предстоит выполнить, в том числе обо всех материалах, которые нужно поставить, чтобы произвести и завершить работы, предусмотренные Договором, а также устранить любые дефекты и несоответствия;\n- потребностях Генподрядчика в обеспечении подъездных путей, бытовых помещений и сооружений, в численности персонала и рабочей силы, в энергоснабжении, водоснабжении, транспортном обслуживании.\nГенподрядчик согласен принять без замечаний и под свою ответственность Строительную площадку и удовлетворен ее состоянием.\n4.18. Стороны определили следующий порядок разработки, согласования и передачи Проектной документации (Рабочей документации).\n4.18.1. Застройщик несет ответственность за качество Проектной документации. \n4.18.2. Застройщик разрабатывает Рабочую документацию и передает ее Генподрядчику со штампом «в производство работ» согласно Графику выдачи Рабочей документации. \nНа этапе рассмотрения и согласования разделов Рабочей документации Генподрядчик знакомится с подготавливаемыми материалами и может направить свои замечания (дополнения) и корректировки до утверждения Рабочей документации и передачи ее в производство работ.\nДокументы, составляющие Проектную документацию, являются взаимодополняющими и совокупными, и требования, установленные в одном документе, являются столь же обязательными, как и при их установлении во всех документах. В случае расхождений или несоответствий Стороны обязаны рассмотреть расхождения и определить путем подписания двустороннего документа по какому документу Проектной документации производятся работы. В дальнейшем Застройщик предпримет все меры для устранения расхождений в документации. \nВ случае отсутствия такого согласования вводится следующий приоритет документов технической документации:\n4.18.2.1. Высший приоритет – Проектная документация стадии «П»; \n4.18.2.2. Следующий уровень – Техническое задание;\n4.18.2.3. Следующий уровень приоритета – Рабочая документация;\n4.19. Генподрядчик имел возможность осуществить проверку всей переданной ему на момент заключения Договора документации, тщательно ознакомился с Техническим заданием, Проектной и прочей документацией, касающейся строительства Объекта, и согласен с тем, что принятая им документация позволяет начать Работы по строительству Объекта по Договору. \n4.20. Никакая другая работа Генподрядчика не является приоритетной в ущерб Работам по Договору.\n\n5. СТОИМОСТЬ РАБОТ\n5.1. Стоимостью работ (далее «Цена работ», «Стоимость работ») по Договору является стоимость полного объема и состава работ, выполняемых Генподрядчиком по Объекту в соответствии с Проектной документацией, Техническим заданием, Ведомостью договорной цены, Базовой стоимостью материалов, другими Приложениями к Договору, действующими строительными нормами и правилами, и другими нормативными документами, условиями Договора. \n5.2. Объемы работ, выполненные Генподрядчиком с отступлением от Проектной или нормативной документации, Технического задания, а также выполненные с дефектами, нарушениями требований, предъявляемых к их качеству или с отступлением от условий Договора, а также не оформленные или не сданные (не принятые от Генподрядчика) в установленном порядке, включению в Стоимость работ по Договору не подлежат. \n5.3. Стороны пришли к соглашению о том, что общая Стоимость работ по Договору в объеме, предусмотренном Техническим заданием согласно Ведомости договорной цены, составляет 3 390 000 000 (Три миллиарда триста девяносто миллионов) рублей 00 копеек, в том числе НДС 20% (565 000 000 рублей 00 копеек). \n5.4. Указанная в настоящем разделе Договора Стоимость работ по Договору согласована Сторонами, является фиксированной (твердой), за которую Генподрядчик обязан выполнить все работы, предусмотренные Техническим заданием, Проектной документацией, СП, СНиП, ГСН, ТСН и СанПиН, ГОСТ, прочими техническими регламентами и нормами, применимыми нормативными и распорядительными документами. Стоимость работ включает в себя все затраты Генподрядчика, необходимые для выполнения полного объема подлежащих выполнению работ или необходимых для этого расходов, включая стоимость работ, оборудования, материалов, изделий, строительной техники и инвентаря, таможенные и транспортные платежи, налоги и сборы, пошлины, штрафы, страхование, иные выплаты Генподрядчика, стоимость рабочей силы или колебания валютного курса по Договору и изменению не подлежит, за исключением случаев, прямо предусмотренных Договором и законодательством.\nВ Стоимости работ учтена стоимость всех, включая прямо не поименованных материалов, конструкций, изделий, оборудования, энергоресурсов, подсобно-вспомогательных и расходных материалов, строительного оборудования и приспособлений, использование машин и механизмов, строительно-монтажных и пуско-наладочных работ, затрат на проведение необходимых испытаний, ревизий, сертификаций, съемок, опробования работы оборудования и систем, получение сертификатов, согласований, заключений и т.п., и выполнение их требований, полного комплекса геодезических работ, содержания Строительной площадки (в том числе коммунальные платежи за потребленные электро/энергию и воду по показаниям узлов учета, обслуживание, охрана, пожарная безопасность и др.), обеспечение временными зданиями и сооружениями, затраты сезонного характера, в т.ч. производство работ в зимнее время, затраты на благоустройство, затрат на получения ЗОС, а также прочих затрат, обеспечивающих строительство Объекта, получение ЗОС и выполнение Генподрядчиком всех работ по Договору.\nСтоимость работ учитывает инфляцию, возможное удорожание стоимости материалов (с учетом положений п. 5.13.), изменение курса национальной и резервных валют, строительно-монтажные и гражданские риски, увеличение сроков выполнения работ (по вине Генподрядчика), гарантийные обязательства, затраты на подготовку Строительной площадки и прилегающей территории, ее содержание и временную эксплуатацию, затраты связанные с мобилизацией строительной техники и персонала Генподрядчика, доставкой материалов, изделий, конструкций и оборудования, необходимых для начала производства работ и их демобилизацией после окончания работ, или в случае прекращения действия Договора, услуги Генподрядчика, затраты, связанные с обеспечением Генподрядчика электроэнергией, теплом, водой бытовой и питьевой, канализацией, связью и иными ресурсами, необходимыми и достаточными для производства Работ на Объекте до даты ЗОС, сметную прибыль, непредвиденные расходы, зимнее удорожание, сезонность проведения работ и прочие погодные условия, затраты на привлечение иностранной рабочей силы, размещение рабочих, все налоги и сборы и пошлины РФ, временные здания и сооружения.\n5.5. Генподрядчик несет единоличную ответственность за правильность и полноту включения в Ведомость договорной цены всех работ и затрат, необходимых для выполнения работ по Договору согласно Технического задания и Проектной документации, и Рабочей документации, переданной Застройщиком на момент подписания Договора. В случае, если по каким бы то ни было причинам Генподрядчик не включил в Ведомость договорной цены работы (основные, сопутствующие, вспомогательные), которые необходимо выполнить согласно Технического задания и Проектной документации, и Рабочей документации, переданной Застройщиком на момент подписания Договора, в рамках Договора, или выявил арифметические ошибки подсчета объема и стоимости, он не вправе требовать увеличения стоимости Работ, указанной в п. 5.3. Договора. Итоговая стоимость работ остаётся неизменной. Занижение или отсутствие вида, объема работ в Ведомости договорной цены, но присутствующих в Техническом задании и Проектной документации, не служит основанием пересмотра стоимости Работ, указанной в п. 5.3. Договора.\n5.6. В Стоимость работ не входят затраты на технический надзор и осуществление мониторингов, требуемые организациями, эксплуатирующими инженерные сети и сооружения (в том числе метрополитен).\nПо требованию Застройщика Генподрядчик обязуется осуществить работы, обозначенные в настоящем пункте Договора, путем заключения договоров с соответствующими организациями с отнесением затрат по таким договорам на Застройщика. В таких случаях Сторонами заключается дополнительное соглашение к Договору с указанием размера затрат и основными условиями.\n5.7. В целях правильного оформления Генподрядчиком Актов по форме КС-2 и Справок по форме КС-3 и последующего промежуточного финансирования работ, а также в целях определения стоимости работ, материалов, изделий или оборудования в случаях, предусмотренных Договором, Стороны согласовывают Ведомость договорной цены.\n5.8. Любые количественные показатели (за исключением Стоимости работ, указанной в п. 5.3. Договора), приведенные в Договоре и приложениях к нему, являются только приблизительными и не принимаются в качестве фактических и точных объемов выполняемых Генподрядчиком работ и, поскольку иное прямо не предусмотрено в Договоре, Генподрядчик во всех случаях обязан выполнить все работы в объеме, необходимом для строительства Объекта, выполнения отделочных работ, получения ЗОС и обеспечения готовности к получению Разрешения на ввод Объекта в эксплуатацию за вознаграждение в форме уплаты Стоимости работ.\n5.9. Стоимость черновой и чистовой отделки, технических дверей (лючки), оконечных приборов (розетки, выключатели, светильники и т.п.) навигации, ОДШ МОПов уточняется после выхода дизайн-проекта и РД, что оформляется соответствующим Дополнительным соглашением. Общий бюджет определен Сторонами в размере 300 000 000 (Триста миллионов) рублей, в т.ч НДС, при этом Стороны согласовали следующий перечень работ:\nОтделка паркинга, лобби и типовых этажей МОП (отделка пола, отделка стен и потолка, устройство МОКАПа автостоянки, МОКАП фрагмента лобби, МОКАП фрагмента типового этажа, МОКАП отделки 15-го этажа МОП, освещение, навигация, мебель, санфаянс, сантехника, двери и лючки первых этажей лобби, декоративные элементы, обрамления дверей и лифтовых порталов, почтовые ящики и прочая мебель, отопление для проведение отделочных работ (кроме работ предусмотренных другими разделами) и передачи объекта до Итогового акта, а также другие работы, предусмотренные Рабочей документацией на отделку.\nСтоимость благоустройства, в т.ч. МАФы/освещение/навигации и т.д., уточняется после выхода дизайн-проекта и РД, что оформляется соответствующим Дополнительным соглашением. Общий бюджет благоустройства определен Сторонами в размере 100 000 000 (Ста миллионов) рублей, в т.ч НДС.\nКровля здания и павильона является эксплуатируемой.\nСтороны согласовали следующий перечень работ:\n- Благоустройство кровель;\n- Устройство всех подстилающих слоев, устройство финишных слоев;\n- Деревья и озеленение;\n- Малые архитектурные формы (МАФы);\n- Подпорные стенки;\n- Монтаж систем наружного освещения, включая уличные фонари, подсветку зданий;\n- Полив территории – установка системы автоматического полива и обслуживание;\n- Установка шлагбаумов;\n- Ограждение территории;\n- другие работы, предусмотренные Рабочей документацией по благоустройству.\n5.10. Застройщик имеет право по своей инициативе в одностороннем порядке принять решение об изменении Проектной документации и/или Технического задания, при этом:\nВ случае если вносимые Застройщиком изменения Проектной документации и/или Рабочей документации и/или Технического задания, дизайн-проектов, Вендор-листа влекут исключение, либо уменьшение объема, состава и/или содержания работ, выполняемых Генподрядчиком по Договору и/или наименования материала, Стоимость работ подлежит уменьшению с последующим изменением Ведомости договорной цены на сумму исключаемых объемов работ и заменяемых материалов с оформлением соответствующего дополнительного соглашения к Договору. \nОб указанном в настоящем пункте решении, Застройщик обязан заблаговременно (до начала выполнения работ, объем которых подлежит исключению/уменьшению/корректировке, либо до размещения Генподрядчиком заказа или закупки соответствующих материалов, изделий или оборудования, либо до выплаты Застройщиком соответствующего аванса на приобретение материалов, оборудования и/или изделий) письменно уведомить Генподрядчика. При этом в случае получения указанного в настоящем пункте уведомления Генподрядчик обязан приостановить подготовку к производству работ, объем которых подлежит исключению/уменьшению/корректировке, и руководствоваться указаниями Застройщика, содержащимися в данном уведомлении. В случае если Генподрядчик проигнорировал указание Застройщика, оговоренное в настоящем пункте Договора, Застройщик вправе не оплачивать Генподрядчику соответствующие выполненные работы, либо уменьшить их оплату по своему усмотрению, уведомив об этом письменно Генподрядчика.\nВ случае если вносимые Застройщиком изменения Проектной документации и/или Рабочей документации и/или Технического задания, дизайн-проектов, Вендор-листа влекут за собой увеличение объема, стоимости и/или содержания работ, выполняемых Генподрядчиком по Договору, Стоимость работ, подлежит увеличению с последующим изменением Ведомости договорной цены с оформлением соответствующего дополнительного соглашения к Договору. \nСтороны обязаны оформить Дополнительное соглашение к Договору в течении 15 (пятнадцати) календарных дней с момента направления Застройщиком уведомления об изменениях, указанных в настоящем пункте Договора, в адрес Генподрядчика.\n5.11 Генподрядчик обязан по основным материалам и оборудованию, указанным в Вендор-листе, привлекать только производителей, письменно согласованных Сторонами в Перечне допустимых производителей (Вендор-листе) (Приложение №12 Договору – по тексту «Вендор-лист»). Финальный выбор фасадного материала, светопрозрачных конструкций (стекла, профиля и фурнитуры), дверей, конвекторов, лифтового оборудования, материалов для чистовой отделки остается за Застройщиком. \nПри этом, Стороны установили порядок выпуска и согласования Рабочей документации в части Работ, касающихся производителей, указанных в Вендор-листе: \n-  при разработке рабочей документации Застройщик обязан разрабатывать рабочую документацию на основе производителей, выделенных жирным шрифтом в Вендор-листе.\n- при отсутствии такого производителя (выделенного жирным шрифтом в Вендор-листе) Застройщик разрабатывает Рабочую документацию с учетом самостоятельного выбора производителя, указанного в Вендор-листе при этом указывает напротив каждой позиции материалов в спецификации «или аналог из Вендор-листа», а Генподрядчик при получении Рабочей документации имеет право инициировать замену производителя на аналогичного, если такая замена не ухудшает технические характеристики систем и/или конструкций, а Застройщик обязан согласовать такие изменения. При этом все расходы на изменения Рабочей документации берет на себя Генподрядчик. \nГенподрядчик имеет право выбрать любого поставщика выбранного Сторонами производителя, при этом возникшая экономия (выгода), связанная с выбором производителя и поставщика, остается за Генподрядчиком.\nФинальное решение по выбору производителя фасадного материала, светопрозрачных конструкций (стекла, профиля и фурнитуры), дверей, конвекторов, материалов для чистовой отделки, лифтов и материалов отделки лифтов принимает Застройщик. В случае, если стоимость фасадного материала, светопрозрачных конструкций (стекла, профиля и фурнитуры), дверей, конвекторов, материалов для чистовой отделки, лифтов и материалов отделки лифтов у производителя, выбранного Застройщиком из Вендор-листа выше, чем стоимость материалов у производителя, выбранного Генподрядчиком из Вендор-листа, Застройщик компенсирует Генподрядчику разницу.\nВ отношении выбора материалов для фасадно-отделочных и/или светопрозрачных (оконные и дверные блоки, витражи), отделочных материалов, Генподрядчик должен руководствоваться Техническим заданием (Приложения: №13 «Техническое задание на выполнение комплекса работ по изготовлению оконных и дверных блоков из алюминиевого профиля», №14 «Техническое задание на выполнение комплекса работ по устройству демонстрационного фрагмента фасада (МОКАП), №15 Техническое задание на выполнение комплекса работ по устройству демонстрационного фрагмента отделки типового этажа (МОКАП), №16 Техническое задание на выполнение комплекса работ по устройству демонстрационного фрагмента отделки лобби (МОКАП)», Приложение № 17 Техническое задание на выполнение комплекса работ по устройству демонстрационного фрагмента отделки 15 этажа (МОКАП), Приложение № 18 Техническое задание на выполнение комплекса работ по устройству демонстрационного фрагмента отделки подземного паркинга (МОКАП) к Договору) и обязательно предварительно перед выбором поставщика предоставить Застройщику по три варианта образца фасадного материала (каждого из 6 элементов фасада в трех цветовых решениях, предусмотренных проектом, включая элементы фасадного материала и элементы из алюминиевых композитных панелей) и светопрозрачных (оконные и дверные блоки, витражи) материалов в колористических решениях, согласованных Застройщиком. При этом Генподрядчик обязуется согласовать с Застройщиком итоговые образцы материалов для выполнения работ для фасадно-отделочных и/или светопрозрачных конструкций. \n5.12. Застройщик имеет право по своей инициативе в одностороннем порядке принять решение о замене материалов, изделий или оборудования, на аналогичные, имеющие соответствующие технические характеристики и потребительские качества, либо о приобретении их у определенного производителя (поставщика) с последующим соответствующим изменением стоимости строительства на разницу в стоимости материалов и/или оборудования и оформлением дополнительного соглашения к Договору. \nОб указанном в настоящем пункте решении Застройщик обязан заблаговременно (до размещения Генподрядчиком заказа или закупки соответствующих материалов, изделий или оборудования) письменно уведомить Генподрядчика. При этом в случае получения указанного в настоящем пункте уведомления Генподрядчик обязан при выборе материалов, оборудования и/или изделий, необходимых для строительства Объекта, а также поставщика, руководствоваться указаниями Застройщика, содержащимися в данном уведомлении. В случае, если Генподрядчик проигнорировал указание Застройщика, оговоренное в настоящем пункте Договора, Застройщик вправе не оплачивать Генподрядчику соответствующие выполненные работы (с целью компенсации из этих сумм стоимости строительно-монтажных работ по замене материалов и стоимости материалов, указанных Застройщиком), либо уменьшить их оплату по своему усмотрению, уведомив об этом письменно Застройщика. \n5.13. В соответствии со ст.709 ГК РФ во избежание разногласий о базовой стоимости материалов и оборудования на дату заключения Договора Сторонами определена базовая стоимость строительных материалов (Приложение № 6 Перечень материалов и оборудования, далее «Перечень материалов и оборудования» или «Ведомость БСМ»). Ведомость БСМ содержит только стоимость материалов/оборудования и не содержит стоимость работ по переработке, изготовлению, транспортные расходы. \nВ случае увеличения стоимости основных материалов и/или оборудования, указанных в Перечне материалов и оборудовании, необходимых Генподрядчику для выполнения работ по Договору, более чем на 5% (пять процентов), Генподрядчик вправе требовать увеличения Стоимости работ по Договору на сумму удорожания материалов или оборудования, но только на разницу сверх 5% (пять процентов) от стоимости соответствующих материалов или оборудования.\nВ случае уменьшения стоимости основных материалов и/или оборудования, указанных в Ведомости БСМ, необходимых Генподрядчику для выполнения работ по Договору, более чем на 5% (пять процентов), Застройщик вправе требовать уменьшения стоимости Договора на сумму удешевления материалов или оборудования, но только на разницу сверх 5% (пять процентов) от стоимости соответствующих материалов и оборудования.\nКомпенсация стоимости материалов производится на основании объемов, указанных в Рабочей документации, с учетом коэффициента расхода материалов (не учитываются объемы, выполненные к моменту пересмотра стоимости).\nВ случае, если стоимость материалов и/или оборудования отличается от цен, определенных в Перечне материалов и оборудования, более, чем на 5% (пять процентов) Генподрядчик обязан до закупки и оплаты авансового платежа направить в адрес Застройщика официальный запрос на согласование стоимости такого материала/оборудования, а Застройщик в срок не более 5 (пяти) рабочих дней обязан согласовать стоимость материала/оборудования или заявить мотивированный отказ. В случае, если Генподрядчиком официальный запрос до размещения заказа и/или оплаты аванса направлен Застройщику не будет, Генподрядчик утрачивает право на компенсацию стоимости удорожания таких материалов или оборудования в соответствии с условиями пункта Договора, в объеме, который не согласовал Застройщик. \nПод рыночной ценой в рамках толкования настоящего пункта понимается цена материалов и/или оборудования, определенная Сторонами в результате проведенного им анализа ценовых предложений производителей и/или поставщиков материалов и оборудования, представленных на строительном рынке региона места выполнения работ.\nОпределение рыночной цены материалов или оборудования, являющейся основанием для расчета компенсационных выплат, предусмотренных настоящим пунктом, а также их расчет производится Застройщиком в следующих случаях:\nа) Получения Застройщиком от Генподрядчика запроса на определение текущей рыночной цены материалов или оборудования и расчета компенсационной выплаты. \nб) По инициативе Застройщика, независимо от получения от Генподрядчика соответствующего запроса.\nИзменение рыночной цены материалов или оборудования, указанных в Ведомости БСМ, подтверждается путем предоставления Генподрядчиком Застройщику обоснованного расчета рыночной цены материалов или оборудования, являющегося основанием для компенсационных выплат, предусмотренных настоящим пунктом. \nПри увеличении рыночной цены материалов или оборудования, указанных в Ведомости БСМ, более чем на 5% (пять процентов) по сравнению с ценой материалов или оборудования, зафиксированной в Ведомости БСМ, Застройщик обязуется возместить (компенсировать) Генподрядчику разницу в цене материалов и оборудования, превышающую указанные 5% (пять процентов). Размер возмещения (компенсации) рассчитывается по формуле: \nК = (Цр - (Цд х 1,05)) х V, где:\nК – размер возмещения (компенсации);\nЦр – согласованная Сторонами рыночная цена материалов или оборудования;\nЦд – цена материалов или оборудования, зафиксированная в Ведомости БСМ;\nV – объём материалов/оборудования с учетом подтвержденного коэффициента расхода материала/оборудования, по которому производится компенсация.\nПри уменьшении рыночной цены материалов или оборудования, указанных в Ведомости БСМ, более чем на 5% (пять процентов) по сравнению с ценой материалов или оборудованием, зафиксированной в Ведомости БСМ, Генподрядчик обязуется возместить (компенсировать) Застройщику разницу в цене материалов или оборудовании, превышающую указанные на 5% (пять процентов). Размер возмещения (компенсации) рассчитывается по формуле: \nК = ((Цд х 0,95) – Цр) x V, где:\nК – размер возмещения (компенсации);\nЦд – цена материалов или оборудования, зафиксированная в Ведомости БСМ;\nЦр – Согласованная Сторонами рыночная цена материалов или оборудования;\nV – объем материалов/оборудования с учетом подтвержденного коэффициент расхода материала/оборудования, по которому производится компенсация.\nПри этом Стороны согласовали следующий порядок согласований и оплаты компенсаций материалов и/или оборудования: \nПо итогам проведенных расчетов компенсаций, Стороны проводят один раз в квартал рабочее совещание и принимают решение о целесообразности оформления Дополнительного соглашения о пересмотре общей Цены работ, и, в случае принятия решения об оформлении такого Дополнительного соглашения, оформляют такое соглашение в течение 15 (пятнадцати) рабочих дней с момента проведения такого совещания. До оформления Дополнительного соглашения о пересмотре Цены работ оплата по Договору осуществляется в ранее установленном в Договоре размере.\nПоложения настоящего пункта Договора не отменяют условие о приблизительных количественных показателях, приведенных в Ведомости договорной цены, согласно п. 5.3. Договора, а объем работ по Договору, включая количество подлежащих применению материалов, изделий или оборудования, будет уточняться Техническим заданием, Рабочей документацией, о чем Стороны оформляют Дополнительное соглашение.\n5.14. Генподрядчик подтверждает, что получил всю необходимую информацию о потенциальных рисках, осложнениях и прочих обстоятельствах, которые могут помешать либо негативно воздействовать на производство работ или их стоимость, а цена работ является справедливой и обоснованной компенсацией за все работы, предусмотренные Договором. Генподрядчик принимает на себя и на свой счет все расходы, риски и трудности, возникающие при выполнении Работ, связанные в том числе с удорожанием Работ (в т.ч. материалов, если иное не предусмотрено условиями Договора).\n5.15. Генподрядчик подтверждает, что согласовывая Цену работ, он имел все данные обо всех необходимых ему для определения цены и объема работ по строительству Объекта материалах, оборудовании, документах и прочую информацию, в связи с чем не может в дальнейшем ссылаться на несправедливость и необоснованность цены работ, а также на неверный расчет площадей и строительных объемов Объекта согласно переданной до подписания Договора Проектной документации. Генподрядчик признает правильность и достаточность Цены работ, содержащейся в Договоре, для покрытия всех расходов, обязательств и ответственности в рамках настоящего Договора, а также в отношении всех прочих вопросов, необходимых для надлежащего производства Работ. Соответственно, Генподрядчик не претендует ни на какие дополнительные платежи, а также не освобождается ни от каких обязательств и/или ответственности, по причине его недостаточной информированности.\n5.16. При возникновении экономии (выгоды) ранее согласованной Стоимости работ, полученной в результате согласования и реализации Застройщиком предложений Генподрядчика по оптимизации проектных решений, не ухудшающих качество строительства и эксплуатационных качеств зданий, сооружений или инженерных систем, сетей, материалов, сумма экономии полностью распределяется Генподрядчику. \n5.17. Цена работ подлежит изменению в случае изменения ставки НДС, цена принятых Работ рассчитывается по ставке НДС, действовавшей на дату приемки Работ, а цена не принятых Работ подлежит расчету согласно измененной ставке НДС в следующем порядке: за основу расчета берется цена не принятых Работ без НДС, далее цена увеличивается на новую ставку НДС, и полученная сумма будет являться новой ценой непринятых Работ с новой ставкой НДС.\n5.18. Во избежание сомнений, Стороны установили, что в Цену работ не включена стоимость следующих работ:\n5.18.1. Снос/демонтаж зданий и сооружений площадки строительства, утилизация и вывоз мусора после сноса. Демонтаж оставшейся на 02.04.2024 подземной части здания и вывоз мусора осуществляет Генподрядчик без изменения стоимости по Договору;\n5.18.2. Строительный надзор;\n5.18.3. Вырубка деревьев и кустарников;\n5.18.4. Корректировка стадии «П», АГР, СТУ, ТУ, прохождение экспертизы документации на стадии «П»;\n5.18.5. Аудит всей рабочей документации;\n5.18.6. Устройство офиса продаж, включая, оплату коммунальных услуг, подключение к электрическим и механическим сетям, установка счетчиков;\n5.18.7. Разработка рабочей документации, в том числе и на наружные сети;\n5.18.8. Авторское сопровождение (фасадов, благоустройства, отделки МОП);\n5.18.9. Аренда, обслуживание и эксплуатация Дизель-генераторной установки (ДГУ);\n5.18.10. Фасадное освещение;\n5.18.11. Наружные сети и сооружения;\n5.18.12. Строительное водопонижение;\n5.18.13. Подсветка кранов, лайтбоксы;\n5.18.14. Устройство МОКапа по благоустройству; \n5.18.15. Разводка вентиляции внутри квартир;\n5.18.16. Мониторинг состояния существующих зданий, инженерных сетей и сооружений, шпунтового ограждения;\n5.18.17. Система обслуживания фасадов;\n5.18.18. Оборудование трансформаторной подстанции ТП 10/0,4 кВ (сама строительная часть ТП и ее отделка включена в стоимость по договору);\n5.18.19. Система автополива территории;\n5.18.20. Чистовая и черновая отделка квартир;\n5.18.21. Меблировка балконов и террас;\n5.18.22. Ограждение строительной площадки и устройство ворот.\n\n6.\tФИНАНСИРОВАНИЕ СТРОИТЕЛЬСТВА. АВАНСИРОВАНИЕ.\n6.1. Финансирование строительства осуществляет Застройщик, в том числе с использованием кредитных средств Банка.\n6.2. Финансирование строительства производится путем оплаты работ, выполненных Генподрядчиком с надлежащим качеством и принятых Застройщиком, и выплаты авансов Генподрядчику и напрямую поставщикам (продавцам), в размере и порядке, предусмотренными Договором.\n6.3. Стороны согласовали, что Застройщик выплачивает Генподрядчику аванс в общем размере 20% (двадцать процентов) от Цены работ, по следующему графику:\n- 5 % (пять процентов) в течение 30 (тридцати) календарных дней с даты заключения Договора; \n- 5% (пять процентов) в течение 4 (четырех) месяцев с даты заключения Договора;  \n- 5% (пять процентов) в течение 8 (восьми) месяцев с даты заключения Договора;  \n- 5% (пять процентов) в течение 12 (двенадцати) месяцев с даты заключения Договора.\n6.4. Оплата авансов, указанных в п.6.3, может также производиться Застройщиком напрямую поставщикам (продавцам) с указанием в платежных документах «за (ООО «СУ-10»)» на основании представленных Генподрядчиком Застройщику заявок с копиями счетов и договоров на поставку. Застройщик обязуется в течение 3 (трех) рабочих дней после совершения авансового платежа направлять Генподрядчику копии платежных поручений с отметкой банка в подтверждение оплаты аванса, на основании чего указанные платежи учитываются Сторонами как авансы, выплаченные Застройщиком Генподрядчику по Договору с даты исполнения платежного поручения банком Застройщика.\n6.5. Авансы, оплачиваемые Застройщиком напрямую поставщикам (продавцам), выплачиваются в течение 10 (Десяти) рабочих дней с даты согласования заявки со стороны Застройщика. \n6.6. В случае выплаты авансов, зачет авансового платежа производится путем пропорционального удержания суммы аванса из суммы выполненных Работ, определенной в Актах по форме КС-2 и Справках по форме КС-3 за отчетный период, с указанием в Справке по форме КС-3 отдельной строкой суммы засчитываемого аванса.\n6.7. Генподрядчик обязан в течение 3 (трех) рабочих дней после оплаты ему аванса предоставить Застройщику счет-фактуру на полученный аванс, оформленный в соответствии с законодательством РФ.\n6.8. Во избежание сомнений, Стороны установили, что совокупная сумма выплаченных Генподрядчику и поставщикам (продавцам) и неотработанных авансов по Договору не может превышать 20% (двадцать процентов) от Цены работ по Договору. Настоящее условие об ограничении размера авансов по Договору имеет приоритет над другими положениями Договора об авансах и условиями финансирования. В случае если Генподрядчиком будет допущено превышение полученных, но не отработанных авансов свыше 20% (двадцать процентов) от Цены работ по Договору, Застройщик вправе приостановить выплату авансов по Договору, что не будет являться для Генподрядчика нарушением платежных обязательств по Договору. \n6.9. Все платежи по Договору осуществляются путем банковского перевода денежных средств на расчетный банковский счет Генподрядчика, кроме авансовых платежей, которые осуществляются переводом на обособленный банковский счет (далее «счет ОБС») Генподрядчика, со счета ОБС Застройщика, либо иным способом, разрешенным действующим законодательством РФ и договором, заключенным Застройщиком с Банком. \nДля выплаты авансов Генподрядчик обязуется совершить все фактические и юридические действия с целью открытия ОБС по форме Банка и предоставить реквизиты ОБС Застройщику не позднее чем через 5 (пять) дней с даты заключения Договора. Генподрядчик обязуется обеспечить наличие такого расчетного счета ОБС на все время действия Договора, до полного расчета между Сторонами по Договору.\nНеисполнение обязательства по открытию ОБС и предоставлению его реквизитов Застройщику исключает ответственность Застройщика за Просрочку оплаты.\n6.10. Все взаиморасчеты по Договору производятся в рублях. Фактической датой совершения платежа по Договору считается дата поступления денежных средств на корреспондентский счет банка получателя.\n\n7.\tПОРЯДОК ОПЛАТЫ ВЫПОЛНЕННЫХ РАБОТ\n7.1. Стороны определили, что отчетным периодом по Договору считается календарный месяц.\n7.2. Не позже 25-го числа отчетного месяца Генподрядчик представляет Застройщику в 3 (трех) экземплярах следующие документы, подписанные Генподрядчиком:\n- Акт по форме КС-2 за отчетный период (по форме Приложения № 4 к Договору);\n- Справка по форме КС-3 за отчетный период (по форме Приложения №4 к Договору);\n- счет и счет-фактуру, оформленные в соответствии с требованиями законодательства РФ;\n- чек-листы проверки качества фактически выполненных работ в отчетном месяце;\n- комплект исполнительной документации, оформленный на фактически выполненные работы в предыдущем отчетном периоде, включая  \n- заверенные копии или оригиналы сертификатов и паспортов изготовителей или поставщиков на примененные материалы, оборудование, изделия и конструкции, лабораторные заключения о соответствии данных материалов, конструкций, изделий проектным характеристикам, выписки из общих и специальных журналов работ, журнала учета выполненных работ (по форме КС-6а), заполненных за отчетный период в соответствии с требованиями действующих нормативных актов Российской Федерации и г. Москвы. \nЗастройщик обязан в течение 5 (пяти) рабочих дней, не считая дня получения, проверить полученные Акт по форме КС-2 и Справку по форме КС-3, подписать их со своей стороны, и вернуть один экземпляр Генподрядчику, либо направить Генподрядчику мотивированный отказ от подписания документов с изложением причин (замечания к Актам по форме КС-2 и Справкам по форме КС-3).\n7.3. Оплата Генподрядчику за выполненные в отчетном месяце работы по Договору осуществляется Застройщиком ежемесячно, на основании Акта по форме КС-2 и Справки по форме КС-3 в следующем порядке:\n7.3.1. Сумма в размере 97 (Девяносто семь) % от стоимости работ, уменьшенная на сумму причитающихся к удержанию в соответствии с п. 6.6 ранее выплаченных Генподрядчику и поставщикам (продавцам) авансов, выплачивается Генподрядчику в течение 22 (Двадцати двух) рабочих дней с даты подписания Застройщиком Актов по форме КС-2, Справок по форме КС-3 и предоставления Генподрядчиком счета-фактуры, оформленного в соответствии с требованиями действующего законодательства РФ, на сумму стоимости выполненных работ в подписанной Сторонами Справке по форме КС-3. \n7.3.2. Оставшиеся 3% (три процента) от стоимости выполненных Генподрядчиком в отчетном месяце работ (далее – Гарантийное удержание) резервируются Застройщиком и выплачиваются Генподрядчику по истечении 12 (двенадцати) месяцев с даты получения Разрешения на ввод объекта в эксплуатацию, при отсутствии каких-либо претензий у Застройщика к Генподрядчику.\n7.4. Зарезервированная по условиям п. 7.3.2. Договора сумма Гарантийного удержания является мерой обеспечения выполнения Генподрядчиком обязательств по условиям Договора, не рассматривается Сторонами как заемные средства, и проценты за пользование зарезервированной суммой начислению и выплате не подлежат. В случае изменения стоимости Работ по Договору сумма Гарантийного удержания в каждом отчетном периоде изменяется так, чтобы финальная удержанная сумма составляла не менее 3% (трех процентов) от Стоимости работ по Договору. Сумма Гарантийного удержания указывается отдельной строкой в Справке по форме КС-3.\nУдержанные Застройщиком в качестве Гарантийного удержания суммы могут использоваться Застройщиком только для компенсации расходов, связанных с неисполнением и/или ненадлежащим исполнением Генподрядчиком гарантийных обязательств Генподрядчика в период гарантийного срока.\n7.5. В случае, если Генподрядчиком не будет предоставлена вся относящаяся к работам необходимая документация, которая должна быть предоставлена Генподрядчиком в соответствии с пунктом 7.2 Договора, Застройщик оставляет за собой право по своему усмотрению потребовать исключение из Актов по форме КС-2 фактически выполненных работ на сумму стоимости работ, в отношении которых не предоставлена документация, до момента предоставления соответствующих документов. Реализация Застройщиком права, предусмотренного настоящим абзацем, не является основанием для начисления процентов за пользование денежными средствами, каких-либо штрафных санкций, взысканий или иных сборов, также не подлежат применению нормы о коммерческом кредите. \n7.6. Уполномоченный представитель Генподрядчика не позднее 05 (Пятого) числа месяца, следующего за отчетным, совместно с уполномоченным представителем Застройщика осуществляет снятие показаний приборов учета, подтверждающих фактический расход Генподрядчиком тепловой энергии на отопление и теплоснабжение, электроэнергии и воды за истекший месяц, и оформляют двухсторонний акт с указанием количества израсходованной электроэнергии, воды и сброса в сети канализации. При отказе представителей Генподрядчика подписывать указанный в настоящем пункте акт, выразившимся в действии, либо бездействии Генподрядчика, либо его представителей, данный акт составляется и подписывается в одностороннем порядке представителем Застройщика, после чего данный акт считается достаточным основанием для возникновения у Генподрядчика обязательства по оплате в установленном настоящем пункте порядке стоимости фактически израсходованной при выполнении работ по Договору воды и сброса в сети канализации за истекший период.\nНа основании указанного акта Застройщик выставляет Генподрядчику, подготовленный на основании акта счет (с указанием стоимости израсходованной тепловой энергии на отопление и теплоснабжение, электроэнергии, воды и сброса в сети канализации по действующим тарифам) и счет-фактуру. В течение 4 (четырех) рабочих дней с момента получения от Застройщика, указанного в настоящем пункте счета Генподрядчик обязан произвести его оплату, в противном случае Застройщик вправе удержать оплату за потребленные в отчетном месяце ресурсы из суммы причитающихся Генподрядчику денежных средств (оплаты работ и/или авансов) за текущий и/или отчетный месяц при условии предварительного уведомления Генподрядчика.\n7.7. Если в Актах по форме КС-2 или Справках по форме КС-3 были допущены ошибки, и эти ошибки были обнаружены после подписания указанных документов, то любая из Сторон вправе потребовать пересмотра этих документов до оформления Итогового акта (Акта №3).\n7.8. Генподрядчик подготавливает все счета в соответствии с требованиями Застройщика и действующего законодательства РФ. \n7.9. Выплата Застройщиком каких-либо платежей Генподрядчику или оплата Застройщиком Генподрядчику какой-либо части работ в соответствии с Договором:\n- не является свидетельством приемки Застройщиком работ, этапа работ или какой-либо их части в смысле статьи 753 Гражданского Кодекса; и \n- не влечет перехода к Застройщику риска случайной гибели или повреждения результата работ. \n\n8. ПРАВА И ОБЯЗАННОСТИ СТОРОН\n8.1. Генподрядчик имеет право:\n8.1.1. Самостоятельно организовывать производство работ в соответствии со сроками, установленными Договором.\n8.1.2. Вносить на рассмотрение Застройщика любые вопросы, замечания и предложения, относящиеся к предмету Договора и требовать принятия по ним решения в разумные сроки, но не менее десяти рабочих дней.\nВносить предложения по оптимизации проектных решений, не ухудшающие эксплуатационных качеств зданий, сооружений или инженерных систем и сетей; согласовывать эти предложения с Застройщиком и далее ― при условии письменного согласования Застройщиком ― с проектной организацией и другими организациями в установленном порядке; реализовывать согласованные предложения при строительстве Объекта.\nВ случае, если предложения Генподрядчика по оптимизации проектных решений ведут к сокращению сроков и/или экономии Генподрядчика без потери качественных характеристик Объекта, работы по корректировке Проектной документации (в случае необходимости) и получение положительного заключения экспертизы осуществляются за счет Генподрядчика.\nВ остальных случаях корректировка проектной документации осуществляется за счет Застройщика.\nРасходы Застройщика, связанные с корректировкой Проектной документации согласно предложениям Генподрядчика по оптимизации проектных решений, включая расходы на получение положительного заключения экспертизы Проектной документации, по согласованию Сторон учитываются при определении возникающей выгоды (п.5.16 Договора).\nПоложения настоящего пункта Договора не отменяют условие о приблизительных количественных показателях, приведенных в Ведомости договорной цены, согласно п. 5.8. Договора, а объем Работ по Договору, включая количество подлежащих применению материалов, изделий или оборудования, определяется Договором, Техническим заданием и Проектной документацией.\n8.1.3. Генподрядчик имеет также иные права, указанные в тексте Договора, а также вытекающие из действующего законодательства Российской Федерации и относящиеся к предмету Договора.\n8.2. Генподрядчик обязан:\n8.2.1. Выполнить и сдать работы по Объекту в объеме и в сроки, предусмотренные Договором и в соответствии с условиями Договора. \nДо начала работ разработать и согласовать с Застройщиком и Техническим Заказчиком проект производства работ, в соответствии с требованиями положений, действующих в Российской Федерации и городе Москве нормативных документов и правил.\n8.2.2. Передать Застройщику до начала работ:\n8.2.2.1. За 1 (один) календарный день до начала производства работ: \n- список ИТР Генподрядчика, участвующих в производстве работ, с указанием видов выполняемых ими работ, приказов на инженерно-технических работников, ответственных за выполнение этих работ; \nСписок своих сотрудников и сотрудников своих подрядчиков, с указанием фамилии и имени для обеспечения Застройщиком допуска указанного персонала на территорию Объекта. При этом доступ автомобилей на территорию Строительной площадки осуществляется без предъявления списков.\n8.2.2.23. Приказ о назначении представителей Генподрядчика, ответственных за выполнение работ по Договору и доверенность на них с указанием их полномочий;\n8.2.2.3. Приказы о назначении представителей Генподрядчика, ответственных за использование электроэнергии, воды, и доверенность на них с полномочиями оформлять акты о количестве израсходованных Генподрядчиком ресурсов;\n8.2.2.4. Приказ о назначении представителей Генподрядчика, ответственных за технику безопасности при производстве строительных работ и пожарную безопасность на Объекте;\n8.2.2.5. Приказ о назначении представителей Генподрядчика, ответственных за электрохозяйство;\n8.2.2.6. Приказ о назначении представителей Генподрядчика, ответственных за работы с грузоподъёмными механизмами, с предоставлением соответствующих допусков и удостоверений ответственных по данному приказу лиц.\n8.2.2.7. Приказ о назначении представителей Генподрядчика, и доверенность на них с полномочиями принимать под роспись корреспонденцию от Застройщика в период действия Договора.\n8.2.3. Назначить в течение 5 (пяти) рабочих дней со дня подписания Договора Руководителя проекта, который будет представлять Генподрядчика и действовать от его имени в ходе исполнения Договора. Сведения, известные такому представителю Генподрядчика, считаются известными и Генподрядчику. Любые извещения, инструкции, информация и другие сообщения, передаваемые Застройщиком Генподрядчику в соответствии с Договором, могут передаваться уполномоченному представителю Генподрядчика, за исключением особо оговоренных случаев. Застройщик вправе до завершения исполнения Договора потребовать от Генподрядчика замены уполномоченного представителя, если своими действиями или бездействиями такой представитель позволит усомниться в своей компетентности и профессиональной пригодности, добросовестности исполнения обязательств.\n8.2.4. Назначить в течение 5 (пяти) рабочих дней с момента подписания Договора Руководителя строительства, который должен иметь соответствующее образование и квалификацию, подтверждённые соответствующими документами, включая, но, не ограничиваясь: дипломы, удостоверения о повышения квалификации, сертификаты, допуски к соответствующим видам работ и иные документы, требуемые в соответствии с действующим законодательством Российской Федерации. \nРуководитель строительства обязан лично контролировать ход всех работ на Строительной площадке и присутствовать на Строительной площадке в течение всего рабочего времени, за исключением дней нахождения в отпуске или отсутствия по болезни. Генподрядчик обязан обеспечить на время отсутствия Руководителя строительства его замену лицом, удовлетворяющим требованиям, предъявляемым к Руководителю строительства. Об отсутствии Руководителя строительства в связи с отпуском, по болезни или иным причинам и о его замещении Генподрядчик незамедлительно уведомляет Застройщика с представлением копий соответствующих приказов о замещении или новом назначении и копий документов, подтверждающих квалификацию лица, замещающего Руководителя строительства.\n8.2.5. Установить при необходимости временное ограждение Строительной площадки, сигнальное освещение, въездные ворота, калитки, галереи, навесы/козырьки и прочие элементы для ограждения, соответствующие по конструктивным и стилистическим решениям существующему ограждению. \nУстановить перед входом/въездом на Строительную площадку информационный щит, содержащий информацию, необходимую в соответствии с законодательством РФ и г. Москвы. При этом Генподрядчик обязуется не помещать и не разрешать размещение рекламных объявлений любого характера на всех ограждениях и заборах на Строительной площадке, объекте и вокруг них независимо от того, были такие ограждения и/или заборы возведены Генподрядчиком или нет.\n8.2.6. Выполнить строительство Объекта в сроки, в объемах и на условиях, определенных Договором, сдать выполненные работы Застройщику, а также уполномоченным представителям Технического Заказчика, эксплуатирующих и муниципальных организаций с оформлением установленной документации.\n8.2.7. Организовать надлежащим образом производство работ, как своими силами и средствами, так и силами, средствами привлекаемых субподрядчиков и поставщиков не снимая с себя ответственности в полном объеме за исполнение условий Договора, в соответствии с условиями Договора, проектной и сметной документацией, строительными нормами, правилами, стандартами, правилами техники безопасности, охраны труда, антитеррористическими мероприятиями, требованиями миграционного контроля, правилами пожарной безопасности, правилами по охране зеленых насаждений, иными нормативно-правовыми документами, действующими на территории РФ, города Москвы.\n Своими силами и средствами обеспечить получение всех необходимых профессиональных допусков, разрешений и допусков на право производства работ, требуемых в соответствии с законодательством Российской Федерации и города Москвы, в том числе разрешения и согласования, связанные с использованием иностранной рабочей силы. \n8.2.8. Обеспечить наличие на Строительной площадке и ведение документации, предусмотренной действующими законодательными, распорядительными и нормативными документами Российской Федерации и г. Москвы.\n8.2.9. По мере выполнения работ формировать папку Исполнительной документации, необходимой в том числе для получения ЗОС. \nИсполнительная документация в объеме выполненных работ по Договору передается Генподрядчиком Застройщику в оригинальном экземпляре, сброшюрованная в папки, с реестром и сопроводительным письмом в 3 (трех) экземплярах и 1 (один) экземпляр в электронном виде (в формате AutoCAD, Excel, Word, Project и др.) через Информационную систему управления проектами. \n1 (один) оригинальный экземпляр и 1 (один) экземпляр в электронном виде передаётся в течение одного месяца, следующим за отчетным периодом, с Актом по форме КС-2, остальные экземпляры Исполнительной документации передаются в течение 30 (тридцати) календарных дней после окончания работ в отчетном месяце.\nПри этом Стороны признают, соглашаются и декларируют, что не предоставление Генподрядчиком Исполнительной документации и (или) ее части в том числе в форматах, предусмотренных настоящим пунктом Договора, является ненадлежащим исполнением Генподрядчиком обязательств по предъявлению результатов выполненных работ к приемке в соответствии с условиями Договора. \nОтсутствие надлежаще оформленной исполнительной документации является основанием для отказа Застройщика от подписания Актов по форме КС-2 и Справок по форме КС-3, до устранения нарушения и передачи Генподрядчиком Застройщику полного комплекта надлежаще оформленной исполнительной документации.\nСтороны особо согласовали, что заключения лабораторных испытаний набора прочности бетона (по истечении 28 (двадцати восьми) суток) предоставляются не позднее 30 (тридцати) календарных дней после окончания работ в отчетном месяце, указанная отсрочка не относится к заключениям лабораторных испытаний набора прочности бетона по истечении 7 (семи) суток (при условии приложения формы чек-листа в соответствии с Приложением №20).\n8.2.10. Обеспечить предусмотренные действующими нормативными документами и техническими условиями освидетельствования выполненных работ, испытания, комплексное опробование смонтированного оборудования с оформлением полного комплекта необходимых документов. Разработать и согласовать (совместно с Генпроектировщиком) программу комплексных испытаний инженерных систем Объекта.\n8.2.11. Использовать материалы, предусмотренные действующей нормативной документацией.\n8.2.12. Обеспечить при строительстве Объекта выполнение мероприятий, предусматривающих сохранность, неизменность и целостность конструкций строящихся и существующих зданий, сооружений и инженерных коммуникаций, в том числе в осенне-зимний период и период весеннего оттаивания, организовать контроль (мониторинг) за их состоянием и в случае наличия изменений немедленно прекратить работы и сообщить об этом Застройщику, в дальнейшем действовать по его указаниям. \nВ случае повреждения конструкций строящихся и существующих зданий, сооружений и инженерных коммуникаций, находящиеся на территории Строительной площадки Генподрядчик обязуется восстановить их за свой счет в разумный срок, согласованный с Застройщиком. \nВ случае если Генподрядчик в установленный срок не приступил и/или приступил, но не исполняет указанную обязанность в согласованный с Застройщиком срок, Застройщик вправе самостоятельно восстановить поврежденные Генподрядчиком объекты или привлечь для этого третьих лиц с отнесением согласованных с Генподрядчиком расходов на счет Генподрядчика в порядке, предусмотренном разделом 14 Договора. Генподрядчик обязан выплатить Застройщику денежные суммы в размере понесенных Застройщиком затрат на восстановление указанных повреждений. Указанные денежные суммы подлежат возмещению Генподрядчиком в течение 10 (десяти) рабочих дней со дня получения соответствующего письменного требования Застройщика.\n8.2.13. Устранить в согласованный с Застройщиком разумный срок за свой счет все недостатки и/или дефекты Объекта, выявленные в процессе строительства и сдачи-приемки Объекта, а также в период гарантийной эксплуатации Объекта, вызванные отступлениями Генподрядчика или привлеченных им субподрядчиков от требований, предусмотренных в Проектной документации и в обязательных для Сторон нормативных документах.\n8.2.14. Выполнить работы по устройству на территории Строительной площадки временных зданий, сооружений, сетей и коммуникаций, необходимых для выполнения работ по Договору. При наличии соответствующих требований в действующих нормативных и правовых документах к размещаемым Генподрядчиком для осуществления работ в соответствии с Договором на территории Строительной площадки временных зданий, временных строений, временных сооружений, временных сетей и временных коммуникаций - разработать и согласовать в установленном порядке проектную документацию, необходимую для их сооружения и эксплуатации. \n8.2.15. Поставить на Строительную площадку необходимые для выполнения строительных работ материалы, изделия, конструкции и оборудование, самостоятельно осуществить их приемку, доставку к месту производства работ, разгрузку и складирование.\nГенподрядчик гарантирует, что качество строительных материалов, оборудования и комплектующих изделий, конструкций и систем, применяемых Генподрядчиком для выполнения работ по Договору, будет соответствовать требованиям Договора и действующего законодательства РФ, иметь соответствующие сертификаты, технические паспорта, иные документы, предусмотренные действующим законодательством РФ.\nГенподрядчик несет ответственность за предоставление строительных материалов, оборудования и комплектующих изделий, конструкций и систем, обремененных правами третьих лиц.\nГенподрядчик не вправе использовать при производстве работ материалы, конструкции, комплектующие изделия и оборудование, не указанные в Договоре, Проектной документации, Рабочей документации не утвержденные Застройщиком (в случае их изменения), а также не соответствующие действующим нормативным требованиям, законодательству РФ и г. Москвы. В случае нарушения этого положения Генподрядчик обязан своими силами и за свой счет заменить не утвержденные Застройщиком материалы, конструкции, комплектующие изделия и оборудование, а также возместить Застройщику убытки, причиненные использованием Генподрядчиком не согласованных с Застройщиком материалов, конструкций, комплектующих изделий и оборудования. \n8.2.16. Обеспечить строительство необходимыми механизмами, транспортом, строительным оборудованием, лесами, инструментами, оснасткой, подсобными приспособлениями и т.п.\n8.2.17. Обеспечить при необходимости согласование порядка ведения работ на Стройплощадке с надзорными органами (в том числе Мосгосстройнадзор и ОАТИ) и эксплуатирующими коммуникации и сооружения организациями (в том числе ГУП «Московский Метрополитен», АО «Мосводоканал», ПАО «МГТС», Московской кольцевой железной дорогой), соблюдение общего порядка на Строительной площадке, выполнение необходимых противопожарных мероприятий, мероприятий по технике безопасности и охране окружающей среды, регулярную уборку Объекта и Стройплощадки от мусора, включая 5-ти метровую зону вокруг Строительной площадки. В случае, если Генподрядчик понес какие-либо не предусмотренные Договором затраты для реализации обязанностей, предусмотренных настоящим пунктом, Застройщик не обязан их компенсировать Генподрядчику.\n8.2.18. Обеспечить персоналу на строительстве Объекта создание необходимых бытовых и санитарно-гигиенических условий, безопасных условий труда. Не размещать для проживания на территории строительства, в бытовых городках, временных зданиях и сооружениях, строящихся зданиях рабочую силу Генподрядчика (Субподрядчиков). Предусматривать в заключаемых с Субподрядчиками договорах условие о запрете проживания на территории Строительной площадки рабочей силы.\n8.2.19. Выполнить комплекс работ по организации штаба строительства Застройщика/Технического заказчика в соответствии с Приложением № 11 к Договору.\n8.2.20. Выполнять на Объекте и Строительной площадке необходимые мероприятия по технике безопасности, противопожарной безопасности, охране окружающей среды, промышленной безопасности, экологической и санитарной безопасности во время проведения работ по Договору. Генподрядчик обязан назначить ответственных представителей для осуществления контроля за соблюдением работниками Генподрядчика (субподрядчика) требований по технике безопасности, противопожарной безопасности, охране окружающей среды, промышленной безопасности, экологической и санитарной безопасности во время проведения работ по Договору.\n8.2.21. Генподрядчик обязан устранить выявленные Застройщиком, и/или Техническим заказчиком, и/или уполномоченными надзорными или контролирующими органами нарушения или отклонения в Работах по Договору от Проектной документации, положений (в том числе рекомендованных) действующих в Российской Федерации и городе Москве, нормативных документов и правил, включая, но не ограничиваясь, норм и правил в области противопожарной безопасности, охраны окружающей среды, охраны труда, промышленной безопасности, по технике безопасности, экологической и санитарной безопасности.\nГенподрядчик обязан:\n- обеспечить информирование Застройщика в течение 1 (одного) рабочего дня о проведении выездных проверок надзорными или контролирующими органами с момента получения уведомления о проведении проверки, получении акта проверки и предписания; \n- обеспечить ведение реестра предписаний и нарушений с указанием сроков их устранения; принять меры по недопущению Генподрядчиком нарушений договорных обязательств в части предоставления информации о проведении проверок;\n- в кратчайший срок подать ходатайство о продлении срока исполнения указанных выше предписаний;\n- еженедельно информировать Застройщика о проделанной работе по снятию нарушений информационным письмом.\n8.2.22. Разрабатывать и осуществлять мероприятия по снижению повреждения оборудования, пожаров и возгораний или нанесения ущерба окружающей среде в соответствии с требованиями положений, действующих в Российской Федерации и городе Москве нормативных документов и правил, Проектной документации.\nВ ходе выполнения работ проводить мероприятия, направленные на предупреждение несчастных случаев на производстве, профессиональных заболеваний, улучшения условий и охраны труда, санитарно-бытового обеспечения персонала.\nОбеспечить в ходе выполнения работ выполнение мероприятий по технике безопасности, охране окружающей среды, пожарной безопасности, по антитеррористической безопасности и пр.\n8.2.23. Заключить договор со специализированным охранным предприятием, в срок не позднее 15 (пятнадцати) календарных дней с момента подписания Договора и предоставить Застройщику копии уставных документов специализированного охранного предприятия.\nГенподрядчик обеспечивает исполнение специализированным охранным предприятием требований Положения об организации и обеспечении охраны и пропускного режима на Объекте (Приложение №7 к Договору).\nГенподрядчик самостоятельно несет ответственность за сохранность Строительной площадки, а также людей, оборудования и материалов и любого другого имущества, расположенного на Строительной площадке, с даты Акта приемки-передачи Строительной площадки до момента передачи Строительной площадки обратно Застройщику.\nПредоставлять Застройщику, Техническому заказчику отчет о любых происшествиях (авариях, травмах, несчастных случаях), возникших при выполнении работ по Договору, в течение 2 (двух) календарных дней с даты происшествия.\nПредоставлять Застройщику по запросу в течение 3 (Трех) календарных дней данные видео и/или аудио фиксации, записи с видеокамер наблюдения (при наличии) и любую другую информацию, полученную Генподрядчиком и/или привлеченным специализированным охранным предприятием в отношении Объекта. Вся собранная информация хранится у Генподрядчика не более 25 (Двадцати пяти) дней, после чего она перезаписывается.\n8.2.24. Укомплектовать строительство персоналом, имеющим надлежащую квалификацию и опыт работы, обеспечить нахождение на Строительной площадке персонала Генподрядчика и привлеченных субподрядчиков в спецодежде с логотипом, позволяющим определить их принадлежность к организации, осуществляющей выполнение работ. \n\tПо требованию Застройщика, Генподрядчик обязуется предоставить документальное подтверждение квалификации персонала Генподрядчика или привлеченных им подрядных организаций. \n8.2.25. Принять от Застройщика разрешительную и Проектную документацию, схемы расположения и каталоги координат и высот, геодезические знаки, устанавливаемых при геодезических разбивочных работах, и обеспечить их сохранность до окончания строительства Объекта.\n8.2.26. Обеспечить разработку в соответствии с Проектной документацией, переданной Застройщиком в производство работ, ППР, ПОС, чертежей «КМД», а также согласование их с Генпроектировщиком и Застройщиком, Техническим заказчиком. \nРазработка чертежей КМД должна выполняться проектной организацией, имеющей право выполнять данный вид работ. Разработанная документация должна соответствовать требованиям нормативных документов, а также Проектной документации объекта. Генподрядчик обязан передать Застройщику разработанную и согласованную Генпроектировщиком документацию марок «КМД» в 4-х экземплярах на бумажном носителе в 1-м экземпляре в электронной форме в формате PDF и в 1-м экземпляре в редактируемых форматах: в формате DWG и в редактируемой форме исходной программы с ссылочными файлами и библиотеками.\nПри этом исключительные права на разработанную документацию, стоимость которых определена Сторонами в размере 1 000,00 (Одна тысяча) рублей и включена в Цену Договора, переходят к Застройщику с момента передачи и дополнительной оплаты не требуют.\n8.2.27. В случае выявления необходимости проведения дополнительных работ, не учтенных в Проектной документации, Генподрядчик обязан в течение 5 (пяти) рабочих дней с даты выявления указанной необходимости уведомить об этом Застройщика для внесения соответствующих изменений и дополнений в Проектную документацию, а также согласования сроков и стоимости выполнения этих работ. Генподрядчик вправе не приступать к выполнению дополнительных работ без оформленного дополнительного соглашения к Договору. В случае, когда не выполнение Генподрядчиком дополнительных работ по причине отсутствия оформленного дополнительного соглашения к Договору, объективно может привести к задержке выполнения иных/последующих работ, то такая задержка не будет являться результатом действий/бездействий Генподрядчика. \nВ течение 1 (Одного) дня письменно известить Застройщика и до получения от него указаний в письменной форме приостановить работы при обнаружении:\n- непригодности или недоброкачественности предоставленной Застройщика проектной и сметной документации;\n- возможных неблагоприятных для Застройщика последствий выполнения его указаний о способе исполнения работ;\n- иных, не зависящих от Генподрядчика обстоятельств, угрожающих качеству результатов выполняемой работы, либо создающих невозможность ее завершения в срок.\n8.2.28. Соблюдать законодательство Российской Федерации, нормативные акты и другие документы, регламентирующие деятельность, относящуюся к предмету Договора.\n8.2.29. В случае привлечения Генподрядчиком либо привлеченным им субподрядчиком иностранной рабочей силы для выполнения работ, предусмотренных Договором, Генподрядчик обязуется самостоятельно и за свой счет оформить все требуемые в соответствии с действующим законодательством РФ разрешения. \nВ случаях использования иностранной рабочей силы Генподрядчик обязан неукоснительно соблюдать требования законодательства РФ о праве использования иностранной рабочей силы, осуществлять контроль над наличием у таких рабочих надлежаще оформленных документов в соответствии с законодательством РФ. При этом Застройщик не вправе вмешиваться во внутреннюю деятельность Генподрядчика, касающуюся его работников и работников, привлекаемых им субподрядчиков. Генподрядчик самостоятельно несет ответственность в полном объеме за нарушение им миграционного законодательства и правил регистрации иностранных граждан и лиц без гражданства, при исполнении Договора. Генподрядчик также несет полную ответственность за соблюдение привлеченными им субподрядными организациями требований законодательства РФ о праве использования иностранной рабочей силы.\n8.2.30. Обеспечить:\nа) беспрепятственный доступ к месту производства работ представителям Застройщика, Технического Заказчика, а также представителям организации, осуществляющей авторский надзор, органов государственного строительного надзора и ведомственных контролирующих органов для осуществления контроля и надзора за ходом выполнения работ, качеством используемых материалов и оборудования, представлять по их требованию отчеты о ходе выполнения работ (предусмотренные п. 8.2.34. Договора), исполнительную и проектную документацию;\nб) передачу Застройщику 4 (четырех) экземпляров Исполнительной документации одновременно с передачей Застройщику согласно п. 7.2. Договора ежемесячных Актов по форме КС-2 и Справок по форме КС-3 за истекший месяц. \nв) предоставление по запросу Застройщика необходимых и предусмотренных Договором документов о состоянии дел по выполнению работ по Договору;\nг) окончательную уборку Объекта перед сдачей (получением ЗОС), включая мытье окон и удаление пятен краски и грязи, и повторную уборку перед подписанием Итогового акта;\nд) постоянный контроль качества используемых материалов, конструкций и изделий, в том числе Генподрядчик обязан осуществлять освидетельствование грунтов дна котлована перед устройством бетонной подготовки.;\nе) согласование с Застройщиком, Техническим заказчиком плана контроля качества строительно-монтажных работ и поставок материалов, конструкций, оборудования.\n8.2.31. Нести все риски, связанные с прохождением процедуры таможенного оформления оборудования, материалов, изделий и конструкций, в случае использования Генподрядчиком либо привлекаемыми им субподрядчиками и поставщиками импортных оборудования, материалов, изделий и конструкций. Представить Застройщику по его запросу документы, подтверждающие факт завершения прохождения таможенного оформления (при наличии данных документов у Генподрядчика). Генподрядчик обязан запросить указанные документы у поставщика.\n8.2.32. Разработать и передать Застройщику до подписания Итогового акта (Акта №3) инструкции по эксплуатации инженерных систем и технологического оборудования, и иной инженерной инфраструктуры Объекта, а также инструкцию по эксплуатации объекта строительства.\n8.2.33. Оформить за свой счет полисы (договоры) страхования строительно-монтажных работ на сумму не менее Стоимости работ по Договору  на условиях «все риски» в пользу Банка (в том числе, но не ограничиваясь: от причинения ущерба Объекту, Строительной площадке, строительной технике и механизмам, по производству монтажных работ, по повреждению объектов, находящихся на Стройплощадке или в непосредственной близости от нее, от различного рода противоправных действий третьих лиц, аварий на инженерных сетях, от оседания, обвала, оползания грунта, от непреднамеренного нарушения норм и правил производства работ лицами, не являющимися ответственными за организацию работ и т.д.) и ответственности перед третьими лицами при наступлении страхового случая, по форме и перечню рисков, удовлетворяющим требования Банка (со сроком страхования до плановой даты ввода Объекта в эксплуатацию) и направить копии указанных полисов Застройщику в течение 15 (пятнадцати) дней с момента заключения Договора.\nОформить за свой счет страхование гражданской ответственности Генподрядчика и связанных с ней рисков на страховую сумму 150 000 000 (Сто пятьдесят миллионов) рублей, по форме и перечню рисков, удовлетворяющим требования Банка, и с указанием пострадавших лиц в качестве выгодоприобретателей. При этом срок страхования должен истекать не ранее плановой даты ввода Объекта в эксплуатацию. Направить копии указанных полисов Застройщику в течение 15 (пятнадцати) дней с момента заключения Договора.\nВ случае, если Генподрядчик не оформит в установленный срок полисы (договоры) страхования строительно-монтажных работ, гражданской ответственности Генподрядчика, то Застройщик имеет право самостоятельно оформить полисы (договоры) страхования строительно-монтажных работ, гражданской ответственности Генподрядчика. Все расходы, связанные с оформлением полисов (договоров) страхования строительно-монтажных работ, гражданской ответственности Генподрядчика должны быть возмещены Генподрядчиком Застройщику в срок не более 3 (трех) рабочих дней на основании требования Застройщика. По выбору Застройщика расходы, связанные с оформлением полисов (договоров) страхования строительно-монтажных работ, могут быть возмещены путем их зачета и/или удержания Застройщиком на основании одностороннего письменного заявления Застройщика в адрес Генподрядчика из сумм денежных обязательств Застройщика перед Генподрядчиком.\n8.2.34. Предоставлять Застройщику Еженедельные отчеты о ходе выполнения работ и о плане выполнения работ в электронном виде по форме Приложения №10. \nОтчеты предоставляются:\nОтчет о ходе выполнения работ в первый понедельник, следующий за отчетной неделей, до 14.00 по московскому времени;\nОтчет о плане проведения работ в последнюю пятницу, предшествующую отчетной неделе, до 14.00 по московскому времени. \nВ отчете указывается: код статьи кодификатора, объем выполненных/планируемых к выполнению работ, единицы измерения, стоимость выполненных/планируемых к выполнению работ, фактический срок начала и окончания (для завершенных на 100% работ) работ, наименование компании-исполнителя.\nОтчеты и приложения предоставляется Застройщику в электронном виде, посредством отправки по электронной почте n.kholopova@octobergroup.ru, a.tyutchenko@octobergroup.ru, malovik@octobergroup.ru.\nОтчет о ходе выполнения работ должен включать нижеследующую информацию:\n(а) Процент фактического выполнения в сравнении с плановым процентом выполнения по каждому виду работ;\n(б) В случае отставания работ от Графика строительства, указать возможные последствия и дать описание мер, необходимых для выполнения работ в сроки, предусмотренные Договором;\n(в) Информацию обо всех критических аспектах, влияющих на ход выполнения работ;\n(г) Графики хода выполнения отдельных видов работ; \n(д) Любую другую информацию, которую Застройщик может периодически запрашивать.\nГенподрядчик обязан принять меры предупреждения и во избежание задержек в ходе выполнения работ, и предпринять все необходимое для обеспечения удовлетворительного хода выполнения работ на всех этапах. Если на каком-либо этапе выполнения работ Генподрядчик начнет отставать от Графика строительства или станет очевидным, что работы не будут выполнены в сроки, предусмотренные указанными Графиком строительства, Генподрядчик обязан немедленно известить Застройщика о принимаемых мерах, необходимых для соблюдения сроков, предусмотренных Договором и Графиком строительства.\n8.2.35.1. Предоставлять Застройщику ежемесячно, не позднее 23-его числа предшествующего месяца, Производственную программу (Приложение № 10 к Договору) на следующий месяц (отчетный период). Производственная программа готовится Генподрядчиком на основании Графика строительства (Приложения №1 к Договору) и согласовывается Застройщиком в срок не более 5 (пяти) рабочих дней при отсутствии мотивированных замечаний.\nВ течение 3 (трех) рабочих дней с момента получения соответствующего требования Застройщика (но не чаще одного раза в квартал,) направить Застройщику надлежащим образом заверенные копии указанных в требовании информации и документов бухгалтерской и финансовой отчётности Генподрядчика по состоянию на дату, указанную в требовании Застройщика.\n8.2.36. Генподрядчик соглашается заключить договор подряда с подрядчиком, выбранным Застройщиком (далее - Номинированный Подрядчик) на условиях, предусмотренных в коммерческом предложении Номинированного Подрядчика. К указанным условиям добавляется генподрядный наценочный процент в размере 12% (двенадцать процентов) от общей суммы, указанной в коммерческом предложении Номинированного Подрядчика, при этом Генподрядчик принимает на себя полную ответственность за Номинированного Подрядчика, в том числе ответственность за использование авансов, выданных Номинированному Подрядчику, за качество и полноту исполнительной документации, а также за дефекты в работе, выявленные в гарантийном периоде. Коммерческое предложение Номинированного Подрядчика должно включать все предполагаемые расходы, необходимые для выполнения работ, в том числе оплату коммунальных услуг и другие связанные с выполнением работ расходы.\n8.2.37. При производстве работ не нарушать права третьих лиц, связанные с использованием любых патентов, торговых марок, авторских прав и иных объектов интеллектуальной собственности, а также оградить Застройщика от возможных исков, заявлений, требований и обращений третьих лиц, связанных с таким нарушением. В таких случаях Генподрядчик полностью за свой счет и своими силами урегулирует вышеуказанные требования третьих лиц.\n8.2.38. Обеспечить надлежащее хранение материалов и оборудования, поставленных на Строительную площадку для целей выполнения работ по Договору.\nВывезти в течение 7 (Семи) календарных дней, исчисляемых с даты подписания Итогового акта либо прекращения (расторжения) Договора, за пределы Строительной площадки принадлежащие Генподрядчику или его субподрядчиками строительные машины и технику, материалы, временные сооружения и другое имущество, в противном случае Застройщик вправе привлечь третье лицо для организации вывоза и ответственного хранения данного имущества с компенсацией Генподрядчиком понесенных расходов либо удержать сумму компенсации понесенных расходов из суммы денежных средств, причитающихся Генподрядчику.\n8.2.39. Обеспечить в установленном порядке оформление и согласование необходимых документов по доставке на Объект экологически чистого грунта, по временному складированию и вывозу грунта, непригодного для вторичного использования, и строительных отходов, по доставке на Объект недостающего грунта с карьеров.\n8.2.40. В счет стоимости работ по Договору не позднее даты подписания Итогового акта, ознакомить персонал управляющей компании работе с оборудованием и инженерными системами Объекта.\n8.2.41. Не передавать любую документацию по работам на Объекте или их отдельной части третьей стороне без письменного разрешения Застройщика, за исключением случаев, когда передача такой документации связана с закупкой материалов, оборудования, оказания услуг контрагентами Генподрядчика, а также случаев, предусмотренных законодательством РФ \n8.2.42. Генподрядчик имеет иные обязанности, указанные в тексте Договора, а также вытекающие из действующего законодательства Российской Федерации и относящиеся к предмету Договора.\n\n8.3. Застройщик имеет право:\n8.3.1. Проводить совещания или принимать участие в рабочих, технических и оперативных совещаниях по строительству и сдаче Объекта, проводимых Генподрядчиком, требовать необходимые разъяснения или обоснования по вопросам, относящимся к предмету Договора, требовать присутствия на совещаниях ответственных представителей Генподрядчика и подрядных и иных организаций, явку которых обязан обеспечить Генподрядчик.\n8.3.2. Требовать от Генподрядчика представления документации, относящейся к предмету Договора без вмешательства в хозяйственную деятельность Генподрядчика. Запрашивать информацию (в том числе в виде письменного отчета, предусмотренного п.8.2.34 Договора) о ходе и состоянии исполнения Генподрядчиком принятых на себя обязательств.\n8.3.3. Требовать от Генподрядчика устранения в согласованные сроки выявленных дефектов, отступлений от Проектной документации и Рабочей документации и нарушений технических условий и требований в соответствии с действующими нормами.\n8.3.4. Приостановить оплату выполненных Генподрядчиком работ в случае непредоставления счет-фактуры на сумму выполненных в отчетном месяце работ.\n8.3.5. В одностороннем порядке принять решение о замене материалов, оборудования и/или изделий, предусмотренных Проектной документацией, и/или Ведомостью договорной цены, и/или Техническим заданием, дизайн-проектами, на иные материалы, оборудование и/или изделия, письменно уведомив об этом Генподрядчика. При этом в случае получения указанного в настоящем пункте уведомления Генподрядчик обязан при выборе материалов, оборудования и/или изделий, необходимых для выполнения работ по Договору, руководствоваться указаниями Застройщика (относительно видов материалов, оборудования и/или изделий), содержащимися в данном уведомлении. В случае, если такая замена повлечет за собой изменение вида, характера, объемов, сроков и стоимости работ и материалов, предусмотренных Договором, Генподрядчик вправе не приступать к выполнению работ с использованием изменённых материалов, оборудования и/или изделий без оформления дополнительного соглашения к Договору. В случае, когда не выполнение Генподрядчиком работ с измененными материалами, оборудованием и/или изделиями по причине отсутствия оформленного дополнительного соглашения к Договору, объективно может привести к задержке выполнения иных/последующих работ, то такая задержка не будет являться результатом действий/бездействий Генподрядчика. \n8.3.6. Заявлять Генподрядчику претензии, связанные с некачественным выполнением работ, требовать от Генподрядчика устранения выявленных дефектов работ и/или материалов, отступлений от Проектной документации и нарушений технических условий.\n8.3.7. Проводить контроль качества содержания Строительной площадки и культуры производства работ, а также соблюдения на Строительной площадке правил охраны труда и техники безопасности. Осуществлять контроль за порядком и сроками производства работ. Количество проверок и сроки их проведения определяются представителем Застройщика единолично.\n8.3.8. В одностороннем порядке принять решение об изменении Проектной документации, Технического задания, дизайн-проектов Генподрядчик обязан выполнить Работы по Договору, руководствуясь указаниями Застройщика, содержащимися в соответствующем уведомлении, и откорректированной Проектной документации. В случае если Генподрядчик проигнорировал указание Застройщика, оговоренное в настоящем пункте Договора, Застройщик вправе не оплачивать Генподрядчику соответствующие выполненные работы, либо уменьшить их оплату по своему усмотрению, уведомив об этом письменно Генподрядчика. Генподрядчик вправе не приступать к выполнению работ, затронутых указанными изменениями без оформленного дополнительного соглашения к Договору. В случае, когда не выполнение Генподрядчиком работ, затронутых указанными изменениями работ по причине отсутствия оформленного дополнительного соглашения к Договору, объективно может привести к задержке выполнения иных/последующих работ, то такая задержка не будет являться результатом действий/бездействий Генподрядчика. \n8.3.9. В любое время требовать от Генподрядчика приостановки выполнения работ полностью либо в части (в том числе отдельных видов работ, либо применения отдельных видов материалов, конструкций, оборудования, изделий). Требование о приостановке выполнения Работ по Договору должно быть предъявлено в письменной форме (путем составления Акта) с указанием причин приостановки и срока его удовлетворения Генподрядчиком.\nПриостановка работ по причине некачественного выполнения отдельных видов работ, либо применения некачественных материалов, конструкций, оборудования, изделий, систем должна быть произведена Генподрядчиком немедленно после выявления вышеуказанных фактов.\nЗа отказ в удовлетворении требования о приостановке работ Генподрядчик несет ответственность, предусмотренную Договором и действующим законодательством РФ. Отказ Генподрядчика в приостановке работ в соответствии с настоящим пунктом фиксируется в журнале производства работ. \nГенподрядчик обязан устранить причины приостановки в пределах сроков (производства работ в целом, либо сроков выполнения работ по отдельным этапам), установленных Договором.\nГенподрядчик не вправе требовать увеличения сроков выполнения работ в целом, либо сроков работ по отдельным этапам, если приостановка вызвана виновными действиями Генподрядчика. \n8.3.10. Застройщик имеет также иные права, указанные в тексте Договора, а также вытекающие из действующего законодательства Российской Федерации и относящиеся к предмету Договора.\n8.4. Застройщик обязан:\n8.4.1. Обеспечить своевременное осуществление технического и авторского надзора за строительством Объекта, оформление техническим и авторским надзором исполнительной документации, полученной от Генподрядчика, ведение журнала авторского надзора. \n8.4.2 Заключить или обеспечить заключение договоров на услуги авторского надзора Генпроектировщика.\n8.4.3. Передавать Генподрядчику по согласованному Сторонами Графику выпуска Рабочей документации Проектную документацию в 4-х бумажных экземплярах (и 1 (один) экземпляр в электронном виде (в формате PDF, DWG, XLS), со штампом «в производство работ», согласованную в установленном порядке,  В случае, если передаваемая Рабочая документация имеет отклонения от принятой Генподрядчиком на дату заключения Договора Проектной и иной документации, полученной Генподрядчиком, а также приложений к настоящему Договору, в совокупности являющимися основанием для определения цены настоящего Договора, то такая документация должна сопровождаться перечнем с указанием отклонений. В случае, если Генподрядчиком будут выполнены работы по документации, имеющей указанные выше отклонения и не имеющей указанного перечня отклонений, то возможные дополнительные расходы Генподрядчика подлежат обязательной компенсации Застройщика. \n8.4.4. Передать Генподрядчику следующие документы:\n8.4.4.1. Копию разрешительной документации в объеме, необходимом для строительства Объекта и ввода его в эксплуатацию.\n8.4.4.2. Копию оформленного в установленном порядке разрешения на строительство Объекта.\n8.4.4.3. Журналы производства работ, оформленные в установленном порядке, в том числе общий журнал работ и журнал авторского надзора.\n8.4.4.4. Согласованный стройгенплан.\nНа момент подписания Договора Генподрядчику передана Проектная документация, получившая положительное заключение Мосгосэкспертизы, Рабочая документация по первому этапу работ и иные документы в соответствии с Актом приема передачи исходной документации. \n8.4.5. Передать Генподрядчику по Акту приема - передачи точки для подключения ресурсоснабжения, если такое подключение предусмотрено условиями Договора.\n8.4.6. Обеспечить финансирование выполняемых Генподрядчиком работ на Объекте, принять и оплатить своевременно и надлежащим образом выполненные Генподрядчиком работы в сроки и на условиях, предусмотренных Договором.\n8.4.7. Организовать приемку своевременно и надлежащим образом выполненных работ Генподрядчика.\n8.4.8. Передать Генподрядчику приказы о назначении инженерно-технических работников, ответственных за строительство Объекта (представителях Застройщика) и за ведение строительного контроля при производстве работ (представителях Технического Заказчика).\n8.4.9. Осуществлять контроль за соблюдением условий Договора Генподрядчиком.\n8.4.10. Обеспечить по требованию Генподрядчика рассмотрение вопросов по предмету Договора и принятие решения по ним в сроки, не влияющие на ход строительства.\n8.4.11. Осуществлять проверку и оформление полученных от Генподрядчика Актов по форме КС-2, Справок по форме КС-3 и других документов, требующих подписи (согласования) Застройщика.\n8.4.12. Обеспечить готовность наружных инженерных сетей и сооружений в сроки, не влияющие на своевременное выполнение Генподрядчиком своих работ по Договору.\n8.4.13. Обеспечить наличие документации, находящейся в компетенции Застройщика и необходимой для оформления ЗОС.\n8.4.14. Не позднее, чем за 4 (четыре) месяца до даты получения ЗОС, указанной в Договоре представить Генподрядчику организацию, которая будет осуществлять эксплуатацию Объекта и иметь в штате сотрудников соответствующей квалификации и подтверждающими квалификацию документами.\n8.4.15. Застройщик имеет также иные обязанности, указанные в тексте Договора, а также вытекающие из действующего законодательства Российской Федерации и относящиеся к предмету Договора.\n8.5. При реализации своих прав и обязанностей, предусмотренных настоящим разделом, а также Договором в целом, стороны должны действовать добросовестно и разумно. \n\n9.\tПОСТАВКИ МАТЕРИАЛОВ, ОБОРУДОВАНИЯ\n9.1. Поставка материалов, конструкций, изделий, оборудования и иной продукции для строительства Объекта включена в договорную стоимость и осуществляется Генподрядчиком. \n9.2. Материалы, конструкции, изделия, оборудование и иная продукция для строительства Объекта, предоставляемые Генподрядчиком для строительства Объекта, должны быть надлежащего качества,  соответствовать проектной документации, действующему законодательству РФ, в том числе применимым нормам, правилам, ГОСТам, стандартам и техническим регламентам и, при необходимости, пройти согласование с Застройщиком по виду, качеству и соответствию требованиям Застройщика, должны иметь соответствующие сертификаты, технические паспорта и другие документы, удостоверяющие их качество. Заверенные Генподрядчиком копии этих документов должны быть предоставлены по письменному запросу Застройщика в течение 10 (десяти) календарных дней с момента их получения Генподрядчиком. При передаче оборудования в монтаж, Генподрядчик обязан сопроводить его документацией предприятия-изготовителя, необходимой для монтажа. \n9.3. Генподрядчик обязан по мотивированному требованию Застройщика провести экспертизу образцов материалов для оценки их качества. При этом расходы на проведение экспертизы оплачиваются лицом, назначившим экспертизу. Если экспертной комиссией (специалистом) будет подтверждена некачественность материалов, расходы, понесенные Застройщиком на проведение экспертизы, оплатит Генподрядчик.\n9.4. В случае выявления превышения предельно-допустимой концентрации (ПДК) химических веществ в воздухе в помещениях Объекта по вине Генподрядчика вследствие применения поставленных им материалов Генподрядчик в период Гарантийного срока за счет собственных средств выполняет все мероприятия по приведению ПДК вредных веществ на Объекте в нормативное состояние, либо компенсирует документально подтвержденные затраты Застройщика и/или привлекаемых организаций по выполнению указанных мероприятий.\n\n10.\tВЕДЕНИЕ СТРОИТЕЛЬНОГО КОНТРОЛЯ ЗА ВЫПОЛНЕНИЕМ РАБОТ ПО ДОГОВОРУ\n10.1. Строительный контроль за строительством Объекта в соответствии с законодательными, распорядительными и нормативными документами осуществляют Генподрядчик (непосредственный производитель работ), Застройщик и Технический Заказчик.\n10.2. Генподрядчик, Застройщик и Технический Заказчик осуществляют контроль за выполнением работ, их качеством, соблюдением сроков их выполнения, качеством применяемых материалов, конструкций, изделий и оборудования, соблюдением Проектной и нормативной документации, а также соответствием объема, качества и стоимости выполняемых работ условиям Договора.\n10.3. Контроль над качеством работ и применяемых материалов, конструкций, изделий и оборудования, соответствием выполняемых работ Проектной документации, соблюдением действующих законодательных, распорядительных и нормативных документов осуществляют также представители авторского надзора проектной организации, государственных надзорных органов, эксплуатирующих организаций.\n10.4. Проведение испытаний материалов, конструкций и инженерных систем проводится в порядке, предусмотренном строительными нормами и правилами, и другими нормативными документами. Испытания, не предусмотренные нормативными документами, Генподрядчик выполняет по заданию Застройщика за отдельную плату, если это не вызвано необходимостью принятия решения по исправлению допущенных Генподрядчиком при выполнении работ отступлений от Проектной, Рабочей или нормативной документации.\n10.5. Материалы, изделия, конструкции, оборудование, не удовлетворяющие требованиям Проектной, Рабочей или нормативной документации, подлежат удалению со Стройплощадки Генподрядчиком за его счет.\n10.6. Застройщик в случае обнаружения при осуществлении контроля за выполнением работ отступления от требований Проектной, Рабочей или нормативной документации, а также условий Договора, обязан немедленно письменно уведомить об этом Генподрядчика. Генподрядчик обязан исполнить полученные в ходе строительства указания Застройщика в кратчайшие сроки (в особых случаях, исключающих возможность продолжения строительства остановить работы до устранения брака или устранения дефектов), не нарушая при этом общего срока выполнения работ по Договору.\n\n11.\tСКРЫТЫЕ РАБОТЫ\n11.1. Генподрядчик может приступать к выполнению последующих работ только после приемки Застройщиком скрытых работ и составления актов освидетельствования этих работ.\nПеречень скрытых работ, подлежащих промежуточному освидетельствованию, принимается в соответствии с действующими нормативными документами.\n11.2. Генподрядчик обязан письменно известить Застройщика о необходимости освидетельствования подлежащих закрытию работ за 2 (два) рабочих дня до освидетельствования.\n11.3. Застройщик вправе потребовать дополнительную проверку любых скрытых работ, включая те, в освидетельствовании которых он принимал участие, если имеются основания предполагать изменение их состояния.\n11.4. В случае, когда Застройщик и/или Технический Заказчик не приглашались на освидетельствование, Генподрядчик по требованию Застройщика обязан за свой счет выполнить вскрытие и повторное закрытие подлежащих освидетельствованию работ. \nПри этом ответственность за Просрочку Генподрядчик несет в полном объеме в соответствии с условиями Договора. \n\n12.\tИЗМЕНЕНИЯ В ПРОЕКТНОЙ ДОКУМЕНТАЦИИ\n12.1. Отдельные изменения, вносимые в процессе работы в Проектную, Рабочую документацию в порядке технического или авторского надзора, или по инициативе Генподрядчика действительны только при условии, что эти изменения письменно удостоверены Застройщиком и соответствуют действующему законодательству и нормативным актам\n12.2. Изменения и дополнения, вносимые в Проектную, Рабочую документацию, должны быть письменно доведены до Генподрядчика, в том числе путем оформления соответствующей записи в журнале работ и выдачи Генподрядчику дополнительных экземпляров Проектной, Рабочей документации, оформленной в установленном порядке.\n12.3. В случае если изменения и дополнения, внесенные в Проектную, Рабочую документацию по инициативе Застройщика, влекут за собой переделки уже выполненных Генподрядчиком работ, эти переделки актируются Сторонами, а их стоимость оформляется Дополнительным соглашением к Договору и подлежит оплате Застройщиком.\n12.4. Застройщик не позднее чем за 60 (шестьдесят) календарных дней обязан предупредить Генподрядчика о планируемых изменениях в Проектную, Рабочую документацию, Техническое задание, Вендор-лист и иную сопутствующую документацию. В случае не уведомления в предусмотренный срок Застройщик обязуется компенсировать Генподрядчику фактические документально подтвержденные понесенные расходы на материалы и оборудование, завезенные на Объект и принятые Застройщиком либо в случае если оборудование/материалы заказаны/внесен аванс Генподрядчиком, то указанные договоры закрываются на выполненном объеме, Генподрядчик поставляет материалы, оборудование которое успели произвести к указанному моменту, а Застройщик компенсирует их стоимость. \n\n13. ПОРЯДОК СДАЧИ ОБЪЕКТА\n13.1. Генподрядчик письменно уведомляет Застройщика о завершении Работ по строительству Объекта в полном объеме, о готовности Объекта и формировании Приемочной комиссии.\nПо результатам работы Приемочной комиссии, которая проводится в течение 10 (Десяти) рабочих дней с момента образования Приемочной комиссии, если Приемочной комиссией будет принято решение о готовности Объекта к получению ЗОС, Стороны оформляют Акт № 1 («Акт приемки объекта капитального строительства»).\nЗастройщик в течение 3 (трех) рабочих дней со дня подписания Акта приемки объекта капитального строительства (Акта № 1), подает в Мосгосстройнадзор заявление о проведении итоговой проверки и выдаче ЗОС.\nВо избежание сомнений, Генподрядчик обязуется в счет Цены работ обеспечить выдачу ЗОС (для чего Застройщик обязуется оказать необходимое Генподрядчику содействие и обеспечить Генподрядчика необходимыми доверенностями и полномочиями).\nГенподрядчик обязуется участвовать совместно с Застройщиком во всех проверках и иных мероприятиях, проводимых органами государственного строительного надзора и иными Государственными органами при рассмотрении вопросов о выдаче заключения органа государственного строительного надзора о соответствии построенного объекта капитального строительства требованиям технических регламентов и проектной документации.\nЕсли в ходе проведения проверок и иных мероприятий, указанных в настоящем пункте, будет затребована дополнительная документация (включая, но не ограничиваясь, акты испытаний, акты разграничения ответственности и другая документация), то в случае, если запрошена документация в компетенции Застройщика, то такую документацию должен представить Застройщик, а если любая другая – то Генподрядчик.\nВ случае если Генподрядчик считает запрос органов государственного строительного надзора и/или иных Государственных органов незаконным, он должен незамедлительно представить Застройщику ответ со ссылкой на положение, содержащееся в нормативно-правовом акте, подтверждающее незаконность запроса.\n13.2. Приемка законченного строительством Объекта начинается Приемочной комиссией в течение 5 (Пяти) рабочих дней со дня получения ЗОС.\nВ течение 30 (Тридцати) календарных дней после даты получения ЗОС и начала работы Приемочной комиссии, Сторонами оформляется Акт № 2 (по тексту Договора «Акт №2 или «Акт приемки объекта в эксплуатацию), отражающий факт наличия или отсутствия Недостатков и/или дефектов результата Работ, комплектности и исправности оборудования и инженерных систем, входящих в состав результата Работ, полноты Исполнительной документации, а также устанавливающий сроки их устранения Генподрядчиком.\nВ случае выявления недостатков или дефектов в результате Работ Стороны составляют Акт № 2 совместно с перечнем недостатков («Дефектной ведомостью» или «Чек-лист»), который будет содержать исчерпывающий перечень дефектов и недостатков выполненных Генподрядчиком работ.\nПеречень дефектов должен содержать следующую информацию: фотографию каждого дефекта, локализацию каждого дефекта (корпус, этаж, оси, строительный конструктив) и ФИО ответственного представителя, выдавшего дефект. \n13.3. После устранения Генподрядчиком всех дефектов и недостатков, указанных в Дефектной ведомости (Чек-лист) к Акту №2 Генподрядчик считается исполнившим свои обязательства по устранению дефектов и недостатков, Генподрядчик передает Объект Эксплуатирующей организации в эксплуатацию, что будет подтверждено подписанной Сторонами Технической «Ключевой справкой»  о передаче объекта под заселение, утв. Постановлением Правительства Москвы от 11.07.2000 №530, и Застройщик обязан принять результат Работ и подписать Итоговый акт (Акт №3).\nВ случае если в течение 15 (Пятнадцати) рабочих дней с даты получения Застройщиком уведомления о начале приемки и подписании Итогового акта (Акта №3), при условии подписания Акта №2 и устранения Генподрядчиком всех указанных в таком акте как значительные дефектов и недостатков, а также передачи Исполнительной документации и прочих документов, Застройщик не направят Генподрядчику по адресу Генподрядчика мотивированный отказ, и при этом не начнут приемку, то Итоговый акт (Акт № 3) может быть подписан Генподрядчиком в одностороннем порядке со всеми вытекающими правами, предоставляемыми Генподрядчику статьей 720, 753 Гражданского Кодекса РФ\nСдача Объекта осуществляется в установленном законодательством РФ и города Москвы порядке путем оформления Генподрядчиком совместно с Застройщиком в соответствии с положениями Градостроительных кодексов, распорядительных и нормативных документов Российской Федерации и города Москвы ЗОС, Разрешения на ввод объекта в эксплуатацию. \n13.4. Промежуточное освидетельствование качества работ в соответствии со строительными нормами и правилами, а также необходимые испытания производятся по мере выполнения работ после получения письменного сообщения от Генподрядчика. \n\n14. ГАРАНТИИ. УСТРАНЕНИЕ НЕДОСТАТКОВ\n14.1. Генподрядчик гарантирует:\n- соответствие качества работ, выполненных на Объекте, Проектной документации, действующим строительным нормам и правилам, инструкциям, стандартам, техническим условиям и другим регламентам, документам, действующими на территории г. Москвы и РФ;\n- надлежащее качество используемых материалов и оборудования, и соответствие их качества требованиям Проектной и Рабочей документации, условиям Договора, государственным стандартам, а также наличие сертификатов, технических паспортов и прочих документов, подтверждающих качество материалов и оборудования и их соответствию;\n- бесперебойное функционирование инженерных систем и оборудования, смонтированного или установленного на Объекте при условии нормальной эксплуатации Объекта;\n- своевременное устранение недостатков и дефектов, выявленных при приемке работ и в гарантийный срок эксплуатации Объекта; \nВсе указанные гарантии качества предоставляются Генподрядчиком и распространяются как на Объект в целом, так и на все конструктивные элементы и инженерные системы (материалы, новое оборудование, системы) и работы, выполненные Генподрядчиком и/или привлеченными им третьими лицами (подрядчиками, поставщиками, исполнителями). \n14.2. В случае применения в строительстве материалов или оборудования, конструкций, изделий, систем, не соответствующих по качеству требованиям российских стандартов (норм, правил), Проектной документации, условиям Договора или не имеющих сертификата производителя, либо не разрешенных к применению на территории РФ, Генподрядчик безвозмездно заменяет эти материалы и производит без оплаты необходимые строительно-монтажные или иные работы, связанные с заменой материалов. \n14.3. Гарантийный срок на выполненные по Договору строительные работы, включающие в себя, в том числе, конструктивные элементы, фасады, кровлю - составляет 5 (пять) лет. \nГарантийный срок на работы по монтажу на Объекте инженерных систем и оборудования составляет 5 (пять) лет, на технологическое и инженерное оборудование составляет 3 (три) года. \nГарантийный срок на отделочные работы и благоустройство составляет 2 (два) года.\nУказанные гарантийные сроки исчисляются с момента подписания Сторонами Итогового акта (Акта №3).\n14.4. Если Гарантийный срок, установленный изготовителем или поставщиком материалов, конструкций, изделий, оборудования на свою продукцию больше срока, указанного в п.14.3 Договора, Генподрядчик обязуется выполнять гарантийные обязательства в отношении работ, произведенных с применением этих материалов, конструкций, изделий, оборудования в течение срока гарантии, установленного изготовителем или поставщиком, но в пределах 3 (трех) лет.\n14.5. В случае выявления в период Гарантийного срока недостатков или дефектов выполненных работ, Генподрядчик обязан за свой счет устранить такие дефекты или недостатки в согласованные Сторонами сроки. \n14.6. При обнаружении в период Гарантийного срока недостатков или дефектов в выполненных работах, Застройщик письменно уведомляет Генподрядчика о дате и времени совместного осмотра выявленных недостатков/дефектов и составлении рекламационного акта (далее – «Уведомление»), при этом Уведомление должно быть вручено Генподрядчику не позднее чем за 96 (девяносто шесть) часов до указанного времени и указанной Застройщиком в Уведомлении даты совместного осмотра выявленных недостатков/дефектов (касается дефектов, которые обнаружены собственниками в принадлежащих им помещениях), и за десять рабочих дней (касается всех остальных дефектов), при этом Стороны установили, что надлежащим направлением/вручением Уведомления Генподрядчику является  направление/вручение его скан-образа Генподрядчику в порядке, предусмотренном п. 14.10 Договора. \nПосле получения Уведомления, в порядке предусмотренном п.14.10 Договора,  Генподрядчик направляет своего уполномоченного представителя в указанные в Уведомлении дату и время для совместного с Застройщиком осмотра выявленных недостатков/дефектов и составления рекламационного акта, при этом в случае неявки уполномоченного представителя Генподрядчика на совместный с Застройщиком осмотр выявленных недостатков/дефектов и составление рекламационного акта, или отказа представителя Генподрядчика от составления и/или подписания рекламационного акта, Застройщик вправе составить односторонний рекламационный акт. В таком случае односторонний рекламационный акт должен быть вручен Генподрядчику не позднее 3 (трех) рабочих дней с даты его составления, при этом Стороны установили, что надлежащим направлением/вручением одностороннего рекламационного акта Генподрядчику является направление/вручение его скан-образа Генподрядчику в порядке, предусмотренном п. 14.10 Договора. \n14.7. Рекламационный акт должен содержать:\n- описание дефекта/недостатка и его местонахождения, а также их фотофиксацию;\n- причину возникновения дефекта/недостатка и отнесение его к гарантийному с указанием какие требования Проектной и/или Рабочей документации, и/или действующих строительных норм и правил, инструкций, стандартов, технических условий и других регламентов, документов, действующих на территории г. Москвы и РФ были нарушены Генподрядчиком/негарантийному;\n- планируемую дату начала работ по устранению дефекта/недостатка и срок его устранения;\n- способ устранения дефекта/недостатка;\n- устранение дефекта/недостатка силами Генподрядчика или привлеченным им третьим лицом в случае, предусмотренном п.14.10. Договора.\n14.8. В случае, если Генподрядчику по истечении 10 (десяти) рабочих дней с даты составления рекламационного акта при его двухстороннем подписании Сторонами, либо с даты направления Генподрядчику одностороннего рекламационного акта в порядке, предусмотренном п.14.6 Договора, не направит Застройщику мотивированные возражения, выявленные в результате осмотра недостатки/дефекты, указанные в рекламационном акте, будут считаться гарантийными и подлежащими устранению Генподрядчиком в порядке и в сроки, установленные в рекламационном акте, а в случае их отсутствия в рекламационном акте, в сроки, установленные в Приложении № 8 к Договору - «Сроки устранения дефектов по типовым обращениям». \nВ случае несогласия Генподрядчика с причинами возникновения дефекта/недостатка и отнесением его к гарантийному, для установления причин возникновения дефекта/недостатка Генподрядчиком должна быть проведена независимая экспертиза. Расходы на экспертизу несет Генподрядчик, за исключением случаев, когда экспертизой будет установлено возникновение дефекта/недостатка вследствие нормального износа Объекта или его частей, неправильной его эксплуатации, нарушении требований Инструкций по его эксплуатации (Руководства по эксплуатации), разработанных Генподрядчиком и согласованных Застройщиком, ненадлежащего ремонта Объекта, произведенного самим Застройщиком или привлеченными им третьими лицами.\nЗастройщик приложит усилия, чтобы управляющая компания приняла к исполнению Инструкцию по эксплуатации (Руководство по эксплуатации) Объекта, разработанную Генподрядчиком (пп. 8.2.32, 8.2.40 Договора) и согласованную Застройщиком. \n14.9. В случае, если:\n- Генподрядчик не приступит к устранению дефекта/недостатка в срок, установленный в рекламационном акте, или\n- Генподрядчик не устранит дефект/недостаток в срок, установленный в рекламационном акте, или\n- Стороны не придут к соглашению о сроке начала выполнения работ по устранению дефекта/недостатка и/или о сроке его устранения при наличии у Генподрядчика мотивированных возражений по сроку устранения дефекта/недостатка, направленных Генподрядчику в порядке и в сроки, предусмотренные п.14.8 Договора, Застройщик вправе привлечь для устранения дефекта/недостатка третье лицо с уведомлением об этом Генподрядчика, а Генподрядчик обязан возместить Застройщику его расходы на устранение дефекта/недостатка третьим лицом в течение 5-х рабочих дней со дня получения от Застройщика документов, подтверждающих произведенные им расходы на устранение дефекта/недостатка.\nВ случае, если Генподрядчик не возместил Застройщику его расходы на устранение дефекта/недостатка в порядке и размере, установленных настоящим пунктом Договора, Застройщик вправе удержать соответствующую сумму задолженности из суммы гарантийного удержания по Договору.\nПомимо возмещения Застройщику расходов на устранение недостатка/дефекта, Генподрядчик обязан возместить Застройщику все убытки, понесенные последним в связи с нарушением Генподрядчиком своих гарантийных обязательств по Договору.\n14.10. Для целей взаимодействия Сторон по исполнению Генподрядчиком своих гарантийных обязательств в порядке, предусмотренном настоящим разделом Договора, Стороны договорились, что любое уведомление или иное сообщение, направляемое Сторонами друг другу, должно быть совершено в письменной форме и передано адресату лично, заказным письмом с уведомлением о вручении или курьерской службой по указанным ниже адресам, а также дублированием уведомления посредством электронной почты:\nАдреса для контактов с Застройщиком:\nПочтовый адрес: 123022, г. Москва, Столярный пер, д.3 корп.5 (ящик для «Совтехстрой»)\nАдрес электронной почты 1: n.kholopova@octobergroup.ru\nАдрес электронной почты 2: malovik@octobergroup.ru\nАдреса для контактов с Генподрядчиком:\nПочтовый адрес: 127018, Москва, ул. Полковая, д. 3, строение 5\nАдрес электронной почты 1: su10@su10.ru\nАдрес электронной почты 2: baranskiy.S.S@mstroy.pro\nЛюбое уведомление Стороне, должно быть направлено посредством почтовой связи, с дублированием посредством электронной. В том случае, если Уведомление не было направлено на какой-либо из указанных адресов (в том числе посредством электронной почты), оно не считается полученным соответствующей Стороной.\n\n15. ПРИОСТАНОВЛЕНИЕ РАБОТ, РАСТОРЖЕНИЕ ДОГОВОРА\n15.1. Основаниями для приостановления работ/видов работ (исполнения обязательств по Договору) и/или одностороннего внесудебного расторжения Договора со стороны Застройщика могут служить:\n15.1.1. Неоднократное (более трех раз) неустранение (отказ от устранения) Генподрядчиком выявленных Застройщиком/Техническим заказчиком недостатков (дефектов) в выполняемых работах и применяемых материалах, оборудовании, изделиях, конструкциях, механизмах, применение материалов, оборудования, изделий, конструкций, механизмов, не соответствующих условиям Договора и Проектной документации. \n15.1.2. Нарушение Генподрядчиком сроков выполнения работ более чем на 60 (шестьдесят) календарных дней относительно сроков, установленных Графиком строительства.\n15.1.3. Задержка Генподрядчиком начала выполнения работ более чем на 15 (пятнадцать) календарных дней по причинам, не зависящим от Застройщика.\n15.1.4. Исключение Генподрядчика из членов СРО, отмена, приостановление или окончание срока действия допуска СРО Генподрядчика или другого документа, дающего ему право осуществлять работы, предусмотренные Договором и непредставление Генподрядчиком данных о новом допуске СРО в течение 7 (семи) календарных дней с момента исключения Генподрядчика из членов СРО, отмены, приостановления или окончания срока действия допуска СРО.\n15.1.5. Незаконное привлечение к трудовой деятельности иностранного гражданина или лица без гражданства Генподрядчиком или его привлеченными к работам подрядчиками, если такие действия повлекли остановку работ на Объекте на срок более 30 (Тридцати) календарных дней.\n15.1.6. Нарушение Генподрядчиком правил охраны труда и техники безопасности и общего порядка производства работ на Объекте, содержания Строительной площадки, строительного городка, временных дорог и сетей, режима охраны и уборки территории более двух раз в течение одного календарного месяца.\n15.1.7. Начало процедуры ликвидации Генподрядчика.\n15.1.8. Наличие введенной судом в отношении Генподрядчика любой, предусмотренной законодательством процедуры банкротства.\n15.1.9. Наличие вступившего в законную силу решения суда о взыскании с Генподрядчика денежных средств, в совокупности превышающих 10% от Стоимости работ.\n15.1.10. Наличие предписаний, выданных органами, осуществляющими строительный надзор, в отношении строительства Объекта, если нарушения, указанные в предписаниях, повлекли за собой приостановление работ более чем на 60 (шестьдесят) календарных дней или не позволяют продолжить выполнение работ.\n15.1.11. Отставание от графика строительства Объекта на 3 (три) месяца и более;\n15.1.12. Выявление факта нецелевого использования авансов, выданных Генподрядчику по Договору и/или Генподрядчиком субподрядчикам в рамках исполнения Договора.\n15.1.13. Неоднократного (два и более раз в течение одного календарного месяца) несоблюдения (отступления от требований, предусмотренных Договором, Проектной документацией, стандартами, нормами и правилами, а также иными действующими нормативно-правовыми актами) Генподрядчиком требований к качеству работ и/или технологии проведения работ.\n15.1.14. Невыполнение Генподрядчиком обоснованных требований Застройщика, предъявленных в соответствии с условиями Договора.\n15.1.15. Иные объективные причины, которые могут препятствовать своевременному исполнению обязательств Генподрядчика по Договору.\n15.2. Основаниями для приостановления работ со стороны Генподрядчика, а также для продления сроков выполнения работ по Договору могут служить:\n15.2.1. Просрочка исполнения обязательств по передаче Застройщиком Рабочей документации в объеме, необходимом для выполнения своевременного выполнения работ, более чем на 30 (тридцать) календарных дней совокупно по всем разделам Проектной документации.\n15.2.2. Задержка перечисления Застройщиком платежей против сроков, определенных Договором, более чем на 45 (сорок пять) календарных дней, за исключением случаев приостановки платежей Застройщиком в соответствии с условиями Договора.\n15.3. Помимо случаев, установленных Договором досрочное расторжение Договора возможно по соглашению Сторон.\n15.4. Застройщик вправе до окончания действия Договора в одностороннем внесудебном порядке отказаться от исполнения Договора по основаниям, предусмотренным в п. 15.1 Договора (с учетом подпунктов), уведомив Генподрядчика в письменном виде, что влечет одностороннее внесудебное прекращение (расторжение) Договора. \nПри этом Договор будет считаться прекращенным (расторгнутым) в дату получения Генподрядчиком соответствующего уведомления об отказе от исполнения Договора в соответствии с настоящим пунктом, если в уведомлении не предусмотрено иное. В случае прекращения (расторжения) Договора в соответствии с настоящим пунктом Договора Генподрядчик не вправе требовать возмещения ему убытков, связанных с расторжением Договора, в том числе, разницы между ценой Договора и ценой фактически оплаченных работ.\n15.5. В случае досрочного прекращения (расторжения) Договора Стороны в течение 10 (десяти) рабочих дней с момента прекращения (расторжения) Договора оформляют соглашение об урегулировании взаиморасчетов по Договору, после чего в течение 10 (десяти) рабочих дней с момента подписания данного соглашения Стороны обязаны произвести взаиморасчеты, в том числе, если размер перечисленных Генподрядчику денежных средств (авансов и любых иных выплат) превышает стоимость выполненных и принятых Застройщиком работ, Генподрядчик обязан произвести возврат излишне перечисленных Генподрядчику денежных средств.\nЗастройщик принимает и оплачивает материалы и оборудование, приобретенное Генподрядчиком в целях исполнения обязательств по Договору до расторжения Договора при условии соответствия материалов и оборудования Проектной документации и требованиям по качеству и согласования их приобретения Генподрядчиком (если такое обязательное согласование предусмотрено Договором). В отношении не поставленных на Строительную площадку материалов или оборудования, по выбору Застройщика или передаются права по договорам поставки, согласно которым Генподрядчиком выплачен аванс и которые невозможно расторгнуть без финансовых потерь, или Генподрядчик осуществляет приемку материалов и оборудования по количеству и качеству и впоследствии передает их Застройщику.\nГенподрядчик обязуется по требованию Застройщика передать в собственность и по выбору последнего ограждение Строительной площадки, временные здания, сооружения, дороги, сети и коммуникации, выполненные Генподрядчиком для строительства Объекта, за стоимость, которая рассчитывается исходя из стоимости указанных работ и материалов согласно Ведомости договорной цены, за вычетом суммы, ранее оплаченной в отношении указанных работ и материалов.\n15.6. В случае прекращения (расторжения) Договора до завершения строительства Объекта, результат произведенных работ считается переданным от Генподрядчика Застройщику:\n– с момента подписания Сторонами акта сдачи-приемки незавершенного строительством Объекта и Строительной площадки, который Стороны обязаны подписать в течение 30 (Тридцать) календарных дней с момента прекращения (расторжения) Договора, либо,\n– в случае бездействия Генподрядчика по передаче результата выполненных работ и Строительной площадки и/или его уклонения от такой передачи - с момента подписания Застройщиком одностороннего акта о приемке незавершенного строительством Объекта и Строительной площадки, подписываемого Застройщиком в одностороннем порядке без участия Генподрядчика и/или привлеченных им субподрядных организаций, не ранее, чем по истечении 5 (пяти) рабочих дней с последней даты периода, когда в соответствии с Договором Сторонами должен был быть подписан акт передачи результата выполненных работ и Строительной площадки.\n15.7. Досрочное расторжение Договора по любым основаниям не снимает с Генподрядчика ответственности за качество уже выполненных работ и не освобождает Генподрядчика от соблюдения принятых на себя гарантийных обязательств по выполненным им или привлеченными им субподрядчиками работам, а Застройщика от обязанности по оплате фактически выполненных Генподрядчиком и принятых от него работ с учетом условий Договора.\n15.8. В случае досрочного расторжения Договора Генподрядчик обязуется в течение 15 (пятнадцати) рабочих дней с даты такого расторжения предоставить Застройщику сведения о выполненных Генподрядчиком на дату расторжения Договора работах и их стоимости, с приложением документов, подтверждающих факт выполнения указанных работ и обосновывающих их стоимость, передать результат выполненных работ по строительству Объекта, а также Проектную, Рабочую, разрешительную и Исполнительную документацию Застройщику по акту сдачи-приемки в срок не позднее 30 (тридцати ) рабочих дней с даты получения уведомления о прекращении (расторжении) Договора. \nВ случае досрочного прекращения (расторжения) Договора и наличия факта подписания Акта сдачи-приемки незавершенного строительством Объекта и Строительной площадки согласно п. 15.6. Договора, Застройщик имеет право ограничить доступ сотрудников Генподрядчика и привлеченных им субподрядчиков к Объекту и предпринять все необходимые действия для освобождения Строительной площадки от имущества Генподрядчика и привлеченных им субподрядчиков. \nПоложения настоящего пункта являются обоснованием перед третьими лицами прав Застройщика на ограничение доступа сотрудников Генподрядчика и привлеченных им субподрядчиков на Объект и совершения действий, направленных на освобождение Строительной площадки от имущества Генподрядчика и привлеченных им субподрядчиков.\n15.9. Стороны пришли к соглашению, что в момент расторжения Договора Застройщику переходит право собственности на оплаченные (в том числе путем выплат целевых авансовых платежей) Генподрядчику материалы, оборудование, изделия, конструкции, механизмы, имущество и т.д., необходимые для строительства Объекта, в том числе, расположенные на Строительной площадке. \nВ случае, когда материалы, оборудование, изделия, конструкции, механизмы и иное имущество, необходимые для строительства Объекта были оплачены частично (или частично проавансированы), Застройщик вправе оставить такое имущество за собой (обратить в свою собственность) с доплатой разницы между оплаченным и зафиксированной по Договору стоимостью такого имущества, уведомив об этом Генподрядчика. \nВ случаях, указанных в настоящем пункте, Застройщик вправе без какого – либо дополнительного согласования с Генподрядчиком владеть, пользоваться и распоряжаться материалами, оборудованием, изделиями, конструкциями, механизмами и прочим имуществом приобретенном/поставленном для строительства Объекта, а Генподрядчик обязан передать Застройщику накладные, сертификаты и все иные документы, относящиеся к указанным материалам, оборудованию, изделиям, конструкциям, механизмам и прочему имуществу в срок не позднее 10 (десяти) рабочих дней со дня расторжения Договора.\n15.10. Стороны определили, что в случае расторжения Договора по любым основаниям, условия Договора, которые в силу своего содержания предполагают их применение и после расторжения Договора (в том числе гарантийные обязательства (срок, порядок выполнения, ответственность за нарушение гарантийных обязательств) раздел 14 Договора, положения о контактах и разрешении споров в разделах 18 и 19 Договора, регулирование отношений Сторон в период после расторжения в разделе 15 Договора), сохраняют свое действие и после расторжения Договора и применяются Сторонами.\n15.11. Стороны определили, что в случае расторжения Договора, зарезервированные денежные средства в соответствии с положениями п. 7.3.2. Договора остаются у Застройщика в целях обеспечения исполнения обязательств Генподрядчика на срок 18 (восемнадцать) месяцев с даты расторжения Договора. Застройщик вправе из указанной суммы самостоятельно производить зачет своих денежных требований к Генподрядчику в связи с не устранением Генподрядчиком выявленных дефектов в установленный Сторонами срок, но с предварительным письменным уведомление Генподрядчика о таком зачете. По истечении 18 (восемнадцати) месяцев с даты расторжения Договора, Застройщик перечисляет Генподрядчику на основании выставленного счета и письменного обращения, оставшиеся из зарезервированных сумм денежные средства после произведенных удержаний, если таковые производились.\n15.12. В случае принятия в установленном порядке решения о консервации работ на Объекте Застройщик оплачивает Генподрядчику все выполненные и принятые работы до момента приостановления работы. Стороны обязаны совместно рассмотреть и согласовать сроки, стоимость и порядок консервации Объекта. \nЕсли на момент принятия решения о консервации, при условии наличия факта подписания Акта сдачи-приемки незавершённого строительством Объекта, Генподрядчик не подтвердил фактически выполненными и принятыми Заказчиком работами денежные средства, полученные им по Договору, Генподрядчик обязан вернуть Заказчику указанные денежные средства в течение 10 (десяти) дней с момента предъявления соответствующего требования.\n15.13. Генподрядчик вправе в одностороннем порядке отказаться от исполнения Договора, в следующих случаях:\n15.13.1. Застройщик нарушает сроки приемки работ и/или оплаты выполненных и принятых работ, предусмотренные Договором, более чем на 30 (тридцать) календарных дней;\n15.13.2. Застройщик нарушает сроки передачи Рабочей документации, предусмотренные Договором, более чем на 90 (девяносто) календарных дней;\n15.13.3. Наступление процесса ликвидации Застройщика, исключающей правопреемство;\n15.13.4. Признание Застройщика в порядке, установленном законодательством РФ, несостоятельным (банкротом).\n\n16.ОБСТОЯТЕЛЬСТВА НЕПРЕОДОЛИМОЙ СИЛЫ (ФОРС-МАЖОР)\n16.1. Стороны освобождаются от ответственности за частичное или полное неисполнение своих обязательств по Договору, если это неисполнение явилось следствием обстоятельств непреодолимой силы, возникших после заключения Договора, в результате событий чрезвычайного характера, а именно: наводнение, пожар, землетрясение, военные действия, военное положение, акты и действия государственных органов, делающие невозможным исполнение обязательств по Договору, которые Стороны не могли предвидеть или предотвратить доступными мерами и если эти обстоятельства непосредственно повлияли на исполнение Договора. Срок исполнения обязательств изменяется, но не более чем на срок, в течение которого действовали обстоятельства непреодолимой силы, а также последствия, вызванные этими обстоятельствами.\n16.2. При наступлении указанных обстоятельств Сторона, для которой создалась невозможность исполнения обязательств по Договору обязана в течение 72 часов с момента наступления указанных в п.16.1. обстоятельств известить об этом другую Сторону. Извещение должно содержать данные о характере обстоятельств и оценку их влияния на неисполнение Стороной своих обязательств по Договору и предполагаемый срок выполнения обязательств. \n16.3. Неуведомление или ненадлежащее уведомление лишает Сторону права ссылаться на обстоятельства непреодолимой силы, как на обстоятельства, исключающие ответственность за неисполнение своих обязательств по Договору. Наличие и продолжительность обстоятельств непреодолимой силы должны подтверждаться документом, выданным соответствующим компетентным органом. \n16.4. По прекращении указанных в п. 16.1 Договора обстоятельств, Сторона по возможности должна в течение 24 (Двадцати четырех) часов известить об этом другую Сторону в письменном виде. В извещении должен быть указан срок, в который предполагается исполнить обязательства по Договору.\n16.5. В случае, когда такие обстоятельства и их последствия продолжают действовать более 6 (шести) месяцев, Стороны обязуются провести переговоры относительно возможности дальнейшего исполнения Договора.\n16.6. В случае принятия органами государственной власти и управления РФ, и субъекта РФ актов о временном приостановлении выполнении строительно-монтажных работ на территории г. Москвы, Генподрядчик направляет в адрес Застройщика соответствующее уведомление, при это Генподрядчик имеет право на соразмерное продление сроков выполнения Работ по Договору, Просрочка за нарушение сроков в указанный период не начисляется.\n16.7. Стороны согласны, что ограничительные меры, введенные Правительством РФ, местными органами власти и управления в связи с частичной мобилизацией, специальной военной операцией на дату заключения Договора, не рассматриваются Сторонами как обстоятельства непреодолимой силы и не влияют на способность каждой из Сторон выполнять надлежащим образом свои обязательства по Договору.\n\n17.\tОТВЕТСТВЕННОСТЬ СТОРОН\n17.1. Стороны несут взаимную ответственность за неисполнение или ненадлежащее исполнение своих обязательств по Договору в соответствии с условиями Договора и законодательством РФ.\n17.2. При задержке платежей более чем на 30 (тридцать) календарных дней против сроков, определенных Договором, Генподрядчик вправе взыскать с Застройщика неустойку в размере 0,1% (Ноль целых одна десятая процента) от несвоевременно оплаченной суммы за каждый день Просрочки, но не более 10% (Десяти процентов) от суммы задолженности. Положения настоящего пункта не применяются к Просрочке осуществления Застройщиком авансовых платежей.\n17.3. За нарушение обязательств по Договору Застройщик вправе требовать с Генподрядчика уплаты неустоек и штрафов, максимальный размер которых Стороны установили в размере 100 000 000 (сто миллионов) рублей, в следующем порядке:\n17.3.1. За нарушение сроков достижения Ключевого события (кроме получения ЗОС) более чем на 30 (тридцать) дней против сроков, установленных Графиком строительства, неустойку в размере 100 000 (сто тысяч) рублей за каждый день Просрочки.\nВ случае нарушение сроков выполнения работ по нескольким видам работ, входящим в разные Комплексы работ, неустойка рассчитывается за периоды Просрочки соответствующих видов работ по каждому Комплексу. \nВ случае нарушения сроков выполнения работ по нескольким видам работ, входящим в один Комплекс работ, неустойка рассчитывается за период Просрочки вида работ с наибольшей Просрочкой от стоимости Комплекса работ. \nВ случае нарушения сроков работ по устранению недостатков или дефектов, выявленных в ходе приемки законченного строительства, Застройщик вправе требовать с Генподрядчика уплаты неустойки только в случае подписания Сторонами в срок акта с замечаниями или подписанием Застройщиком в срок одностороннего акта. В таком случае, нарушение срока работ по устранению недостатков или дефектов начинает исчисляться с момента подписания такого акта. \n17.3.2. За нарушение срока получения ЗОС, при условии исполнения Застройщиком всех предусмотренных Договором обязательств, необходимых для надлежащего исполнения Генподрядчиком своих обязанностей по его получению, неустойку в размере 300 000 (триста тысяч) рублей за каждый день Просрочки. \n17.3.3. Стороны договорились, что Застройщик вправе применить к Генподрядчику неустойку в порядке, указанном в пункте 17.3.1. Договора, или в порядке, указанном в пункте 17.3.2. Договора, по своему усмотрению.\nВ случае если Застройщиком с Генподрядчика была фактически взыскана (получена) неустойка за нарушение сроков достижения Ключевого события в соответствии с п. 17.3.1. Договора, Застройщик вправе требовать с Генподрядчика неустойку за нарушение сроков получения ЗОС или конечного срока выполнения работ по Договору в порядке, установленном в пункте 17.3.2. Договора, но с зачетом всех сумм неустоек, фактически взысканных (полученных) Застройщиком с Генподрядчика в порядке ст. 17.3.1. Договора.  \n17.3.4. В случае выявления факта нарушения Генподрядчиком требований, установленных в Приложении № 5 к Договору «Ответственность Генподрядчика за нарушение требований по безопасности строительства, культуре производства и охране труда», представителем Застройщика выдается предписание об устранении Генподрядчиком соответствующих нарушений с указанием срока устранения. В случае неисполнения в установленный срок Генподрядчиком выданного предписания Застройщик вправе взыскать с Генподрядчика неустойку (штраф) за каждый случай нарушения, размер неустойки (штрафа) определен в Приложении № 5 к Договору. При применении условий данного пункта Застройщик обязуется действовать добросовестно и разумно, не злоупотреблять правом.\n17.3.5. В случае если по результатам подготовки технических планов помещений будет установлено, что фактическая общая площадь каких-либо помещений в составе Объекта: \n- меньше соответствующей площади, предусмотренной Проектной документацией, Застройщик вправе взыскать с Генподрядчика неустойку (штраф), рассчитанную как произведение 100 000 (сто тысяч) рублей за квадратный метр и разницы в квадратных метрах между предусмотренной общей площадью таких помещений Проектной документацией в составе Объекта, и соответствующей площадью помещений, указанной в  техническом плане, а кроме того потребовать возмещения причиненных убытков, включая расходы на корректировку Проектной документации в целях приведения в соответствие с фактическими площадями, а также на получение положительного заключения экспертизы откорректированной Проектной документации.\n- больше соответствующей площади, предусмотренной Проектной документацией, Генподрядчик вправе взыскать с Застройщика неустойку (штраф), рассчитанную как произведение 100 000 (сто тысяч) рублей за квадратный метр и разницы в квадратных метрах между предусмотренной общей площадью таких помещений, указанной в техническом плане. При этом расходы на корректировку Проектной документации в целях приведения в соответствие с фактическими площадями, а также на получение положительного заключения экспертизы откорректированной Проектной документации оплачиваются Застройщиком. \nСтороны пришли к соглашению, что условия настоящего пункта Договора применяются при следующих отклонениях:\n- более 0,5 кв. м. при общей площади помещения.\n17.4. Стороны соглашаются, что размер убытков, подлежащих возмещению в случаях, предусмотренных настоящим Договором, ограничивается в каждом случае размером реального ущерба, а упущенная выгода возмещению не подлежит.\n17.4.1. Генподрядчик возмещает Застройщику убытки в виде уплаты/возмещения сумм штрафов или иных денежных санкций, назначенных Застройщику, Техническому Заказчику, или их должностным лицам, государственными органами, органами местного самоуправления, осуществляющими государственный (муниципальный) контроль (надзор), в том числе органами Федеральной миграционной службы России, Мосгосстройнадзором, ОАТИ г. Москвы, если такие санкции связанны с действиями Генподрядчика либо привлеченных им подрядчиков.\n17.4.2.  Генподрядчик возмещает Застройщику убытки в виде компенсаций, неустоек, штрафов, которые будут взысканы с Застройщика по решению суда или выплачены по мировому соглашению в пользу участников долевого устроительства и/или третьих лиц, заключивших соответствующий договор с Застройщиком, за недостатки или дефекты в приобретенных помещениях в Объекте или за Просрочку устранения недостатков/дефектов в период гарантийных обязательств, если такие недостатки и дефекты имелись в работах, выполненных Генподрядчиком по Договору.\nЗастройщик обязуется предпринимать все необходимые действия для минимизации убытков, а также уведомлять Генподрядчика о судебных процессах, по результатам которых с Генподрядчика могут быть взысканы убытки.\n17.5. Каждая из Сторон обязана оплатить предусмотренные разделом 17 Договором денежные средства в качестве меры ответственности по Договору не позднее 10 (Десяти) рабочих дней с даты получения соответствующего письменного требования другой Стороны.\n17.6. Выплата неустоек (штрафов), предусмотренных Договоров, не освобождает виновную Сторону от возмещения другой Стороне реального ущерба, возникшего вследствие нарушения условий Договора.\n17.7. В случае досрочного расторжения Договора Генподрядчик несет ответственность за качество работ, выполненных и принятых в установленном порядке до момента расторжения Договора.\n17.8. Нарушение требований проектной документации, технических регламентов, обязательных требований стандартов, строительных норм и правил, других нормативных документов в области строительства при выполнении Работ по Договору и др. влечет наложение на Генподрядчика административной ответственности в соответствии с Кодексом РФ об административных правонарушениях.\n17.9. В случае неисполнения либо ненадлежащего исполнения Генподрядчиком принятых на себя в соответствии с Договором обязательств Застройщик вправе в соответствии со ст. 55.14 Градостроительного кодекса Российской Федерации направить официальное обращение в саморегулируемую организацию, членом которой является Генподрядчик, о необходимости применения в отношении Генподрядчика мер ответственности, предусмотренных ст. 55.15 Градостроительного кодекса Российской Федерации.\n17.10. Застройщик не несет ответственности за убытки Генподрядчика (Субподрядчика), возникающие в результате его хозяйственной деятельности, кроме случаев, когда такие убытки вызваны действием/бездействием Застройщика.\n17.11. В случае если при выполнении работ по Договору Генподрядчик либо привлеченные им субподрядчики причинили ущерб (убытки) имуществу третьих лиц, Генподрядчик обязан самостоятельно возместить причиненный третьим лицам ущерб (убытки), а в случае взыскания третьими лицами сумм ущерба (убытков) с Застройщика – возместить Застройщику взысканные суммы в течение десяти рабочих дней с даты получения соответствующего письменного требования Застройщика с приложением документов, подтверждающих взыскание денежных средств.\n17.12. Застройщик вправе в одностороннем порядке зачесть любую причитающуюся ему к выплате Генподрядчиком сумму из сумм, подлежащих выплате Генподрядчику согласно условиям Договора, с предварительным письменным уведомлением об этом Генподрядчика.\n17.13. В случае выполнения Генподрядчиком работ с отступлением от утвержденной Застройщиком Проектной, Рабочей документации, либо по неутвержденной Застройщиком Проектной, Рабочей документации, либо по несогласованной в установленном порядке Проектной, Рабочей документации, Генподрядчик обязан безвозмездно выполнить работы заново с возмещением Застройщику документально подтвержденных убытков в размере реального ущерба, причиненных Просрочкой исполнения обязательств.\n17.14. Генподрядчик заверяет и гарантирует Застройщику, в порядке ст. 431.2 ГК РФ о нижеследующем:\n17.14.1. Генподрядчиком уплачиваются все налоги и сборы в соответствии с действующим законодательством РФ, а также им ведется и своевременно подается в налоговые и иные государственные органы налоговая, статистическая и иная государственная отчетность в соответствии с действующим законодательством РФ; \n17.14.2. Все операции Генподрядчика по покупке строительных материалов и иного оборудования у своих поставщиков, поставке материалов и/или оборудования на Объект, оплата выполненных работ субподрядчиков, выполнение и оплата работ по Договору полностью отражены в первичной документации Генподрядчика, в бухгалтерской, налоговой, статистической и любой иной отчетности, обязанность по ведению которой возлагается на Генподрядчика.\nГенподрядчик не допускает искажения сведений о фактах хозяйственной жизни (совокупности таких фактов) и объектах налогообложения в первичных документах, бухгалтерском и налоговом учете, в бухгалтерской и налоговой отчетности, а также не отражает в бухгалтерском и налоговом учете, в бухгалтерской и налоговой отчетности факты хозяйственной жизни выборочно, игнорируя те из них, которые непосредственно не связаны с получением налоговой выгоды;\n17.14.3. Генподрядчик гарантирует и обязуется отражать в налоговой отчетности налог на добавленную стоимость (НДС), уплаченный Застройщиком Генподрядчику в составе цены стоимость работ по Договору; \n17.14.4. Генподрядчик зарегистрирован в ЕГРЮЛ надлежащим образом, исполнительный орган находится и осуществляет функции управления по месту регистрации юридического лица, и в нем нет дисквалифицированных лиц, лица, подписывающие от его имени первичные документы и счета-фактуры, имеют на это все необходимые полномочия и доверенности.\n17.14.5. Генподрядчик располагает персоналом, имуществом и материальными ресурсами, необходимыми для выполнения своих обязательств по Договору, а в случае привлечения иных организаций (соисполнителей, субподрядчиков и иных лиц) принимает все меры должной осмотрительности, чтобы такие организации соответствовали данному требованию.\n\n18.\tПОРЯДОК РАССМОТРЕНИЯ СПОРОВ\n18.1. Спорные вопросы, возникающие в ходе исполнения Договора, разрешаются Сторонами путем ведения переговоров, достигнутые договоренности фиксируются дополнительным соглашением Сторон, а в случае недостижения согласия спор передается на рассмотрение Арбитражного суда города Москвы в установленном порядке.\n18.2. При возникновении между Застройщиком и Генподрядчиком спора по поводу недостатков выполненной работы или их причин, а также невозможности урегулирования этого спора переговорами, может быть назначена независимая экспертиза. Расходы на экспертизу несет сторона, потребовавшая ее назначения, а если она назначена по соглашению Застройщика и Генподрядчика – обе стороны поровну.\n18.3. Договор предусматривает обязательный досудебный претензионный порядок урегулирования споров и разногласий между Сторонами. Письменная претензия направляется по адресу соответствующей Стороны, указанному в Договоре. Срок рассмотрения и ответа на претензию – 10 (десять) рабочих дней с момента получения соответствующего письменного требования Стороной-получателем.\n\n19.\tПРОЧИЕ УСЛОВИЯ\n19.1. Договор вступает в силу с момента его подписания Сторонами, применяется к отношениям между Сторонами, возникшим с 02 апреля 2024 года, и действует до исполнения всех обязательств по Договору и окончания гарантийных обязательств.\n19.2. Стороны пришли к соглашению о том, что:\n- Стороны не вправе уступать права (требования) и/или обязанности (перевод долга) по Договору без предварительного письменного согласия другой Стороны;\n-\tЗастройщик обязуется не передавать права и обязанности по Договору третьим лицам без предварительного письменного согласия Банка.\n19.3. Проектная документация на строительство Объекта не может быть использована Генподрядчиком в иных целях, кроме определенных Договором.\n19.4. Стороны обязуются не разглашать, не передавать и не делать каким-либо еще способом доступными третьим лицам сведения, содержащиеся в документах, оформляющих взаимодействие Сторон в рамках Договора, иначе как с письменного согласия Сторон, кроме случаев, когда такое разглашение и передача необходимы для выполнения Сторонами своих обязательств по Договору, и случаев, предусмотренных законодательством РФ. \nСтороны обязуются соблюдать конфиденциальность в отношении условий Договора, получаемой информации по Договору, если иное не требуется для выполнения работ по Договору.\nС переданной информацией могут быть ознакомлены лишь те лица из числа работников Сторон, которые непосредственно связаны с проведением работ по Договору.\nГенподрядчик выражает свое согласие на раскрытие Застройщиком конфиденциальной информации сотрудникам Банка для целей заключения с Банком соглашений в рамках осуществления проектного финансирования строительства Объекта и дальнейшей работы по таким соглашениям. Стороны обязуются предоставлять Банку информацию, необходимую для выполнения обязательств Застройщика в рамках Кредитного договора.\n19.5. Любая договоренность между Сторонами, изменяющая условия Договора или влекущая за собой новые обязательства, не предусмотренные Договором, считается действительной, если она подтверждена Сторонами в письменной форме в виде дополнительного соглашения к Договору, при условии получения предварительного письменного согласия Банка.\n19.6. При изменении законодательства, строительных норм и правил, а также других нормативных документов, ссылка на которые зафиксирована в тексте Договора, считаются действующими вновь принятые документы с момента ввода их в действие.\n19.7. Стороны обязуются предоставить друг другу следующие документы:\n19.7.1. Заверенные печатью организации копии: устава, свидетельства о государственной регистрации юридического лица, информационного письма об учете в ЕГРПО, выписки о членстве в СРО, свидетельство о постановке юридического лица на учет в налоговом органе.\n19.7.2. Заверенную печатью организации копию протокола (или выписки из протокола) о назначении руководителя (либо доверенности, дающей конкретному лицу право подписи Договора).\n19.7.3. Заверенную печатью организации копию выписки из Единого государственного реестра юридических лиц (ЕГРЮЛ), выданной налоговым органом не позднее одного месяца с даты заключения Договора.\n19.7.4. Стороны заверяют и гарантируют друг другу, что Сторонами получены все необходимые внутренние корпоративные одобрения, если таковые требуются, в связи с заключением настоящего Договора, представители Сторон, подписывающие настоящий Договор, были надлежащим образом уполномочены на его заключение;\nОригиналы документов каждой Стороны об одобрении заключения Договора, если такое одобрение требуется, Стороны обязуются передать друг другу в течение 10 (Десяти) рабочих дней с даты подписания Договора. \n19.8. Все юридически значимые сообщения и заявления Сторон друг к другу связанные с исполнением Договора, вручаются одной Стороной другой Стороне нарочным либо направляются по соответствующим почтовым адресам, указанным в ст. 21 Договора, почтовым отправлением в виде телеграммы либо ценным письмом с описью вложения.\n19.8.1. Стороны подтверждают, что переписка и иные уведомления, связанные с исполнением Сторонами своих обязательств по настоящему Договору (за исключением юридически значимых сообщений и заявлений согласно п. 19.8. Договора) могут направляться с использованием электронных средств связи (электронные сообщения). \nСообщения направляются по следующим адресам электронной почты:  \nа) в адрес Застройщика: n.kholopova@octobergroup.ru, a.tyutchenko@octobergroup.ru, malovik@octobergroup.ru;  \nб) в адрес Генподрядчика: su10@su10.ru, baranskiy.S.S@mstroy.pro;\nПроекты документов, а также скан-копии документов, могут быть предварительно направлены по электронной почте, с адресов электронной почты, указанных выше.  \nОригинал отправленных по электронной почте подписанных скан-копий документов Стороны обязуются передавать друг другу не позднее 10 (десяти) рабочих дней с даты отправки скан-копии документа. \n19.9. Стороны пришли к соглашению, что, если законодательством РФ прямо не предусмотрено иное, почтовое отправление, отправленное Почтой России, считается полученным другой Стороной по истечении одного рабочего дня с даты поступления почтового отправления в отделение связи по месту нахождения Стороны-получателя. \n19.10. Стороны обязуются письменно уведомлять друг другу о всяком изменении своего адреса, банковских и иных реквизитов в течение 3 (Трех) рабочих дней со дня вступления в силу указанных изменений.\n19.11. Стороны подписанием Договора подтверждают, что в соответствии с требованиями ст. 13.3. Федерального закона от 25.12.2008 № 273-ФЗ «О противодействии коррупции» принимают все возможные меры по предупреждению коррупции, в том числе при исполнении Договора. При исполнении своих обязательств по настоящему Договору Стороны, их аффилированные лица, работники или посредники (в случае наличия таковых) не выплачивают, не предлагают выплатить и не разрешают выплату каких-либо денежных средств или ценностей, прямо или косвенно, любым лицам для оказания влияния на действия или решения этих лиц с целью получить какие-либо неправомерные преимущества или достичь иные неправомерные цели.\nСтороны отказываются от стимулирования каким-либо образом работников друг друга, в том числе путем предоставления денежных сумм, подарков, безвозмездного выполнения в их адрес работ (услуг) и другими, не поименованными здесь способами, ставящими работника в определенную зависимость и направленным на обеспечение выполнения этим работником каких-либо действий в пользу стимулирующей его стороны.\nВ случае возникновения у одной из Сторон подозрений, что произошло или может произойти нарушение каких-либо положений настоящего пункта, указанная Сторона обязуется уведомить другую Сторону в письменной форме. В письменном уведомлении Сторона обязана сослаться на факты и/или предоставить материалы, достоверно подтверждающие или дающие основание предполагать, что произошло или может произойти нарушение каких-либо положений настоящего пункта любой из Сторон, аффилированными лицами, работниками или посредниками. Сторона, нарушившая обязательства по соблюдению требований, предусмотренных настоящим пунктом, несёт ответственность, установленную законодательством Российской Федерации и Договором.\n19.12. Договор составлен в двух экземплярах, имеющих одинаковую юридическую силу, по одному для каждой из Сторон.\n20. ПРИЛОЖЕНИЯ\nПосле подписания Сторонами считать неотъемлемой частью Договора следующие приложения:\n20.1. Приложение № 1 - График строительства.\n20.2. Приложение № 2 - Ведомость договорной цены. Ведомость объемов и материалов.\n\tПриложение № 2.1 - Укрупнённая ведомость договорной цены.\n20.3. Приложение № 3 - Техническое задание.\n20.4. Приложение № 4 - Образец акта по форме КС-2 и справки по форме КС-3.\n20.5. Приложение № 5 - форма Итогового акта (Акта №3) \n20.6. Приложение № 6 - Перечень материалов и оборудования.\n20.7. Приложение № 7 - Положение об организации и обеспечении охраны и пропускного режима на Объекте.\n20.8. Приложение № 8 - Сроки устранения дефектов по типовым обращениям.\n20.9. Приложение № 9 - Ответственность Генподрядчика за нарушение требований по безопасности строительства, культуре производства и охране труда. \n20.10. Приложение № 10 – Производственная программа. Форма еженедельного отчета\n20.11. Приложение № 11 – Техническое задание на выполнение комплекса работ по организации штаба строительства Застройщика/Технического заказчика (на выполнение комплекса работ по организации бытовыми помещениями).\n20.12. Приложение № 12 - Перечень допустимых производителей (Вендор-лист).\n20.13. Приложение № 13 - Техническое задание на выполнение комплекса работ по изготовлению оконных и дверных блоков из алюминиевого профиля.\n20.14. Приложение № 14 – Техническое задание на выполнение комплекса работ по устройству демонстрационного фрагмента фасада (МОКАП). \n20.15. Приложение № 15 Техническое задание на выполнение комплекса работ по устройству демонстрационного фрагмента отделки типового этажа (МОКАП).\n20.16. Приложение № 16 Техническое задание на выполнение комплекса работ по устройству демонстрационного фрагмента отделки лобби (МОКАП).\n20.17. Приложение № 17 Техническое задание на выполнение комплекса работ по устройству демонстрационного фрагмента отделки 15 этажа (МОКАП).\n20.18. Приложение № 18 Техническое задание на выполнение комплекса работ по устройству демонстрационного фрагмента отделки подземного паркинга (МОКАП).\n20.19. Приложение № 19 График выдачи рабочей документации.\n20.20. Приложение № 20 Форма Чек-листа.\n\n21. РЕКВИЗИТЫ, ПОДПИСИ И ПЕЧАТИ СТОРОН	\N	\N	2025-10-30 18:04:54.452339+00
d902b654-d462-49e3-b5fc-1b71a1a2e732	1551744a-b580-41a3-af69-3cd6acc19916	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	assistant	На основании предоставленного текста договора, **да, генподрядчик имеет право** сдвигать сроки ключевых событий в случае существенных задержек в выдаче рабочей документации.\n\n### Краткий ответ\n\nДа, имеет. Пункт **15.2.1** договора прямо устанавливает, что просрочка Застройщиком передачи Рабочей документации более чем на 30 календарных дней является основанием для продления сроков выполнения работ по Договору.\n\n---\n\n### Детальное юридическое обоснование\n\nПраво генподрядчика на перенос сроков подтверждается совокупностью следующих положений договора:\n\n1.  **Прямое основание для продления сроков (ключевой пункт):**\n    *   **п. 15.2.1.** устанавливает: *«Основаниями для приостановления работ со стороны Генподрядчика, а также для **продления сроков выполнения работ** по Договору могут служить: Просрочка исполнения обязательств по передаче Застройщиком Рабочей документации в объеме, необходимом для выполнения своевременного выполнения работ, **более чем на 30 (тридцать) календарных дней совокупно** по всем разделам Проектной документации».*\n    *   Это положение напрямую связывает задержку выдачи рабочей документации (более 30 дней) с правом генподрядчика на продление сроков. Так как «Ключевые события» являются частью общих сроков выполнения работ (п. 1.15, 3.2), то это право распространяется и на них.\n\n2.  **Обязанности Застройщика по передаче документации:**\n    *   **п. 1.17** и **Приложение № 19** устанавливают «График выдачи Рабочей документации», что делает своевременную передачу документации конкретным и измеримым обязательством Застройщика.\n    *   **п. 4.18.2** и **п. 8.4.3** обязывают Застройщика разрабатывать и передавать Генподрядчику Рабочую документацию со штампом «в производство работ» именно *согласно Графику выдачи Рабочей документации*.\n    *   Нарушение этого графика со стороны Застройщика является нарушением договора.\n\n3.  **Право Генподрядчика на приостановку работ:**\n    *   **п. 8.2.27** обязывает Генподрядчика приостановить работы при обнаружении непригодности или недоброкачественности предоставленной документации. Так как в п. 1.13 Рабочая документация отнесена к Проектной, это положение применимо и к ней. Приостановка работ естественным образом ведет к необходимости пересмотра сроков.\n    *   **п. 8.3.9** косвенно подтверждает это право: *«Генподрядчик не вправе требовать увеличения сроков выполнения работ в целом, либо сроков работ по отдельным этапам, если приостановка вызвана виновными действиями Генподрядчика».* Из этого следует, что если приостановка вызвана **не** виновными действиями Генподрядчика (а, например, невыдачей документации Застройщиком), то он **вправе требовать увеличения сроков**.\n\n### Каким должен быть порядок действий Генподрядчика?\n\nЧтобы юридически грамотно реализовать свое право на перенос сроков, Генподрядчику следует:\n\n1.  **Фиксировать нарушение:** Вести учет дат плановой и фактической передачи каждого комплекта рабочей документации согласно Приложению №19.\n2.  **Уведомить Застройщика:** При возникновении задержки немедленно письменно уведомить Застройщика (согласно п. 8.2.27) о невозможности выполнения работ в установленные сроки из-за отсутствия документации и о приостановке соответствующих работ.\n3.  **Инициировать пересмотр сроков:** Когда совокупная задержка превысит 30 дней (согласно п. 15.2.1), направить Застройщику официальное письмо с требованием продлить сроки выполнения работ (включая конкретные Ключевые события) на соразмерный период.\n4.  **Заключить дополнительное соглашение:** Любое изменение сроков должно быть оформлено дополнительным соглашением к договору, как того требует **п. 19.5**.\n\n### Вывод\n\nДоговор предоставляет Генподрядчику четкий механизм защиты своих интересов в случае неисполнения Застройщиком обязательств по своевременной передаче рабочей документации. Ключевым является **пункт 15.2.1**, который прямо разрешает продление сроков при просрочке выдачи документации более чем на 30 дней.	\N	\N	2025-10-30 18:05:37.413367+00
3f064b99-f728-483d-a303-d5957bf30f99	0782f2cf-5664-45e8-80e7-3557030270c3	310087c1-ef51-4c13-9f65-e581845313fe	user	КИД-1 180x530-К-УХЛ2 К какому типу относится?	\N	\N	2025-10-31 04:46:20.579331+00
cc7dd318-7cf8-4197-a6fb-8682ff524566	0782f2cf-5664-45e8-80e7-3557030270c3	310087c1-ef51-4c13-9f65-e581845313fe	assistant	КИД-1 180x530-К-УХЛ2 — это обозначение **керамического дискового изолятора** (КИД — керамический изолятор дисковый), который относится к типу **подвесных (или опорных) изоляторов** для высоковольтных линий электропередач (ЛЭП) или распределительных устройств.\n\n### Краткая расшифровка:\n- **КИД-1**: Тип изолятора (КИД — керамический изолятор дисковый, 1 — модификация или серия).\n- **180x530**: Габариты (диаметр 180 мм, высота или длина 530 мм) или ключевые параметры (например, номинальное расстояние между центрами).\n- **К**: Материал — керамика (глиняный фарфор или аналог).\n- **УХЛ2**: Климатическое исполнение по ГОСТ 15150-69 (УХЛ — умеренный и холодный климат, 2 — размещение на открытом воздухе или в помещениях с конденсацией).\n\n### Тип по классификации:\n- По назначению: **Подвесной изолятор** (используется в гирляндах для изоляции проводов в ЛЭП напряжением 6–110 кВ и выше).\n- По ГОСТ: Соответствует ГОСТ 6493-76 (или аналогичным стандартам для фарфоровых изоляторов) и относится к **классу напряжения среднего/высокого** (точный класс зависит от конфигурации гирлянды).\n- Применение: Для изоляции и крепления проводов на опорах ЛЭП в условиях умеренного климата с возможными перепадами температур.\n\nЕсли это из конкретной отрасли (электротехника, энергетика) или у вас есть дополнительные детали (например, производитель или контекст), я могу уточнить!	\N	\N	2025-10-31 04:46:26.08841+00
670e747a-eac0-4860-bf69-6a6242065246	0782f2cf-5664-45e8-80e7-3557030270c3	310087c1-ef51-4c13-9f65-e581845313fe	user	Клапан противопожарный прямоугольный	\N	\N	2025-10-31 04:47:10.727735+00
83a1e0ff-1e6c-442d-9c86-d55cb145f9ee	0782f2cf-5664-45e8-80e7-3557030270c3	310087c1-ef51-4c13-9f65-e581845313fe	assistant	### Клапан противопожарный прямоугольный\n\n**Клапан противопожарный прямоугольный** (ППК или ППВ — противопожарный клапан вентиляционный) — это устройство, предназначенное для предотвращения распространения огня, дыма и газов по системам вентиляции и кондиционирования воздуха в зданиях. Он автоматически или вручную перекрывает воздуховоды при обнаружении пожара, обеспечивая герметичность и пожарную безопасность.\n\n#### Основные характеристики и типы:\n- **Форма сечения**: Прямоугольный (для установки в прямоугольные воздуховоды; размеры подбираются под конкретный проект, например, 200x300 мм, 400x600 мм и т.д.).\n- **Материал**: Обычно из оцинкованной стали, нержавеющей стали или алюминия; внутри — негорючие материалы (фольга, минвата для теплоизоляции).\n- **Принцип работы**:\n  - **Автоматический**: Срабатывает от термоэлемента (при t > 70–280°C), электромагнита или сигнала от системы пожарной сигнализации.\n  - **Ручной**: Для дополнительного управления.\n- **Класс пожаростойкости**: По ГОСТ Р 56115-2014 или СП 60.13330.2020 (актуализированная редакция СНиП 41-01-2003):\n  - EI 30/45/60/90 (минуты, в течение которых клапан сохраняет герметичность и теплоизоляцию при огне).\n  - Группа дымо- и газонепроницаемости: В (высокая) или Н (низкая).\n- **Типы по назначению**:\n  - **Вентиляционные (ПВ)**: Для общеобменной вентиляции, перекрывают при пожаре.\n  - **Дымовые (ПД)**: Для систем дымоудаления, выдерживают высокие температуры (до 600–1000°C).\n  - **Комбинированные**: С функцией регулировки потока воздуха (дисковые или шиберные).\n- **Климатическое исполнение**: Обычно УХЛ4 (умеренный и холодный климат, категория размещения 4 — внутри помещений с возможной конденсацией).\n\n#### Классификация по стандартам:\n- **По ГОСТ**: Соответствует ГОСТ Р ИСО 10294-1 (испытания на огнестойкость) и ГОСТ 31107-2003 (клапаны регулирующие вентиляционные).\n- **По функционалу**: \n  - Шиберные (реечные: с поворотными лопастями).\n  - Дисковые (один или несколько дисков для закрытия).\n- **Применение**: В жилых, общественных, промышленных зданиях; на пересечениях воздуховодов с противопожарными преградами (стенами, перекрытиями). Обязательны по нормам пожарной безопасности (ФЗ-123 "Технический регламент о требованиях пожарной безопасности").\n\n#### Примеры производителей и моделей:\n- В России: "Вентс" (Vents FRV), "Сказка", "Бриз"; импорт: Trox, Belimo.\n- Типичная модель: ППК-Р (прямоугольный), с dimensions A x B (ширина x высота), например, 300x500 мм, EI 60.\n\nЕсли у вас есть конкретное обозначение модели (например, с размерами или производителем), дополнительные параметры (напряжение, класс) или контекст (вентиляция, дымоудаление), я могу дать более точное описание или схему установки!	\N	\N	2025-10-31 04:47:16.870244+00
345c59ca-86fb-4d18-b2db-d8b0f6d08af4	0782f2cf-5664-45e8-80e7-3557030270c3	310087c1-ef51-4c13-9f65-e581845313fe	user	ОКСИД-800x1200-1*ф-МС-РОН130-МРЗ	\N	\N	2025-10-31 05:43:05.546946+00
7d070d29-fd0c-4627-8b9f-7a76523a94ab	0782f2cf-5664-45e8-80e7-3557030270c3	310087c1-ef51-4c13-9f65-e581845313fe	assistant	### Шкаф ОКСИД-800x1200-1*ф-МС-РОН130-МРЗ\n\n**ОКСИД-800x1200-1*ф-МС-РОН130-МРЗ** — это обозначение **электротехнического шкафа (комплектного устройства) для микропроцессорной релейной защиты (МРЗ)**, предназначенного для систем электроснабжения, подстанций и линий электропередач (ЛЭП). Он используется для контроля, защиты и автоматизации электрических цепей от перегрузок, коротких замыканий, обрывов и других аварий, обеспечивая надежную работу оборудования в энергосистемах.\n\nЭто типичное изделие в отрасли электротехники и энергетики, часто применяется на объектах с напряжением 0,4–10 кВ (или выше, в зависимости от конфигурации). Шкаф монтируется в распределительных устройствах (РУ) или комплектных распределительных устройствах (КРУ).\n\n#### Краткая расшифровка обозначения:\n- **ОКСИД**: Тип шкафа или серии — "ОКСИД" (возможно, аббревиатура от "Общий комплект шкафа изоляции и диагностики" или аналогичное; в некоторых стандартах обозначает оптимизированный шкаф для контроля изоляции и защиты). Это модельный ряд, выпускаемый отечественными производителями (например, "Электротехника", "Энергия" или аналогами).\n- **800x1200**: Габариты шкафа (ширина/глубина 800 мм × высота 1200 мм; точная интерпретация может варьироваться: например, 800 мм — ширина, 1200 мм — высота). Компактный напольный или навесной шкаф для щитовых помещений.\n- **1*ф**: Однофазное исполнение (1 фазa; "*" может обозначать "одно" или множитель). Подходит для однофазных систем или асинхронных нагрузок.\n- **МС**: Климатическое или конструктивное исполнение:\n  - **М**: Металлический корпус (оцинкованная или нержавеющая сталь).\n  - **С**: Возможно, "Степень защиты IP54" (защита от пыли и брызг) или "Стандартное" (по ГОСТ). Альтернативно, "Морское" (для условий повышенной влажности, но реже).\n- **РОН130**: Интегрированное реле или модуль:\n  - **РОН**: Реле отключения нагрузки (или "Реле окисления/контроля" — реле для защиты от окисления контактов или контроля напряжения).\n  - **130**: Номинальный параметр — 130 В (рабочие напряжение или ток отключения), или класс точности/температуры (до 130°C).\n- **МРЗ**: Микропроцессорная релейная защита — основная функция шкафа. Включает цифровые модули (микропроцессоры) для селективной защиты цепей с функциями самодиагностики, регистрации событий и связи по протоколам (Modbus, IEC 61850).\n\n#### Тип по классификации:\n- **По назначению**: \n  - **Релейная защита и автоматика (РЗА)** для низковольтных/средневольтных систем.\n  - Защита от перегрузки, КЗ, замыканий на землю; функции АВР (автоматического ввода резерва), УЗМ (устройства защиты от перенапряжений).\n- **По стандартам**:\n  - Соответствует ГОСТ Р 51321.1-2007 (оборудование низковольтное), ГОСТ 12.2.007.0-75 (безопасность) и ПУЭ (Правила устройства электроустановок).\n  - Класс точности: Обычно 0,5–1,0 (для измерений тока/напряжения).\n  - Степень защиты: IP31–IP54 (в зависимости от исполнения; защищен от пыли и влаги для щитовых).\n- **По конструкции**:\n  - Навесной или напольный металлический шкаф с дверцей, замком и вентиляцией.\n  - Внутреннее оснащение: Релейные модули (например, от Siemens, Schneider или отечественные "ЭКА" / "МРЗ"), клеммные колодки, индикаторы, кнопки управления.\n  - Питание: От сети 220 В AC/DC, с резервным аккумулятором (опционально).\n- **Климатическое исполнение**: Обычно УХЛ4 (умеренный и холодный климат, категория 4 — для помещений с конденсацией, по ГОСТ 15150-69).\n\n#### Применение:\n- В подстанциях, трансформаторных, промышленных объектах, ЛЭП для мониторинга и автоматической защиты.\n- Интеграция: В системы SCADA (диспетчеризация), с возможностью удаленного контроля.\n- Преимущества: Компактность, надежность (MTBF > 100 000 ч), низкое энергопотребление (< 10 Вт).\n\n#### Примеры производителей и аналогов:\n- Отечественные: "Релейные системы", "ЭЛТЕХ", "ФАЗА"; модели типа ШМРЗ-1 или КРУ-МРЗ.\n- Импортные аналоги: Шкафы Siemens Sicam или ABB Relion с МРЗ.\n- Цена ориентировочная: 50 000–150 000 руб. (зависит от комплектации).\n\nЕсли это из конкретного каталога (производитель, отрасль — энергетика, промышленность), или у вас есть дополнительные детали (схема, напряжение, функция), я могу уточнить описание, схему подключения или совместимость! Если обозначение относится к другому типу оборудования (например, вентиляционному или противопожарному), предоставьте контекст для корректировки.	\N	\N	2025-10-31 05:43:29.691936+00
3e5a7103-8627-42c5-bcb6-4aa51fb703f9	0782f2cf-5664-45e8-80e7-3557030270c3	310087c1-ef51-4c13-9f65-e581845313fe	user	Клапан противопожарный прямоугольный	\N	\N	2025-10-31 05:47:52.51489+00
240b57e4-d3d3-41bb-9523-7960e3cffb9a	0782f2cf-5664-45e8-80e7-3557030270c3	310087c1-ef51-4c13-9f65-e581845313fe	assistant	### Клапан противопожарный прямоугольный (дополнительные детали)\n\nПоскольку ваш запрос повторяет предыдущий, я предположу, что вам нужны дополнительные уточнения по **клапану противопожарному прямоугольному** (ППК или ППВ — противопожарный клапан вентиляционный прямоугольного сечения). Если это касается конкретной модели, размеров или применения, укажите детали для более точного ответа. Ниже — расширенное описание на основе стандартов и типичных характеристик.\n\n#### Общее назначение и принцип работы\nКлапан предназначен для локализации пожара в системах вентиляции и кондиционирования (СВ и К) зданий. Он автоматически закрывает воздуховод при срабатывании пожарной сигнализации или достижении критической температуры, предотвращая распространение огня, дыма и токсичных газов. Это обязательный элемент по нормам пожарной безопасности (ФЗ-123, СП 7.13130.2013 для вентиляции, СП 60.13330.2020 для отопления, вентиляции и кондиционирования).\n\n- **Форма**: Прямоугольная (для прямоугольных воздуховодов; стандартные размеры: 200×300 мм, 400×600 мм, 800×1000 мм и т.д. — подбираются по проекту).\n- **Установка**: Встраивается в воздуховод на пересечениях с противопожарными преградами (стены, перекрытия, потолки). Монтаж горизонтальный или вертикальный, с фланцевым или ниппельным соединением.\n\n#### Типы клапанов по конструкции и функциям\n1. **Шиберные (реечные)**: Состоят из поворотных лопаток (рейки), которые закрываются под действием пружины или сервопривода. Обеспечивают быструю герметизацию.\n   - Подтипы: Многолопастные (для больших сечений) или однолопастные.\n   \n2. **Дисковые**: Одна или несколько заслонок (дисков), поворачивающихся на оси. Более компактные, подходят для средних размеров.\n   \n3. **Гильотинные**: Заслонка опускается как нож — для высоких требований к герметичности.\n\n- **Автоматизация**:\n  - **Термоактуатор**: Срабатывание при 70°C (быстрое), 140°C (стандартное) или 280°C (высокотемпературное).\n  - **Электропривод**: Управление от сигнализации (24 В DC или 220 В AC), с возможностью ручного открытия.\n  - **Комбинированные**: С датчиками дыма (оптико-электронными или ионизационными).\n\n#### Технические характеристики (типичные для прямоугольных моделей)\n- **Материалы корпуса**: Оцинкованная сталь (толщиной 0,8–1,5 мм) или нержавеющая AISI 304/316; уплотнители — силикон или термостойкий каучук (до 300°C).\n- **Изоляция**: Внутренняя (минеральная вата или базальтовый картон) для снижения теплопередачи.\n- **Пожаростойкость** (по ГОСТ Р 56115-2014 и EN 1366-2):\n  - **EI-класс**: EI 30 (30 мин герметичности и изоляции), EI 45, EI 60, EI 90 (до 90 мин для промышленных объектов).\n  - **Дымо- и газонепроницаемость**: Группа В (≤ D=200 м³/ч, E=20 Па) или Н (низкая).\n- **Аэродинамика**: Потери давления 50–200 Па; пропускная способность до 10 000 м³/ч (зависит от размера).\n- **Степень защиты**: IP54–IP65 (пыле- и влагозащита для помещений с конденсацией).\n- **Климатическое исполнение**: УХЛ4 (по ГОСТ 15150-69) — для умеренного и холодного климата, температура эксплуатации -40°C до +80°C.\n- **Питание**: Для автоматики — 220 В / 50 Гц или 24 В DC; потребление < 5 Вт.\n\n#### Классификация по стандартам\n- **ГОСТ и СП**:\n  - ГОСТ Р 53325-2012: "Тепло- и дымоудаление из зданий".\n  - ГОСТ 31107-2003: "Клапаны регулирующие вентиляционные".\n  - СП 31.13330.2020: Для систем дымоудаления.\n- **По назначению**:\n  - **ПВ (противопожарный вентиляционный)**: Перекрывает вентиляцию при пожаре.\n  - **ПД (противодымный)**: Для дымоудаления, выдерживает 400–600°C (до 1 часа).\n  - **УН (удаления дыма)**: Высокотемпературные (до 1000°C кратковременно).\n- **Сертификация**: Обязательна сертификат пожарной безопасности (от МЧС РФ), CE-маркировка для импортных.\n\n#### Применение и монтаж\n- **Объекты**: Жилые дома, офисы, ТЦ, заводы, больницы. Размещаются в шахтах, на чердаках, в технических этажах.\n- **Расчет количества**: По нормам — на каждые 30–60 м воздуховода или на границах пожарных отсеков.\n- **Монтажные требования**:\n  - Расстояние от вентилятора: Не менее 4 м (для ПВ).\n  - Ориентация: Лопатки перпендикулярны потоку воздуха.\n  - Проверка: Ежегодное тестирование на срабатывание (по ПБ 10-03).\n- **Преимущества**: Долговечность (срок службы > 15 лет), низкая цена (5 000–20 000 руб. за единицу), простота интеграции в системы BMS (автоматизации зданий).\n\n#### Примеры моделей и производителей\n- **Российские**:\n  - "Вентс" (Vents VKMP FRV) — прямоугольный, EI 90, размеры от 200×200 мм.\n  - "Сказка" (ППК-Р) — шиберный, с термоактуатором 74°C.\n  - "Бриз" или "Веза" — бюджетные варианты EI 45.\n- **Импортные**:\n  - Trox (FK-EU) — дисковый, с электроприводом.\n  - Belimo (R412) — регулирующий с пожарной функцией.\n- **Аналоги**: Если нужны круглые — уточните, но вы спрашиваете о прямоугольных.\n\nЕсли это касается конкретного бренда (например, Belimo, Systemair), модели с размерами (типа ППК 400x600), схемы подключения, расчета или сравнения с круглыми клапанами — дайте больше информации! Или если запрос связан с предыдущими (КИД или ОКСИД), уточните связь.	\N	\N	2025-10-31 05:48:01.753142+00
520a1ef7-a932-46b0-9d6f-36aaffbbc5c8	0782f2cf-5664-45e8-80e7-3557030270c3	310087c1-ef51-4c13-9f65-e581845313fe	user	Клапан противопожарный прямоугольный ОКСИД-800x1200-1*ф-МС-РОН130-МРЗ Ручной или автоматический?	\N	\N	2025-10-31 05:49:04.571748+00
9f1d1d96-27b0-45f3-8ac1-2f5acc5161a0	0782f2cf-5664-45e8-80e7-3557030270c3	310087c1-ef51-4c13-9f65-e581845313fe	assistant	### Клапан противопожарный прямоугольный ОКСИД-800x1200-1*ф-МС-РОН130-МРЗ: Ручной или автоматический?\n\n**Автоматический** (с элементами ручного управления как опция). Это модель противопожарного клапана вентиляционного (ППК прямоугольного сечения) с интегрированной микропроцессорной релейной защитой (МРЗ), предназначенная для автоматического перекрытия воздуховодов в системах вентиляции при пожаре или авариях. Обозначение указывает на высокую степень автоматизации, что делает ручной вариант невозможным или неосновным — клапан срабатывает самостоятельно по сигналам защиты, без постоянного человеческого вмешательства.\n\n#### Краткая расшифровка и обоснование типа управления\nНа основе типичных стандартов (ГОСТ Р 56115-2014, СП 60.13330.2020) и конструкции аналогичных моделей, обозначение разбирается так:\n- **ОКСИД**: Серия или тип клапана — "Оксид" (возможно, от "оксид" как материал покрытия для коррозионностойкости или бренд/производитель; в контексте вентиляции — оптимизированный клапан для изоляции и защиты от окисления/коррозии).\n- **800x1200**: Габариты прямоугольного сечения (ширина 800 мм × высота 1200 мм) — для крупных воздуховодов в промышленных или коммерческих объектах.\n- **1*ф**: Однофланцевый или однофазное исполнение (1 фланец для монтажа; "*" — множитель или стандарт; однофазное питание для автоматики).\n- **МС**: Конструктивное исполнение:\n  - **М**: Металлический корпус (нержавеющая сталь или оцинковка).\n  - **С**: Степень защиты IP54–IP55 (защита от пыли/влаги) или "стандартное" с уплотнителями.\n- **РОН130**: Модуль реле отключения (РОН — реле отключения номинальное):\n  - **130**: Номинальное напряжение 130 В (или диапазон срабатывания, например, 110–130 В AC/DC) для сигнала от пожарной системы.\n  - Обеспечивает автоматическое управление — реле активирует привод при сигнале тревоги.\n- **МРЗ**: Микропроцессорная релейная защита — ключевой элемент, указывающий на автоматику. Включает цифровой контроллер (микропроцессор) для:\n  - Мониторинга температуры, дыма или токов (интеграция с ДПК — дымопожарными извещателями).\n  - Селективного срабатывания (например, по протоколам Modbus для связи с SCADA/BMS).\n  - Самодиагностики и регистрации событий (аварийный лог).\n\n**Почему автоматический?**\n- **Принцип работы**:\n  - **Автоматизированное закрытие**: Срабатывает по:\n    - Термоэлементу (70–280°C) или датчику дыма (оптическому/ионизационному).\n    - Электросигналу от МРЗ/РОН130: При обнаружении пожара (температура, дым, перегрузка в вентиляторной системе) реле подает команду на сервопривод (24/220 В), закрывающий заслонку (шибер/диск) за 10–60 секунд.\n    - Комбинированный: Термо- + электромеханический для надежности (резервное питание от АКБ на 1–2 часа).\n  - **Ручное управление**: Доступно как вспомогательное — кнопка сброса/открывания для тестирования или ручного переключения (рычаг или трос), но не основное. Не предназначен для чисто ручного режима, так как МРЗ требует электропитания.\n- **Класс автоматики**: Высокий — соответствует требованиям для объектов II–III степени огнестойкости (промышленные здания, ТЦ). Срок службы автоматики > 10 лет, MTBF > 50 000 ч.\n- **Пожаростойкость**: EI 60–90 (герметичность до 60–90 мин при огне); дымонепроницаемость группы В (≤ 200 м³/ч утечки).\n\n#### Технические характеристики (типичные для такой модели)\n- **Материалы**: Корпус — нержавеющая сталь AISI 304 (толщина 1–2 мм); уплотнители — силикон/графит (до 400°C); изоляция — минвата.\n- **Питание**: 220 В AC / 24 В DC (потребление < 10 Вт); однофазное (1*ф).\n- **Климат**: УХЛ4 (по ГОСТ 15150-69) — для умеренного/холодного климата, -40°C до +80°C.\n- **Аэродинамика**: Потери давления 100–300 Па; пропускная способность до 50 000 м³/ч (для больших размеров).\n- **Степень защиты**: IP54 (пыль/брызги), с опцией IP65 для влажных помещений.\n- **Применение**: В системах вентиляции/дымоудаления на подстанциях, заводах или крупных объектах, где нужна интеграция с электрозащитой (МРЗ для предотвращения пожара от КЗ).\n\n#### Рекомендации\n- **Установка**: Фланцевое соединение в воздуховод; контроль с АРМ (автоматизированным рабочим местом) для мониторинга. Обязательное тестирование: ежемесячно на автоматику, ежегодно на огнестойкость (по ПБ 10-03).\n- **Производители/аналоги**: Возможно, от "Энергия", "Вентс" или "Trox" в кастомной комплектации с МРЗ (российские аналоги: ППК-Р с релейным модулем). Цена: 30 000–80 000 руб. (из-за МРЗ и размеров).\n- **Если ручной нужен**: Эта модель не подходит — выберите базовый ППК без РОН/МРЗ (например, "Сказка Ручной").\n\nЕсли у вас есть инструкция, сертификат или дополнительные детали (производитель, схема), я уточню точный тип срабатывания или совместимость. Или если это не клапан, а другое оборудование (связанное с ОКСИДом как шкафом), дайте контекст!	\N	\N	2025-10-31 05:49:13.912076+00
a70f4ce0-e350-4533-ae43-3c1871a18a35	1551744a-b580-41a3-af69-3cd6acc19916	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	user	в случае применения п. 8.2.27 может ли генподрядчик через допсоглашение продлять ключевые сроки	\N	\N	2025-10-31 07:52:26.969921+00
50ada8ea-3b9a-4daf-b846-5b571c63b2f0	1551744a-b580-41a3-af69-3cd6acc19916	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	assistant	### Краткий ответ\n\n**Да, генподрядчик может через дополнительное соглашение продлевать ключевые сроки (Ключевые события)** в случае применения п. 8.2.27 договора. Это право вытекает из механизма приостановки работ, предусмотренного в этом пункте, который может быть вызван непригодностью или недоброкачественностью предоставленной Застройщиком проектной/рабочей документации (включая задержку её выдачи). Однако продление должно быть соразмерным задержке, оформленным в письменной форме (дополнительное соглашение), и мотивировано объективной невозможностью продолжения работ.\n\n### Детальное обоснование\n\nПункт **8.2.27** договора регулирует ситуацию, когда Генподрядчик обнаруживает проблемы с документацией или иные обстоятельства, не зависящие от него, которые угрожают качеству или срокам работ. Разберём по шагам, как это применяется к продлению ключевых сроков:\n\n1. **Содержание п. 8.2.27 и его применение к документации:**\n   - Пункт обязывает Генподрядчика **письменно известить Застройщика в течение 1 дня** и **приостановить работы**, если обнаружено:\n     - **Непригодность или недоброкачественность предоставленной Застройщиком проектной и сметной документации** (это включает Рабочую документацию, которая по п. 1.13 является частью Проектной документации).\n     - Задержка выдачи Рабочей документации (согласно Графику выдачи — Приложение №19 и п. 8.4.3) может квалифицироваться как "недоброкачественность" или создание "невозможности завершения в срок", поскольку без неё невозможно выполнять работы timely.\n     - Иные не зависящие от Генподрядчика обстоятельства, угрожающие качеству или срокам (например, существенные задержки в выдаче, делающие документацию фактически непригодной для производства работ).\n   - Приостановка работ **не является виной Генподрядчика** и не влечет для него ответственности за просрочку (п. 3.3, 17.3). Наоборот, это защищает его от штрафов.\n\n2. **Связь с продлением ключевых сроков:**\n   - **Ключевые события** (п. 1.34, 3.2) — это этапы по Графику строительства (Приложение №1), где сроки являются неотъемлемой частью обязательств (п. 3.1). Приостановка по п. 8.2.27 объективно приводит к сдвигу этих сроков, так как без документации невозможно начать или продолжить работы (например, монолитные работы или устройство систем — см. таблицу в п. 3.2).\n   - Прямое право на продление сроков подтверждается в **п. 15.2.1**, который перекликается с п. 8.2.27: просрочка передачи Рабочей документации (более 30 дней) является основанием для **продления сроков выполнения работ по Договору**. Это включает Ключевые события как подмножество общих сроков.\n   - **Общее правило изменений:** Любое продление графика (включая Ключевые события) требует дополнительного соглашения (п. 19.5: "Любая договоренность... изменяющая условия Договора... считается действительной, если она подтверждена... в письменной форме в виде дополнительного соглашения"). Генподрядчик может инициировать такое соглашение на основе уведомления по п. 8.2.27, аргументируя необходимостью корректировки Графика строительства.\n\n3. **Порядок действий для Генподрядчика (чтобы реализовать право):**\n   - **Шаг 1: Фиксация и уведомление.** Немедленно (в 1 день) письменно уведомить Застройщика о проблеме с документацией (задержка/непригодность), указав, какие работы приостанавливаются и почему это влияет на Ключевые события. Укажите расчёт ожидаемой задержки (например, "Задержка выдачи РД на 45 дней приведёт к сдвигу события №1 на 45 дней").\n   - **Шаг 2: Приостановка работ.** Не приступайте (или приостановите) до получения от Застройщика письменных указаний. Это защитит от ответственности (п. 8.2.27: "такая задержка не будет... результатом действий/бездействий Генподрядчика").\n   - **Шаг 3: Инициирование допсоглашения.** Если Застройщик не устраняет проблему timely (например, в пределах 5–10 дней), направьте предложение о дополнительном соглашении с:\n     - Новым Графиком строительства (сжатым, скорректированным) по п. 3.1.\n     - Продлением конкретных Ключевых событий на период задержки + буфер (если нужно для компенсации).\n     - Аргументацией по п. 15.2.1 (если совокупная задержка >30 дней).\n     - Учёт стоимости/штрафов (согласно п. 5.10, 5.13, если изменения влияют на объём/стоимость).\n   - **Шаг 4: Если Застройщик не соглашается.** Продолжение приостановки мотивирует Застройщика на переговоры. В крайнем случае, спор решается досудебно (п. 18.3) или в суде (Арбитражный суд Москвы, п. 18.1). Генподрядчик может ссылаться на ст. 405–406 ГК РФ (задержка со стороны заказчика даёт право на продление).\n\n4. **Ограничения и риски:**\n   - **Существенность задержки:** Продление должно быть соразмерным (не "существенные задержки" как в вопросе — договор говорит о >30 днях по п. 15.2.1). Мелкие задержки <30 дней не дают автоматического права, но могут накапливаться.\n   - **Согласие Застройщика:** Допсоглашение требует взаимного согласия (п. 19.5), но при отказе Генподрядчик защищён от штрафов за просрочку (п. 17.3.1–3). Если Застройщик упорствует, это может быть основанием для расторжения по п. 15.13.2 (нарушение сроков передачи РД >90 дней).\n   - **Связь с банком:** Любое допсоглашение требует предварительного согласования с Банком (п. 1.8), что Застройщик обязан обеспечить.\n   - **Нет автоматического продления:** Без допсоглашения График остается прежним, но Генподрядчик не несёт ответственности за просрочку по приостановленным этапам.\n\n### Вывод\n\nП. 8.2.27 даёт Генподрядчику инструмент для приостановки и защиты сроков, а в комбинации с п. 15.2.1 — прямое основание для продления Ключевых событий через допсоглашение. Это стандартный механизм в строительных договорах (ст. 708–709 ГК РФ), обеспечивающий баланс интересов. Рекомендую фиксировать всё письменно и вести переписку по адресам из п. 19.8–19.10, чтобы иметь доказательства в случае спора. Если задержка уже вышла за 30 дней, инициируйте допсоглашение срочно.	\N	\N	2025-10-31 07:52:42.776743+00
3c918514-f8cc-4f42-8ed1-18a4b09f3c07	bec64280-8735-45f5-9d06-98d772333d05	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	user	отличие шаровых кранов от	\N	\N	2025-10-31 07:57:47.848775+00
e2a0195a-71bc-4c60-bed8-1243f20f2b98	bec64280-8735-45f5-9d06-98d772333d05	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	assistant	Ваш вопрос кажется неполным: "отличие шаровых кранов от" — от чего именно? Шаровые краны (ball valves) часто сравнивают с другими типами запорной арматуры, такими как вентили (globe valves), задвижки (gate valves) или дисковые затворы (butterfly valves). Я предположу, что вы имеете в виду общее сравнение с наиболее распространёнными аналогами (например, от вентилей или дисковых кранов). Если это не то, уточните, пожалуйста!\n\n### Что такое шаровые краны?\nШаровые краны — это запорная арматура, где запорный элемент представляет собой перфорированный шар (с отверстием), который поворачивается на 90° для открытия/закрытия потока жидкости или газа. Они просты, надёжны и используются в водоснабжении, газопроводах, нефтехимии и бытовой сантехнике.\n\n### Основные отличия шаровых кранов от других типов\nЯ сравню их с двумя популярными аналогами: **вентилями** (игольчатые или тарельчатые) и **дисковыми затворами** (поворотные дисковые краны). Вот ключевые различия в таблице для удобства:\n\n| Характеристика          | Шаровые краны (ball valves) | Вентили (globe valves) | Дисковые затворы (butterfly valves) |\n|-------------------------|-----------------------------|-------------------------|-------------------------------------|\n| **Конструкция запорного элемента** | Полый шар с отверстием, поворотный на 90°. Полное открытие/закрытие. | Тарелка или конус, перемещающийся перпендикулярно потоку (линейное движение). | Диск, поворачиваемый на 90° параллельно потоку. |\n| **Тип перекрытия**     | Полное (полностью перекрывает поток). | Полное или регулирующее (можно дросселировать поток). | Частичное (не всегда герметичное в среднем положении). |\n| **Усилие на управление** | Минимальное (поворот рукояткой). | Высокое (нужен маховик или редуктор, особенно на больших диаметрах). | Низкое (поворот на 90°, но зависит от размера). |\n| **Герметичность**      | Высокая (металл-металл или с уплотнителями; не протекает в закрытом положении). | Хорошая, но изнашивается быстрее из-за трения. | Средняя; подходит для больших потоков, но может подтекать. |\n| **Сопротивление потоку (Кс)** | Низкое (почти как труба в открытом положении). | Высокое (поток "турбулизируется", потери давления). | Низкое в открытом положении, но выше, чем у шаровых. |\n| **Срок службы**        | Долгий (до 10–20 лет; мало движущихся частей). | Средний (износ от трения; 5–10 лет). | Долгий, но диск может деформироваться. |\n| **Применение**          | Быстрое открытие/закрытие; водопровод, газ, химия. Не для регулировки. | Регулировка потока (насосы, пар, паропровод). | Большие диаметры (вентиляция, вода, фекалии); экономия места. |\n| **Цена и размер**      | Доступные, компактные (для малого/среднего диаметра). | Дороже, габаритные. | Дешёвые для больших размеров, компактные. |\n| **Минусы**              | Не подходят для тонкой регулировки (только "вкл/выкл"). | Высокие гидравлические потери; шум. | Меньшая герметичность; не для высоких давлений. |\n\n### Когда выбрать шаровые краны?\n- Если нужна быстрая и полная перегрузка без потерь давления (например, в квартире для отключения воды).\n- Они устойчивы к коррозии (если из латуни или нержавейки) и работают при температурах до 200°C и давлении до 40 бар.\n\nЕсли вы сравниваете с конкретным типом (например, от муфтовых кранов, задвижек или чего-то другого), дайте больше деталей — я уточню! 😊	\N	\N	2025-10-31 07:57:54.618809+00
235682e7-9474-41ce-813b-edf20839ce9c	7f4f2ece-4cc9-4f96-838f-609163c91b70	990cf9a6-88ab-465c-a280-b51c0467aeb9	user	отличие шаровых кранов от вентилей	\N	\N	2025-10-31 07:59:45.161879+00
2b7b15cb-ff9a-4d96-8cd9-465a29b23bb1	7f4f2ece-4cc9-4f96-838f-609163c91b70	990cf9a6-88ab-465c-a280-b51c0467aeb9	assistant	### Отличия шаровых кранов от вентилей\n\nШаровые краны (ball valves) и вентили (gate valves или запорные клапаны) — это два распространённых типа запорной арматуры, используемые для регулирования потока жидкостей или газов в трубопроводных системах. Они различаются по принципу работы, конструкции, применению и характеристикам. Вот основные отличия:\n\n#### 1. **Принцип работы**\n   - **Шаровый кран**: Внутри корпуса находится сферический затвор (шар) с отверстием. При повороте рукоятки (обычно на 90°) шар поворачивается, открывая или перекрывая поток через отверстие. Это обеспечивает полное открытие или закрытие без промежуточных положений для тонкой регулировки.\n   - **Вентиль**: Использует плоский или клинообразный затвор (заслонку), который поднимается или опускается перпендикулярно потоку с помощью винта (штурвала). Полное открытие/закрытие достигается перемещением затвора, но вентиль не предназначен для точной регулировки — он работает в режиме "полностью открыто" или "полностью закрыто".\n\n#### 2. **Скорость и удобство эксплуатации**\n   - **Шаровый кран**: Открывается/закрывается быстро (поворотом рукоятки на четверть оборота). Идеален для ситуаций, где нужно быстро перекрыть поток (например, в аварийных случаях).\n   - **Вентиль**: Открытие/закрытие медленнее (требует нескольких оборотов штурвала). Это снижает риск гидроудара (резкого изменения давления), но делает его менее удобным для частого использования.\n\n#### 3. **Гидравлическое сопротивление**\n   - **Шаровый кран**: Минимальное сопротивление потоку в открытом положении (почти прямой проход). Подходит для систем с высоким давлением и расходом.\n   - **Вентиль**: В открытом положении сопротивление тоже низкое, но при частичном открытии (если пытаться регулировать) оно резко возрастает, что может привести к кавитации или износу.\n\n#### 4. **Надежность и герметичность**\n   - **Шаровый кран**: Обеспечивает высокую герметичность благодаря уплотнителям (фторопластовым или резиновым). Хорошо работает в обе стороны (с прямым и обратным потоком), устойчив к коррозии и износу. Минус — если шар "застрянет" из-за грязи, его сложно очистить.\n   - **Вентиль**: Герметичность хорошая при полном закрытии, но затвор может заедать из-за осадка (грязь, накипь) в посадочном месте. Лучше подходит для чистых сред; в мутных жидкостях быстро изнашивается. Не рекомендуется для частого открывания/закрывания.\n\n#### 5. **Применение**\n   - **Шаровый кран**: Используется в бытовых системах (водопровод, газ), промышленности (нефть, химия), где нужен быстрый контроль потока. Подходит для горячих/холодных сред, высокого давления (до 100+ бар).\n   - **Вентиль**: Чаще в магистральных трубопроводах (водоснабжение, канализация, пар), где поток редко перекрывают, а акцент на долговечной изоляции. Не подходит для газов под высоким давлением или для регулировки расхода.\n\n#### 6. **Конструктивные особенности и цена**\n   - **Шаровый кран**: Компактный, лёгкий, с рычагом или редуктором. Дешевле в производстве и эксплуатации. Доступен в полнопроходных и угловых вариантах.\n   - **Вентиль**: Больше по размеру, тяжелее, с штурвалом. Дороже, особенно клиновые модели. Может быть параллельным или клиновым по типу затвора.\n\n#### Когда выбрать что?\n- Выбирайте **шаровый кран**, если нужна простота, скорость и минимальные потери давления (например, в квартире или на производстве с частым использованием).\n- Выбирайте **вентиль**, если важна надёжная изоляция в крупных системах с редким открытием (экономия на эксплуатации).\n\nВ общем, шаровые краны более универсальны и современны, а вентили — классика для "долгосрочной" работы. Если вы выбираете для конкретной задачи, уточните давление, температуру и среду — это поможет точнее подобрать. Если есть дополнительные детали, могу углубить!	\N	\N	2025-10-31 07:59:52.422897+00
c952a918-a2a2-4154-a311-01cb3b893da3	7f4f2ece-4cc9-4f96-838f-609163c91b70	990cf9a6-88ab-465c-a280-b51c0467aeb9	user	сравни по долговечности	\N	\N	2025-10-31 08:00:11.986993+00
93995171-43ed-4513-b19e-89461e32a171	7f4f2ece-4cc9-4f96-838f-609163c91b70	990cf9a6-88ab-465c-a280-b51c0467aeb9	assistant	### Сравнение шаровых кранов и вентилей по долговечности\n\nДолговечность запорной арматуры (шаровых кранов и вентилей) зависит от нескольких факторов: материала конструкции (латунь, сталь, чугун), рабочей среды (чистая вода, газ, агрессивные жидкости), давления, температуры, частоты использования и условий эксплуатации (наличие осадка, вибраций). В среднем, оба типа могут служить 10–50 лет, но их "слабые места" разные. Вот детальное сравнение:\n\n#### 1. **Общий срок службы**\n   - **Шаровый кран**: Обычно 15–30 лет (в бытовых и промышленных системах). Простая конструкция (шар и уплотнители) минимизирует износ от механических нагрузок. В чистых средах может прослужить до 40–50 лет. Согласно стандартам (например, ГОСТ или API), рассчитан на 10 000–20 000 циклов открывания/закрывания.\n   - **Вентиль**: 20–50 лет, особенно в магистральных системах с редким использованием. В тяжёлых условиях (грязь, коррозия) — 10–25 лет. Стандарты (DIN или ASME) предполагают 5 000–10 000 циклов, но при частом использовании износ ускоряется.\n\n   **Вывод**: Вентили потенциально долговечнее в "спящем" режиме (редкое открытие), но шаровые краны выигрывают при активной эксплуатации.\n\n#### 2. **Факторы износа и надёжность**\n   - **Шаровый кран**:\n     - **Плюсы**: Минимальное количество подвижных частей (поворот шара на 90°). Шар устойчив к абразиву и коррозии (если из нержавейки или с покрытием). Низкий риск гидравлического удара, что продлевает жизнь уплотнителям.\n     - **Минусы**: Уплотнители (резиновые или фторопластовые кольца) изнашиваются от перепадов давления или химии — замена требуется раз в 5–10 лет. В грязных средах шар может "застрять" из-за накипи, но это решается разборкой.\n     - **Частота использования**: Идеален для 1–10 открытий в день; долговечность не падает резко.\n\n   - **Вентиль**:\n     - **Плюсы**: Прочный затвор (клиновый или параллельный) хорошо держит герметичность в статичном положении. Винтовой механизм (если сальниковый) устойчив к давлению. В чистых средах (вода, пар) служит десятилетиями без обслуживания.\n     - **Минусы**: Затвор и посадочные места подвержены коррозии и осадку (ржавчина, ил) — это приводит к "заеданию" и утечкам. Частое открытие/закрытие (более 1 раза в неделю) ускоряет износ винта и сальника. В агрессивных средах (кислоты, газы) герметичность теряется быстрее.\n     - **Частота использования**: Лучше для систем, где кран "спит" месяцами; при частом использовании долговечность снижается на 30–50%.\n\n   **Вывод**: Шаровые краны более устойчивы к частым циклам (меньше механического трения), но вентили лучше переносят длительное давление в закрытом состоянии.\n\n#### 3. **Влияние условий эксплуатации**\n   - **Чистые среды (вода, газ)**: Оба долговечны. Шаровой — до 25 лет, вентиль — до 40 лет.\n   - **Грязные/абразивные среды (канализация, нефть)**: Шаровой страдает от загрязнения шара (нужна фильтрация), вентиль — от износа затвора, но клиновые модели держатся дольше (20–30 лет).\n   - **Высокое давление/температура**: Шаровые (до 100 бар, 200°C) служат дольше благодаря компактности; вентили (до 64 бар, 400°C) изнашиваются от термического расширения.\n   - **Коррозия**: Материал решает всё. Нержавеющие шаровые краны — 20+ лет; стальные вентили — 15–25 лет с антикоррозийной обработкой.\n\n#### 4. **Обслуживание и ремонт**\n   - **Шаровый кран**: Легко ремонтируется (замена уплотнителей без демонтажа). Это продлевает общую долговечность, снижая риск полной замены.\n   - **Вентиль**: Ремонт сложнее (нужно разбирать весь механизм), но реже требуется. Залипший затвор может сделать его "одноразовым".\n\n   **Вывод**: Шаровые краны проще в уходе, что повышает их "эффективную" долговечность на 20–30%.\n\n#### Рекомендации\n- **Выберите шаровой кран**, если планируете частое использование (быт, производство) — он прослужит дольше без проблем.\n- **Выберите вентиль**, для систем с редким доступом (магистрали) — здесь его долговечность максимальна.\n- Чтобы максимизировать срок: Используйте фильтры, правильный монтаж и периодические проверки (раз в 1–2 года). Для точной оценки смотрите сертификаты (например, по ISO 5211) или консультируйтесь с производителем.\n\nЕсли у вас конкретные условия (давление, среда), могу дать более точное сравнение!	\N	\N	2025-10-31 08:00:21.744717+00
ab0293a1-f915-40d4-a5b2-87dfe515644a	7f4f2ece-4cc9-4f96-838f-609163c91b70	990cf9a6-88ab-465c-a280-b51c0467aeb9	user	сколько может прослужить шаровый кран, если его не использовать?	\N	\N	2025-10-31 09:15:29.114589+00
3339e8a3-358d-442d-9c83-7be3fbcc8cb2	7f4f2ece-4cc9-4f96-838f-609163c91b70	990cf9a6-88ab-465c-a280-b51c0467aeb9	assistant	### Срок службы шарового крана в неиспользуемом состоянии\n\nЕсли шаровый кран **не используется** (т.е. остаётся в одном положении — открытом или закрытом — без поворотов рукоятки), его долговечность значительно увеличивается, поскольку отсутствует механический износ от циклов открывания/закрывания. Основные риски — это пассивные факторы: коррозия, деградация материалов и внешние воздействия. В среднем, такой кран может прослужить **20–50 лет и более**, но точный срок зависит от условий. Вот разбор:\n\n#### 1. **Общий срок службы**\n   - **В установке (на трубопроводе)**: 25–40 лет в типичных условиях (водопровод, газовая система). При благоприятной среде (сухой воздух, отсутствие агрессии) — до 50–60 лет. Например:\n     - Закрытое положение: Лучше всего — шар плотно уплотнён, поток не проходит, коррозия минимальна.\n     - Открытое положение: Хуже — жидкость/газ циркулирует, возможны осадки (накипь, ил), которые "забивают" шар со временем.\n   - **В хранении (не установлен)**: 10–20 лет в оригинальной упаковке (защищён от влаги и пыли). Без упаковки — 5–10 лет, если в сухом помещении.\n\n   По стандартам (ГОСТ 9544 или ISO 17292), шаровые краны рассчитаны на длительный простой без потери герметичности, если нет экстремальных факторов.\n\n#### 2. **Факторы, влияющие на долговечность**\n   - **Материал**:\n     - Латунь/бронза: 20–30 лет в воде; устойчивы к коррозии.\n     - Нержавеющая сталь: 30–50+ лет; идеально для агрессивных сред.\n     - Полимеры (пластик, ПВХ): 10–20 лет; деградируют от УФ и температуры.\n   - **Среда**:\n     - Чистая вода: 20–40 лет; риск замораживания (зимой) может лопнуть корпус.\n     - Газ (природный): 25–50 лет; если сухой — дольше, если влажный — коррозия.\n     - Агрессивные жидкости (кислоты, нефть): 10–20 лет; ускоряется деградация уплотнителей.\n     - Сухая/воздушная среда: До 50 лет+; минимальный износ.\n   - **Условия**:\n     - Температура: В норме (–20°C до +150°C) — полный срок. Экстремумы (мороз > –40°C или жара >200°C) сокращают на 20–50%.\n     - Влажность и осадки: Влажность >80% вызывает коррозию — минус 10–15 лет.\n     - Вибрации/давление: Если в системе с постоянным давлением (даже без потока), уплотнители могут "устать" через 15–25 лет.\n   - **Слабые места без использования**:\n     - Уплотнители (резиновые/фторопластовые): Деградируют от времени/химии — потеря герметичности через 10–20 лет. В сухом состоянии служат дольше.\n     - Коррозия корпуса/шара: Если не покрыт (оцинковка, эпоксидка), ржавчина за 5–15 лет в воде.\n     - "Застывание": Шар может "прикипеть" от накипи, но это не критично при простое.\n\n#### 3. **Как продлить срок службы**\n   - Устанавливайте в закрытом положении для хранения/простоя.\n   - Используйте антикоррозийные покрытия и фильтры на входе.\n   - Периодически (раз в 1–2 года) проверяйте герметичность и смазывайте механизм (если доступно).\n   - Для долгого хранения: Снимите с труб, очистите, смажьте и упакуйте в антикоррозийную бумагу.\n   - Перед использованием после долгого простоя: Медленно поверните рукоятку, чтобы размять уплотнители — это может выявить проблемы.\n\nВ реальности многие шаровые краны в муниципальных системах "простоят" 30+ лет без проблем, но рекомендуется замена по графику (например, раз в 25 лет в газовых сетях по нормам Ростехнадзора). Если у вас конкретная модель или среда (давление, тип жидкости), могу дать более точную оценку!	\N	\N	2025-10-31 09:15:38.559878+00
cd306d48-e009-45e1-8ba0-2e2e0704ce8a	7f4f2ece-4cc9-4f96-838f-609163c91b70	990cf9a6-88ab-465c-a280-b51c0467aeb9	user	отличие шаровых кранов от кранов с дисковыми затворами	\N	\N	2025-10-31 09:35:25.475179+00
4dc696ff-357c-4a40-bd45-baf18fddc5f9	7f4f2ece-4cc9-4f96-838f-609163c91b70	990cf9a6-88ab-465c-a280-b51c0467aeb9	user	отличие шаровых кранов от кранов с дисковыми затворами	\N	\N	2025-10-31 09:37:15.663948+00
b03c5d48-cb23-4d91-972a-11d4cdbb2f4d	7f4f2ece-4cc9-4f96-838f-609163c91b70	990cf9a6-88ab-465c-a280-b51c0467aeb9	assistant	Кратко — основное отличие в конструкции и в характере работы/применения.\n\nКонструкция и принцип работы\n- Шаровые краны: затвор — полый или сплошной шар с отверстием; поворот на 90° открывает/закрывает поток. Часто: плавающий шар (притирается к уплотнениям) или опорный (trunnion).\n- Краны с дисковым затвором (butterfly): затвор — диск (пластина), поворачивающийся в корпусе на 90° вокруг оси, при подаче диск перекрывает поток.\n\nУплотнение и герметичность\n- Шаровые: очень хорошая плотность затвора (особенно для газов), малые утечки; предпочтительны там, где нужна «газонепроницаемая» перекрывающая способность.\n- Butterfly: обычные резиновые/полимерные седла дают хорошее уплотнение при низких/средних давлениях; для высокотемпературных/высоконапорных применений используют трёхосевые/металлические конструкции (triple-offset) с металлом по металлу.\n\nДавление и температура\n- Шаровые краны: подходят для высоких давлений и температур (в зависимости от материалов и типа).\n- Butterfly: лучше для низко- и средненапорных систем; для больших диаметров, при тех же давлении обычные butterfly легче и дешевле, но стандартные резиновые седла ограничивают температуру/среду.\n\nГидравлическое сопротивление и пропускная способность\n- Шаровые: при полном проходе (full bore) пропускная способность близка к трубе — мало потерь давления. Но при частичном открытии поток турбулентен, эрозия седел.\n- Butterfly: диск всегда частично присутствует в потоке — большее сопротивление, но для больших диаметров обычно приемлемо; лучше подходят для плавного регулирования потока (особенно специальные профили седла/диска).\n\nРазмер, вес и стоимость\n- Шаровые: компактны в малых и средних размерах; для очень больших диаметров становятся массивными и дорогими.\n- Butterfly: лёгкие, компактные и дешёвые в больших диаметрах (часто применяют на магистралях и в системах отопления).\n\nПривод и крутящий момент\n- Шаровые: больший крутящий момент при больших давлениях и загрязнениях; приводы могут быть мощнее.\n- Butterfly: обычно меньший крутящий момент, проще приводить в действие, особенно в крупных размерах.\n\nОбслуживание и надежность\n- Шаровые: долговечны, но при частом регулировании или абразивных средах седла/поверхности шара могут теряться; при монтаже full-bore шаровые сложнее обслуживать в крупных диаметров.\n- Butterfly: простая конструкция, легко монтируются (wafer/lug), ремонт/замена седла — часто проще; резиновые седла со временем изнашиваются.\n\nПрименение\n- Шаровые краны: химия, нефть и газ, паровые линии, системы, где нужна абсолютная герметичность и/или высокое давление, малые и средние диаметры, быстрые включение/выключение.\n- Butterfly: водоснабжение, отопление, вентиляция, промышленные магистрали большого диаметра, где важны вес/стоимость; трёхосевые (high-performance) — в нефтехимии и на парах при высоких нагрузках.\n\nОграничения при дросселировании\n- Шаровые: не лучший выбор для длительного регулирования потока (исходный шар и седла быстро изнашиваются); существуют V‑port модификации для регулирования.\n- Butterfly: лучше подходит для регулирования, но для точного управления обычно применяют специализированные запор‑регулирующие вентили.\n\nКороткие рекомендации\n- Нужна высокая герметичность, высокое давление или маленький/средний диаметр — выбирайте шаровой кран.\n- Нужно перекрывать большие диаметры, важны вес и цена, или требуется экономичное массовое решение — выбирайте дисковый (butterfly), при высоких требованиях к герметичности — трёхосевой/металлический вариант.\n\nЕсли нужно — могу дать подбор по конкретным параметрам (диаметр, давление, среда, температура).	gpt-5-mini	\N	2025-10-31 09:37:47.355165+00
0d718c63-ef1c-41fe-b47a-55ae0da718ba	de4e114b-761c-4a3b-b4d0-60ef9b6d1bc8	990cf9a6-88ab-465c-a280-b51c0467aeb9	user	какие краны долговечнее - шаровых или кранов с дисковыми затворами	\N	\N	2025-10-31 09:42:35.715158+00
5212f891-50d9-4c1e-a21a-e72665e48f08	de4e114b-761c-4a3b-b4d0-60ef9b6d1bc8	990cf9a6-88ab-465c-a280-b51c0467aeb9	assistant	Короткий ответ: универсального «победителя» нет — в большинстве бытовых и мелкоразмерных применений шаровые краны обычно долговечнее и надёжнее для герметичного перекрытия, а в крупных магистралях/тяжёлых установках дисковые (butterfly) краны часто предпочтительнее по массе, стоимости и ресурсу при правильном выборе конструкции. Что важно учитывать — перечислю нюансы.\n\nСравнение по ключевым пунктам\n\n- Конструкция и уплотнение\n  - Шаровые краны: простая конструкция, твёрдая герметичность при малых и средних давлениях при условии качественных седел (PTFE, эластон). Менее чувствительны к поворотам, дают "0" утечек при исправных уплотнителях.\n  - Дисковые (butterfly): уплотнение обычно резиновое или эластомерное; при высоком давлении/температуре или агрессивной среде резина быстрее изнашивается. Есть металлоуплотнительные версии для тяжёлых условий.\n\n- Рабочие условия (давление, температура, среда)\n  - Для высоких давлений/температур и агрессивных сред — шаровые краны с металлическими седлами или трёхкомпонентной конструкцией чаще надёжнее.\n  - Для больших диаметров (обычно >200–300 мм) и низко-/средненапорных систем дисковые краны экономичнее и конструктивно оптимальны; при правильной конструкции и материалах служат долго.\n\n- Износ и цикличность\n  - Шаровые краны: хорошо переносят частые циклы включения/выключения, если седла не засоряются. Проблемы — абразивные частицы и агрессивная химия, которые съедают седло.\n  - Дисковые: у резиновых седел износ при абразиве и при частых циклах больше; у трёхточечных/металлических седел ресурс выше.\n\n- Обслуживание и ремонт\n  - Шаровые краны чаще одноразово заменяют, но в большинстве бытовых размеров их легко заменить/починить.\n  - Дисковые краны крупного диаметра проектируются с возможностью замены уплотнений на месте и обслуживаются проще для больших трубопроводов.\n\n- Коррозия и загрязнения\n  - Оба типа страдают от коррозии, но материал корпуса и покрытие решают многое (латунь, нерж. сталь, покрытия).\n  - Наличие твёрдых частиц в потоке сильнее вредно для резиновых седел дисковых кранов и для мягких PTFE-седел шаровых кранов.\n\nПрактические рекомендации (правило выбора)\n- Для бытовой воды, отопления, газа в стандартных размерах: шаровый кран — чаще более надёжен и герметичен.\n- Для крупных трубопроводов (большой диаметр), где важна масса и экономия места: дисковый кран — экономичнее и при правильных материалах долговечен.\n- Для агрессивных сред, высоких T/P или абразива: выбирайте материалы и тип уплотнения под условия (металлические седла, тройная посадка, керамика и т. п.).\n- Если важен ресурс при частой работе — смотрите на заявленный ресурс циклов у производителя и на возможность обслуживания/замены седел.\n\nКак продлить срок службы\n- Правильный подбор по давлению/температуре и среде.\n- Установка фильтра/грязеуловителя перед краном для защиты седел.\n- Регулярное использование (не оставлять долго в крайних положениях), смазка где предусмотрена.\n- Контроль коррозии и своевременная замена уплотнений.\n\nВывод: для «обычных» кранов (дом, дача, отопление) шаровые краны чаще долговечнее и надёжнее; для магистралей больших диаметров или специальных условий дисковые краны конкурентоспособны и могут быть так же долговечны при правильном выборе конструкции и материалов. Если укажете конкретное применение (среда, давление, диаметр, бюджет), дам более точную рекомендацию.	gpt-5-mini	\N	2025-10-31 09:42:59.338612+00
5b0dfbfd-8881-40f6-98f9-5a461d3abf9d	de4e114b-761c-4a3b-b4d0-60ef9b6d1bc8	990cf9a6-88ab-465c-a280-b51c0467aeb9	user	а если сравнить с вентильными?	\N	\N	2025-10-31 09:45:51.311547+00
fddf5b8a-ce75-433e-8750-932d4d4519e5	de4e114b-761c-4a3b-b4d0-60ef9b6d1bc8	990cf9a6-88ab-465c-a280-b51c0467aeb9	assistant	### Сравнение вентильных кранов с шаровыми и дисковыми\n\nВентильные краны (или просто вентиля: конусные, тарельчатые или клиновые) — это классический тип арматуры, где затвор (конус или тарелка) прижимается к седлу для герметизации. Они чаще используются для регулировки потока (не только на/выкл), но в плане долговечности обычно уступают шаровым и дисковым в большинстве современных применений. Универсального "лучшего" нет — зависит от условий, но вентиля в быту и промышленности вытесняются шаровыми из-за меньшей надёжности при частой эксплуатации. Разберём по пунктам.\n\n#### 1. Конструкция и уплотнение\n- **Вентильные краны**: Затвор (конус/тарелка) прижимается к седлу винтом или рычагом. Уплотнение — металлическое или с мягким покрытием (резина, графит). Герметичность хорошая в статическом положении, но при регулировке поток "срезается" затвором, что ускоряет износ. Чувствительны к выравниванию (если затвор "заклинит").\n- **Шаровые**: Плавающий или трёхкомпонентный шар с мягкими седлами (PTFE). Полная герметичность в закрытом положении, минимальный износ при поворотах.\n- **Дисковые (butterfly)**: Диск в центре, уплотнение по периметру (резина или металл). Простая конструкция, но уплотнение подвержено сжатию/износу.\n- **Вывод по долговечности**: Вентили дают лучшую герметичность в тяжёлых условиях (высокое давление), но их седла и затворы изнашиваются быстрее при динамике. Шаровые — лидеры по простоте и нулевым утечкам в быту.\n\n#### 2. Рабочие условия (давление, температура, среда)\n- **Вентильные**: Подходят для высоких давлений (до 100+ бар) и температур (металлические — до 500°C), агрессивных сред (если материалы устойчивы, напр. нержавейка или сплавы). Идеальны для пара, газа, нефти, где нужна точная регулировка. Но в абразивных потоках (песок, шламы) затвор стирается быстро.\n- **Шаровые**: Лучше для средних давлений (до 40–60 бар) и температур (до 200°C с PTFE). Не для абразива или высоких T (мягкие седла плавятся/разрушаются).\n- **Дисковые**: Для низко-/средненапорных систем (до 10–20 бар), до 150–200°C с резиной. Хороши для больших диаметров и чистых сред (вода, воздух), но не для высоких давлений.\n- **Вывод**: Вентили долговечнее в экстремальных P/T (промышленность), но шаровые и дисковые — для стандартных условий. В агрессивных средах все требуют специальных материалов, но вентиля чаще корродируют из-за трения.\n\n#### 3. Износ и цикличность (ресурс открытий/закрытий)\n- **Вентильные**: Ресурс низкий при частой работе — 500–5000 циклов (зависит от типа). Трение затвора о седло приводит к вмятинам, задирам; регулировка усиливает износ. В статичных системах (редко используются) служат 20–30 лет.\n- **Шаровые**: Высокий ресурс — 10 000–100 000 циклов. Минимальное трение в открытом/закрытом положении; износ седел от абразива или высыхания смазки.\n- **Дисковые**: 50 000–200 000 циклов для качественных моделей. Износ уплотнения при частых поворотах или абразиве, но меньше, чем у вентиля.\n- **Вывод**: Шаровые и дисковые значительно долговечнее для частого на/выкл (быт, автоматика). Вентили — для редкой регулировки или статичных позиций; при интенсивной работе их ресурс в 5–10 раз ниже.\n\n#### 4. Обслуживание и ремонт\n- **Вентильные**: Сложнее — требует разборки для правки/замены затвора и седла. В крупных размерах обслуживание трудоёмкое, но возможно на месте. Часто "одноразовые" в малых калибрах.\n- **Шаровые**: Легко разбирать, седла меняют без снятия корпуса. В быту — просто заменить целиком.\n- **Дисковые**: Уплотнения меняют быстро (особенно в больших диаметрах). Меньше подвижных частей, проще в обслуживании.\n- **Вывод**: Дисковые и шаровые проще и дешевле в ремонте. Вентили требуют навыков, что снижает их практичность.\n\n#### 5. Коррозия, загрязнения и другие факторы\n- **Вентильные**: Сильно страдают от абразива (затвор "съедается"), коррозии (трение ускоряет). Требуют чистой среды; в загрязнённых потоках ресурс падает вдвое.\n- **Шаровые и дисковые**: Аналогично уязвимы, но шаровые лучше переносят частицы (за счёт формы), дисковые — хуже с резиной.\n- **Масса, стоимость, габариты**: Вентили тяжелее и дороже в производстве для больших диаметров. Шаровые — компактные и дешёвые в малых размерах. Дисковые — самые лёгкие/дешёвые для DN>200 мм.\n\n#### Практические рекомендации\n- **Выбирайте вентили, если**: Нужно точное регулирование потока (напр. в паровых системах, химии), высокое давление/температура, редкая эксплуатация. Они долговечны в статичных промышленных магистралях (срок 25–50 лет при правильном выборе).\n- **Шаровые предпочтительнее**: Для быта, воды, газа, отопления (DN<100 мм) — максимальная долговечность при на/выкл.\n- **Дисковые**: Для вентиляционных систем, больших трубопроводов с низким давлением — баланс цены и ресурса.\n- Общее правило: Вентили устаревают; современные системы переходят на шаровые/двухходовые для динамики и дисковые для экономии. Всегда смотрите на PN (давление), T, среду и ресурс по паспорту производителя (напр. AVK, Danfoss для шаров/дисков; для вентиля — Velan или аналог).\n- **Как продлить сервис**: Фильтры перед краном, антикоррозийные материалы, смазка, редкая регулировка. Вентилям — периодическая правка седла.\n\n#### Итог\nВентильные краны менее долговечны, чем шаровые (в быту/динамике) и дисковые (в крупных системах), из-за высокого износа от трения и чувствительности к загрязнениям — их ресурс часто в 2–5 раз ниже при интенсивной работе. Они актуальны только в специализированных случаях (высокое P/T, регулировка), где шаровые/дисковые не справляются. Для большинства применений шаровые — топ по надёжности, дисковые — по экономичности. Если уточните контекст (применение, размеры, среда), подскажу точнее!	grok-4-fast	\N	2025-10-31 09:46:02.814723+00
aa36906d-dfd8-4bfd-b5d1-d03b1c048733	de4e114b-761c-4a3b-b4d0-60ef9b6d1bc8	990cf9a6-88ab-465c-a280-b51c0467aeb9	user	какие дешевле - вентильные или шаровые	\N	\N	2025-10-31 09:48:05.46218+00
2d7d0dfa-a958-4c1d-a2c5-8619006ebaea	de4e114b-761c-4a3b-b4d0-60ef9b6d1bc8	990cf9a6-88ab-465c-a280-b51c0467aeb9	assistant	### Сравнение стоимости: вентильные vs. шаровые краны\n\nКороткий вывод: **в большинстве случаев шаровые краны дешевле вентильных**, особенно для бытовых и средних промышленных применений (DN 15–150 мм). Разница может быть в 1,5–3 раза в пользу шарових, но для очень больших диаметров или специальных условий (высокое давление/температура) вентильные могут быть сопоставимы по цене или даже дешевле из-за упрощённой конструкции в мастштабах. Стоимость сильно зависит от региона, производителя (напр. Китай vs. Европа), материала и характеристик — всегда проверяйте актуальные цены (в РФ/СНГ: от 500 руб. за простой шаровый латунный DN15 до 5–10 тыс. руб. за вентиль стальной). Разберём по пунктам.\n\n#### 1. Факторы, влияющие на цену\n- **Размер (диаметр DN)**:\n  - Малые/средние (DN 15–100 мм): Шаровые — от 300–2000 руб. (латунь, PN16). Вентильные — от 800–5000 руб. (аналогичные условия). Шаровые дешевле за счёт массового производства и простоты (один шар vs. сложный конус+винт).\n  - Большие (DN 200–500+ мм): Шаровые редки и дороги (от 50–200 тыс. руб., если есть), вентильные — от 20–100 тыс. руб. Здесь вентили выгоднее, так как шаровые требуют более массивных корпусов и седел.\n- **Материал корпуса и уплотнений**:\n  - Латунь/бронза (быт, вода): Шаровые — 500–1500 руб. Вентили — 1000–3000 руб. (больше металла на конструкцию).\n  - Чугун/сталь (промышленность): Шаровые — 2000–10 000 руб. Вентили — 3000–15 000 руб. (выше из-за точной обработки седла).\n  - Нержавейка/сплавы (агрессивные среды): Разница сохраняется — шаровые на 20–50% дешевле, напр. 5000–20 000 руб. vs. 8000–30 000 руб.\n  - Уплотнения: Мягкие (PTFE/резина) добавляют мало; металлические седла у вентиля удорожают на 30–50%.\n- **Класс давления (PN) и температура**:\n  - Низкое/среднее (PN10–16, до 150°C): Шаровые — базовая цена. Вентили дороже из-за усиления.\n  - Высокое (PN40+, до 400°C): Вентили специализированы и стоят дороже (от 10 тыс. руб.), но шаровые в таких условиях — премиум (аналогично или чуть дешевле с металлическими седлами).\n- **Тип управления**:\n  - Ручной: Шаровые проще (рычаг) — дешевле.\n  - Регулирующий или с редуктором: Вентили часто идут с ними, что удорожает (на 20–40%).\n- **Производитель и регион**:\n  - Бюджетные (Китай, РФ: Italtek, VALTEC для шаров; СТМ для вентиля) — шаровые дешевле на 30–50%.\n  - Премиум (Европа: AVK, Danfoss; Velan для вентиля) — разница меньше, но шаровые всё равно выгоднее в серийных моделях.\n  - В РФ цены: Шаровый латунный DN20 ~500–800 руб.; вентильный ~1500–2500 руб.\n\n#### 2. Почему шаровые обычно дешевле?\n- **Простота конструкции**: Меньше деталей (шар + 2 седла vs. конус, шпиндель, гайки у вентиля). Легче в массовом производстве — экономия на литье/фрезеровке.\n- **Популярность**: Шаровые — 70–80% рынка запорной арматуры, конкуренция снижает цены. Вентили — нишевые, для регулировки или старых систем.\n- **Себестоимость материалов**: Шаровые используют меньше металла (компактные), уплотнители дешевле (PTFE vs. точные металлические седла).\n- **Жизненный цикл**: Шаровые реже ломаются, общие затраты (ремонт+замена) ниже, что делает их выгоднее в долгосрочке.\n\n#### 3. Когда вентильные могут быть дешевле?\n- В крупных размерах (DN>300 мм): Шаровые — экзотика, дорогие аналоги (напр. шаровые с подшипниками). Вентили — стандарт, серийные.\n- В старых системах: Дешёвые китайские/советские вентиля (если в наличии) могут стоить как простые шаровые.\n- Для регулировки: Если нужен дроссель (не чистый запор), вентили эффективнее и не требуют доп. арматуры, что окупает цену.\n- Импорт/спецзаказ: Вентили для высоких P/T иногда дешевле импортных шарових аналогов.\n\n#### Практические рекомендации\n- **Для быта/отопления/воды (DN<50 мм)**: Берите шаровые — дешевле (экономия 50–70%) и долговечнее. Пример: шаровый VALTEC DN20 ~600 руб., вентильный ~2000 руб.\n- **Для промышленности (газ, пар, большие трубы)**: Считайте по проекту — вентили могут окупиться за счёт регулировки, но шаровые чаще выгодны по TCO (total cost of ownership).\n- **Где искать цены**: Сайты типа "Теплоснабжение", "Арматура.ру", AliExpress (для бюджетных), или каталоги производителя. Учитывайте сертификаты (ГОСТ, для газа/воды).\n- **Совет по экономии**: Покупайте проверенные бренды (не ультра-дешёвый no-name — они ломаются быстро, увеличивая расходы). Устанавливайте фильтры, чтобы продлить срок — это дешевле ремонта.\n- **Итоговая экономия**: Шаровые — выбор для 90% случаев, где важна цена+надёжность. Если бюджет тесный и применение простое — однозначно шаровые. Укажите диаметр, среду или регион — подскажу примеры цен точнее!	grok-4-fast	\N	2025-10-31 09:48:15.421462+00
587bcf1d-a6af-4b81-be37-c6c34c7bdbcb	de4e114b-761c-4a3b-b4d0-60ef9b6d1bc8	990cf9a6-88ab-465c-a280-b51c0467aeb9	user	что  целесообразнее применять в строительстве жилых высоток выше 30 этажей	\N	\N	2025-10-31 09:50:13.028191+00
1db7a7ad-4fed-45aa-bbec-0031bf482b02	de4e114b-761c-4a3b-b4d0-60ef9b6d1bc8	990cf9a6-88ab-465c-a280-b51c0467aeb9	assistant	### Целесообразность применения кранов в строительстве жилых высоток (>30 этажей)\n\nВ жилых высотках выше 30 этажей (высота ~100+ м) системы трубопроводов работают под повышенным давлением (до 10–16 бар в стояках, плюс насосы/гидроаккумуляторы), с учётом сейсмостойкости, пожарной безопасности и доступности для обслуживания. Выбор кранов зависит от системы (водоснабжение, отопление/HVAC, пожаротушение, канализация), диаметра труб (от DN15 в квартирах до DN300+ в магистралях) и стандартов (СНиП 31-01-2003 для жилых зданий, ГОСТ Р 54934-2012 для арматуры, NFPA 13 для пожарных). Универсально: комбинация шаровых и дисковых кранов — оптимальна для большинства задач; вентильные — редко, только в специальных случаях. Разберём по ключевым системам и критериям.\n\n#### 1. Основные системы и рекомендуемые типы кранов\n- **Водоснабжение (ХВС/ГВС, стояки и отводы в квартиры)**:\n  - **Целесообразно: Шаровые краны** (80–90% применений). Они компактны, полностью герметичны (нулевой утечки в закрытом положении), легко управляются (рычаг), подходят для PN16–25 и DN15–100 мм. В квартирах/на этажах — латунные или нержавеющие шаровые с PTFE-седлами для долговечности (ресурс 20–30 лет). Минус: не для тонкой регулировки.\n  - **Дисковые (butterfly)**: Для магистральных труб (DN200+) в подвале/на крыше — лёгкие, экономят место/вес в конструкции здания.\n  - **Вентильные**: Избегать — износ от высокого напора и турбулентности сокращает ресурс; только для редких регулирующих точек (напр. на насосах).\n  - **Почему шаровые?** В высотках частые циклы (ремонт, мойка), шаровые минимизируют риски затопления. Пример: VALTEC или Bugatti шаровые — стандарт в РФ-проектах.\n\n- **Отопление и HVAC (вентиляция, кондиционирование)**:\n  - **Целесообразно: Дисковые краны** для главных магистралей (DN150–500 мм, PN10–16) — дешёвые, лёгкие (экономия на стали в каркасе), большой ресурс (50 000+ циклов). Резиновые/металлические уплотнения подходят для воды/воздуха до 150°C.\n  - **Шаровые**: Для локальных запоров (отводы в секции, радиаторы) — DN50–150 мм. В комбинации с термостатами для балансировки.\n  - **Вентильные**: Только для паровых систем или высокотемпературных контуров (до 200°C), где нужна регулировка — но они тяжёлые и требуют редукторов, что усложняет монтаж.\n  - **Почему дисковые?** В HVAC большие объёмы воздуха/воды, дисковые минимизируют гидравлическое сопротивление и стоимость (на 30–50% дешевле шарових аналогов в больших DN).\n\n- **Пожаротушение (спринклеры, гидранты)**:\n  - **Целесообразно: Шаровые или задвижки (аналог вентилей, но упрощённые)**. Шаровые — для быстрого запора в стояках (PN25, нержавейка или чугун). Задвижки/вентили — для магистралей, где требуется надёжность под давлением (до 16 бар).\n  - **Дисковые**: Редко — только в низконапорных ветках, но не для критических линий (риск поджатия уплотнения).\n  - **Почему шаровые/задвижки?** Системы должны быть мгновенно активируемыми; шаровые обеспечивают 100% герметичность. Стандарты NFPA требуют минимальный износ и лёгкость ремонта.\n\n- **Канализация и слив (сливные стояки)**:\n  - **Целесообразно: Шаровые или дисковые с бездавленческим уплотнением**. Шаровые — для запоров в отводы (DN50–100 мм). Дисковые — в главных коллекторах (для больших DN, чтобы сэкономить на корпусе).\n  - **Вентильные**: Не подходят — загрязнения (фекалии, абразив) быстро изнашивают затвор.\n  - **Почему комбо?** Низкое давление, но высокая влажность/коррозия — нужны антикоррозийные материалы (нержавейка).\n\n- **Газоснабжение (если есть, напр. в кухнях)**:\n  - **Целесообразно: Только шаровые краны** (сертифицированные по ГОСТ Р 54906-2012, PN16). Полная герметичность критична; вентили/дисковые — риск утечек.\n\n#### 2. Критерии целесообразности в контексте высоток\n- **Давление и высота**: Высокий статический напор (1 бар/10 м) требует PN16+ кранов. Шаровые справляются лучше вентилей без износа; дисковые — для балансированных систем с насосами.\n- **Долговечность и обслуживание**: Ресурс 25–50 лет. Шаровые/дисковые проще ремонтировать (замена седел на месте), вентили — требуют полной разборки, что в высотке (лифты, пространство) проблематично. Устанавливайте в доступных шкафах/технических этажах.\n- **Стоимость и экономия**: \n  - Шаровые: Дешёвые в малых/средних DN (от 500 руб./шт.), общая экономия за счёт серийности.\n  - Дисковые: Самые выгодные для больших DN (экономия 40–60% на материалах/монтаже).\n  - Вентильные: Дороже (на 20–50%), оправданы только в 5–10% случаев (регулировка).\n  - Общие затраты: В проекте на 1000+ квартир шаровые+дисковые снижают бюджет на 15–25% vs. все вентили.\n- **Вес и пространство**: Высотки — монолит/каркас, лишний вес критич. Дисковые/шаровые легче (на 30–50% vs. вентили), компактнее — экономия на бетоне/арматуре.\n- **Безопасность и экология**: Шаровые минимизируют утечки (риск затопления/коррозии). Материалы: чугун/нержавейка для коррозии от конденсата; избегайте пластика в магистралях.\n\n#### 3. Практические рекомендации\n- **Стандартный подход**: "Гибрид" — шаровые для запорной арматуры в распределительных узлах/квартирах (быстрый доступ), дисковые для магистралей (экономия). Это соответствует проектным нормам (СП 60.13330.2016 для отопления/воды).\n- **Производители**: В РФ/Европа — AVK/Danfoss (дисковые), VALTEC/ETALON (шаровые), Cazzaniga для премиум. Для высоток — с антивибрационными опорами.\n- **Монтажные нюансы**: Устанавливайте байпасные линии, датчики давления; фильтры перед кранами для защиты от абразива. Тестируйте на 1,5 PN. В сейсмоопасных зонах — гибкие соединения.\n- **Когда вентили?** Только в паровых/высокотемпературных контурах или для дросселирования (напр. в котельной) — но даже там их заменяют на современные шаровые с редукторами.\n- **Итог**: **Наиболее целесообразны шаровые и дисковые краны** — баланс цены, надёжности и простоты в эксплуатации. Вентили — устаревший выбор, увеличивают риски и затраты. Для конкретного проекта (напр. водоснабжение или HVAC) уточните чертежи/нормы — могу дать более targeted советы! Если есть детали (регион, бюджет), подскажу расчёт.	grok-4-fast	\N	2025-10-31 09:50:26.152405+00
6b5abafb-b381-486d-89b8-0daa4b63dedd	de4e114b-761c-4a3b-b4d0-60ef9b6d1bc8	990cf9a6-88ab-465c-a280-b51c0467aeb9	user	а по качеству перекрытия воды лучше шаровые или дисковые	\N	\N	2025-10-31 09:52:38.463868+00
58eaa293-dc12-4ba4-9d8e-fdf15ba7ff6e	de4e114b-761c-4a3b-b4d0-60ef9b6d1bc8	990cf9a6-88ab-465c-a280-b51c0467aeb9	assistant	### Сравнение по качеству перекрытия воды: шаровые vs. дисковые краны\n\nКороткий вывод: **Шаровые краны обеспечивают лучшее качество перекрытия воды** — они дают полную герметичность (класс A по ГОСТ Р 54.1-2004/ISO 5208, нулевая утечка в закрытом положении) даже под средним давлением (до 16–25 бар), с минимальным риском протечек при правильной установке и материалах. Дисковые краны (butterfly) хороши для экономичных систем, но их герметичность ниже (класс A–B, возможны микротечи при износе уплотнений), особенно в динамичных условиях. Для высоток (>30 этажей) с высоким напором в стояках шаровые предпочтительнее для критических точек (квартиры, узлы), дисковые — для магистралей с низким риском. Разберём подробнее.\n\n#### 1. Герметичность в закрытом положении\n- **Шаровые краны**:\n  - Полное перекрытие: Шар (с уплотнительными кольцами из PTFE, эластомера или металла) плотно прилегает к седлам, блокируя поток на 100%. Тесты показывают утечку <0,01% от номинального расхода (или нулевую по стандартам).\n  - Преимущества для воды: Не зависят от направления потока, устойчивы к гидроударам. В бытовых/высотных системах (ХВС/ГВС) минимизируют риск затопления — идеально для стояков DN15–100 мм.\n  - Минусы: При абразиве или старении седел возможны минимальные утечки, но реже, чем у дисковых.\n- **Дисковые краны**:\n  - Перекрытие: Диск поворачивается на 90° и прижимается к уплотнительному кольцу (резина/EPDM или металл) по периметру корпуса. Герметичность хорошая (класс A для мягких седел), но не абсолютная — утечка может быть 0,1–0,5% при давлении >10 бар или после циклов.\n  - Преимущества для воды: Быстрое закрытие в больших DN (до 500+ мм), низкое сопротивление потоку в открытом положении.\n  - Минусы: Резиновые уплотнения деформируются под давлением/температурой (выше 80–100°C), что приводит к протечкам; в высотках с турбулентностью диск может "振动ать", снижая seal. Металлические версии (triple-offset) лучше, но дороже и реже для воды.\n\n- **Вывод по перекрытию**: Шаровые — "золотой стандарт" для полной изоляции (leak-proof). Дисковые подходят для "мягкого" запора, где допустима небольшая утечка (напр. в вентиляционных ветках или магистралях с байпасами).\n\n#### 2. Факторы, влияющие на качество перекрытия\n- **Давление и напор (релевантно для высоток)**:\n  - В стояках >30 этажей статический напор может достигать 3–5 бар + динамика от насосов (до 10–16 бар). Шаровые выдерживают без деформации седел; дисковые — рискуют сжатием резиновой манжеты, что ухудшает герметичность со временем.\n- **Среда (вода: ХВС, ГВС, с примесями)**:\n  - Чистая вода: Оба типа хороши, но шаровые меньше подвержены коррозии уплотнений (PTFE устойчивее резины).\n  - С примесями (известь, ил): Абразив ускоряет износ дисковых уплотнений (резина трескается), шаровые — лучше (шар "смывает" частицы).\n  - Температура: До 90°C — равны; выше (ГВС) — шаровые с термостойкими седлами надёжнее.\n- **Цикличность и износ**:\n  - Шаровые: Ресурс 10 000–50 000 циклов с сохранением герметичности; трение минимально.\n  - Дисковые: 20 000–100 000 циклов, но после 5000–10 000 уплотнение может проседать, вызывая утечки (особенно резиновые).\n- **Установка и обслуживание**:\n  - Шаровые: Требуют точной установки (без перекосов), седла легко меняют без демонтажа.\n  - Дисковые: Чувствительны к позиционированию диска; уплотнения меняют проще, но в запертом корпусе.\n\n#### 3. Тестирование и стандарты\n- По ГОСТ Р 54808-2011 (арматура для воды): Шаровые часто проходят на класс A (нулевая утечка при PN16). Дисковые — A/B, с допустимой утечкой 0,05% DN.\n- В практике: Для высоток (СП 30.13330.2016) требуют герметичность не ниже класса B, но для запорных узлов — A. Шаровые чаще выбирают для compliance.\n\n#### Практические рекомендации\n- **Для оптимального перекрытия в высотках**:\n  - **Шаровые**: В квартирах, на этажах, в стояках (DN15–150 мм) — максимальная герметичность, чтобы избежать подтоплений соседей. Латунные/нержавеющие с soft-seal (напр. VALTEC, Bugatti) — от 500 руб., ресурс 25+ лет.\n  - **Дисковые**: В подвалах/технических этажах для магистралей (DN200+) — хороши, если герметичность не критична (есть датчики/байпасы). Выбирайте с EPDM-уплотнениями или triple-lug (AVK, Erhardt) — дешевле (экономия 30–50%).\n  - Комбо: Шаровые в ключевых точках + дисковые в общих линиях — стандарт в проектах (напр. в Москве/СПб для ЖКХ).\n- **Как обеспечить качество**:\n  - Устанавливайте с фильтрами/грязеуловителями.\n  - Проверяйте гидравлические тесты на 1,5 PN после монтажа.\n  - Для ГВС — термостойкие материалы (не резина на 100°C+).\n  - Если утечки — признак: для шарових — подтяжка/замена седел; для дисковых — чаще уплотнений.\n- **Итог**: По качеству перекрытия воды **шаровые краны лучше дисковых** на 20–50% (по герметичности и надёжности в долгосрочке), особенно в системах с высоким давлением и частым использованием. Дисковые — компромисс для экономии в не критичных зонах. Если фокус на конкретной системе (водоснабжение или отопление), уточните — дам примеры моделей!	grok-4-fast	\N	2025-10-31 09:52:50.176049+00
3c9dc7f8-d7e4-4bf9-8e77-8b6a028e0626	de4e114b-761c-4a3b-b4d0-60ef9b6d1bc8	990cf9a6-88ab-465c-a280-b51c0467aeb9	user	отдельно для отопления, отдельно для водоснабжения	\N	\N	2025-10-31 10:15:00.477196+00
d23f58b0-9624-435d-8a08-8e7e0593075b	de4e114b-761c-4a3b-b4d0-60ef9b6d1bc8	990cf9a6-88ab-465c-a280-b51c0467aeb9	assistant	### Качество перекрытия: шаровые vs. дисковые краны в системах отопления и водоснабжения\n\nВ контексте жилых высоток (>30 этажей) качество перекрытия оценивается по герметичности (класс по ГОСТ Р 54808-2011 или ISO 5208: класс A — нулевая утечка, B — минимальная), устойчивости к давлению/температуре, износу и рискам (затопление, потеря давления). Шаровые краны в целом превосходят дисковые по полной изоляции (leak-proof), но дисковые выгодны по цене/массе для магистралей. Разберём отдельно для каждой системы, с учётом типичных условий высоток (давление до 16 бар, температура 20–130°C, циклы 5000–20 000/год).\n\n#### 1. Для системы отопления\nОтопление в высотках — закрытые контуры с водой/антифризом, высоким давлением (6–16 бар в стояках, плюс гидроудары от насосов), температурой 70–130°C (зимой) и сезонной эксплуатацией. Примеси: соли, коррозия, антифриз. Критичны: герметичность для предотвращения утечек в квартирах (риск ожогов/затоплений) и сохранения давления в системе.\n\n- **Герметичность перекрытия**:\n  - **Шаровые краны**: Отличная — полное перекрытие (класс A, утечка <0,01%). Шар с термостойкими седлами (PTFE с графитом или металлическими) плотно запирает поток даже при ΔT (тепловом расширении). В открытом положении — минимальное сопротивление (~0,2–0,5 mbar). Подходят для DN50–200 мм в стояках/отводах к секциям.\n  - **Дисковые краны**: Хорошая, но ниже (класс A–B, утечка 0,1–0,3% возможна при износе). Резиновые/EPDM-уплотнения деформируются при T>100°C или под давлением, приводя к микротечам; металлические (triple-offset) ближе к A, но дороже. В открытом — низкое сопротивление (идеально для гидравлического баланса).\n  \n- **Факторы влияния**:\n  - **Температура и среда**: Шаровые устойчивее к нагреву (седла до 200°C), антифризу и коррозии (нержавейка/чугун). Дисковые — резину "плавит" T>120°C, ускоряя износ в ГВС-отоплении.\n  - **Давление и циклы**: В высотках с автоматикой (термостаты) шаровые выдерживают 10 000+ циклов без потери герметичности; дисковые — до 50 000, но уплотнения седеют после сезона (риск в зимний пуск).\n  - **Износ**: Шаровые меньше страдают от осадка (прокладки), дисковые — от терморасширения диска (вибрация в трубах).\n  \n- **Практические рекомендации**:\n  - Шаровые: Для локальных запоров (отводы к радиаторам, этажные узлы, DN50–150 мм). Выбирайте с тройным уплотнением (напр. AVK или Danfoss, PN16–25, цена 2000–8000 руб.). Устанавливайте с байпасами для балансировки.\n  - Дисковые: Для магистралей в подвале/технических этажах (DN200+, PN10–16). Экономия веса/пространства в каркасе; модели с EPDM для T<110°C (Erhardt, ~5000–20 000 руб.).\n  - Общее: В проектах по СП 60.13330.2016 (отопление) шаровые — 70% арматуры; дисковые — для экономии в больших DN. Тестируйте на 1,1 PN при T=110°C.\n\n- **Итог для отопления**: **Шаровые лучше дисковых** по качеству перекрытия (на 30–50% надёжнее в герметичности и долговечности при Т/давлении). Дисковые — компромисс для магистралей, где утечки допустимы с контролем.\n\n#### 2. Для системы водоснабжения (ХВС/ГВС)\nВодоснабжение в высотках — открытые/полуоткрытые контуры, давление 4–10 бар (с редукторами на этажах), температура 5–95°C (ГВС), с примесями (хлор, известь, ил). Частые циклы (ежедневное использование, ремонт). Критичны: нулевая утечка для предотвращения потопов между этажами.\n\n- **Герметичность перекрытия**:\n  - **Шаровые краны**: Максимальная — полная изоляция (класс A, нулевая утечка). PTFE- или эластомерные седла обеспечивают плотный контакт шара с корпусом, независимо от напора. Идеальны для стояков (DN15–100 мм в квартирах) и ГВС (до 95°C без деформации).\n  - **Дисковые краны**: Достаточная (класс B–A, утечка <0,05–0,2%). Диск прижимается к уплотнению, но при вибрации (от смесителей) или осадке резины возможны протечки; лучше в чистой ХВС, хуже в ГВС (T размягчает EPDM).\n  \n- **Факторы влияния**:\n  - **Температура и среда**: Шаровые отличны для ГВС (седла устойчивы к 95°C, хлору); дисковые — для ХВС (T<60°C), но в ГВС уплотнения трескаются от термических циклов.\n  - **Давление и циклы**: Высокий напор на верхних этажах — шаровые справляются без сжатия (до 25 бар); дисковые — рискуют подтеканием при >8 бар после 5000 циклов. В квартирах частые открытия — шаровые выигрывают в герметичности.\n  - **Износ**: Шаровые защищены от абразива (форма шара "очищает" седла); дисковые — уплотнение стирается от частиц в воде, особенно в старых трубах.\n  \n- **Практические рекомендации**:\n  - Шаровые: Для всех запорных точек — стояки, квартирные краны, редукторы (DN15–150 мм, PN16). Латунные для ХВС (VALTEC, 500–2000 руб.), нержавейка/чугун для ГВС (Bugatti, 1500–5000 руб.). Обязательны с гайкой под манометр.\n  - Дисковые: Редко — только в магистральных линиях подвала (DN150+, PN10). Избегайте в ГВС; для ХВС — с мягким уплотнением (ETALON, 3000–10 000 руб.).\n  - Общее: По СП 30.13330.2012 (водоснабжение) рекомендуют шаровые для герметичных зон. Устанавливайте с фильтрами (100 мкм) и тестом на 1,5 PN; в высотках — с антивибрационными вставками.\n\n- **Итог для водоснабжения**: **Шаровые значительно лучше дисковых** (на 40–60% по герметичности, особенно в ГВС и при частом использовании). Дисковые — нишевые для низконапорных магистралей, где экономия важнее абсолютной изоляции.\n\n#### Общий вывод\nДля обеих систем в высотках **шаровые краны обеспечивают superior качество перекрытия** — полную герметичность, устойчивость к условиям и минимальные риски, делая их приоритетным выбором для 80–90% арматуры. Дисковые — для экономии в магистралях отопления (где T/давление ниже), но не для водоснабжения (из-за риска утечек в динамике). В проектах комбинируйте: шаровые в узлах/квартирах, дисковые в общих трубах. Если нужны модели под конкретные PN/T или расчёт (напр. для 100-метровой высоты), уточните — подскажу!	grok-4-fast	\N	2025-10-31 10:15:13.945521+00
d783f29e-97d7-4709-86d6-81b930b7a0d3	de4e114b-761c-4a3b-b4d0-60ef9b6d1bc8	990cf9a6-88ab-465c-a280-b51c0467aeb9	user	для металлических и пластиковых труб - один и тот же выбор?	\N	\N	2025-10-31 10:18:23.910543+00
23baf020-edef-46cd-aab9-af3455a7f82f	de4e114b-761c-4a3b-b4d0-60ef9b6d1bc8	990cf9a6-88ab-465c-a280-b51c0467aeb9	assistant	Коротко: выбор арматуры для металлических и пластиковых труб — не всегда один и тот же. Общие принципы те же (малые диаметры — шаровые, крупные — дисковые), но у пластика есть свои ограничения и требования к монтажу, материалам и опорам. Ниже — практическое руководство.\n\n1. Основные отличия пластика от металла (важно учитывать)\n- Меньшая прочность и жёсткость — пластик легче деформируется при нагрузках и моменте от затяжки/крутящего момента.  \n- Большая тепловая деформация (коэффициент линейного расширения выше) — требует компенсации удлинений/сдвигов.  \n- Ограничения по температуре и давлению (PPR/PEX/PVC имеют разные Tmax и PN при температуре).  \n- Чувствительность к растворителям/агрессивным уплотнениям — нужно проверять совместимость.  \n- Монтажные соединения (пайка, раструб, компрессия) накладывают дополнительные требования к переходным узлам.\n\n2. Практические рекомендации по типам кранов\n- Малые диаметры (≈DN15–50, бытовые стояки, отводы к радиаторам/смесителям):\n  - Для металла и пластика: шаровые краны — лучший выбор (простые, герметичные).  \n  - Для пластика используйте шаровые специально для пластика (компрессионные/с монтажными муфтами, с мягкими седлами и низким рабочим моментом). Не затягивайте резьбовые соединения «как для металла» — можно сорвать резьбу или раздавить фитинг.\n- Средние диаметры (≈DN50–200):\n  - Металл: шаровые и дисковые — выбор по функции; шаровые для узлов перекрытия, дисковые для магистралей.  \n  - Пластик: дисковые (butterfly) чаще применяют при больших DN из‑за веса/цены; но обязательны фланцевые адаптеры и опорные (бэкинг) кольца, чтобы не деформировать трубу. Шаровые возможны, но обращайте внимание на массу и момент при повороте.\n- Большие диаметры (>DN200):\n  - Для металлa — дисковые/задвижки (вес и цена).  \n  - Для пластика — дисковые с фланцевыми переходниками и обязательной опорой/армированием трубы; часто используют специальные армированные пластиковые трубы или комбинированные конструкции.\n- Для систем отопления (высокая T):\n  - На пластике (PPR/PEX) используйте только арматуру, сертифицированную для соответствующей температуры (обычно до 95°C). Часто предпочтительны шаровые с металлическим корпусом и термостойким седлом (PTFE/графит). Дисковые с резиновыми уплотнениями — риск при высоких температурах.\n- Для водоснабжения (ХВС/ГВС):\n  - Шаровые — в квартирах/стояках для обоих материалов. Для пластика — выбирайте фитинги/краны с подходящими резьбовыми переходниками, не перегревайте при монтаже.\n- Для агрессивных сред:\n  - Для пластика возможен выбор корпуса из полипропилена/ПВХ и седел из устойчивых материалов; для металла — нержавейка или покрытия. Подбирайте уплотнения по химии.\n\n3. Монтаж и эксплуатация — важные нюансы для пластика\n- Не допускайте передачи больших изгибающих/осевых нагрузок от тяжёлого клапана на пластиковую трубу — используйте опорные лапы, переходные фланцы, укоротите выступающие участки трубы.  \n- Затяжка штуцеров и фланцев — по рекомендуемому моменту; пластиковая резьба и компрессионные фитинги требуют меньшего усилия.  \n- Для дисковых клапанов ставьте бэкинг‑кольца/фланцы, чтобы уплотнение диска не продавило трубу.  \n- Учитывайте тепловое удлинение труб — оставляйте компенсационные петли или деформационные швы.  \n- Выбирайте клапаны с низким моментом закрытия для пластика (меньше крутящего усилия).  \n- При переходе металл↔пластик используйте переходники с разрывом токовой цепи (диэлектрические муфты) и учтите возможную усадку/расширение.\n\n4. Материалы уплотнений и совместимость\n- Для питьевой воды: EPDM или PTFE (фторопласт) — безопасны.  \n- Для ГВС/нагрева: PTFE/графит или термостойкие эластомеры. Избегайте дешёвых резин, которые размягчаются при T>70–90°C.  \n- Для агрессивных сред — подбирать по химстойкости (Viton/EPDM/FFKM/ПТФЭ).\n\n5. Короткие выводы\n- Нет «одного и того же» универсального выбора: общая логика (шаровые для малых DN, дисковые для больших) сохраняется, но для пластиковых труб важны дополнительные требования по массе, опорам, фланцевым переходникам, материалам седел и температурным ограничениям.  \n- В бытовых и квартирных узлах с пластиком обычно используют шаровые краны специально под пластиковые фитинги. В магистралях больших диаметров дисковые с фланцевыми адаптерами и бэкинг‑кольцами — подходящий выбор для пластика.  \n- Всегда проверяйте: PN/Tmax клапана и трубы, тип соединения и инструкции производителя по монтажу.\n\nЕсли укажете конкретные материалы труб (PPR, PEX, PVC, сталь, медь), диаметры и температуру/давление — дам точные рекомендации по типу клапана и моделям/способам монтажа.	gpt-5-mini	\N	2025-10-31 10:18:56.137941+00
0513df5f-55f4-4647-8c84-73451f86541d	1166c2f0-7544-4241-983d-7ddd0be62d78	990cf9a6-88ab-465c-a280-b51c0467aeb9	user	какие краны нужно использовать для газа - шаровые или вентильные	\N	\N	2025-10-31 10:43:05.384775+00
ffafc397-5f21-4f94-a8b4-50bbb7826d67	1166c2f0-7544-4241-983d-7ddd0be62d78	990cf9a6-88ab-465c-a280-b51c0467aeb9	assistant	# Краны для газа: выбор между шаровыми и вентильными\n\n## **Вентильные краны** ✓ РЕКОМЕНДУЮТСЯ\n\n**Преимущества:**\n- Более надежны для газовых магистралей\n- Меньше утечек при работе\n- Плавное перекрытие потока\n- Стандарт для большинства газораспределительных систем\n- Лучше переносят загрязнения в газе\n\n**Типичное применение:**\n- Разводка газа в доме\n- Подключение газовых приборов\n- Магистральные газопроводы\n\n## **Шаровые краны** ✗ НЕ рекомендуются\n\n**Проблемы:**\n- Риск заклинивания при длительном неиспользовании\n- Невозможна точная регулировка потока\n- Опасность повреждения уплотнения при неполном открытии\n- Могут пропускать газ при частичном закрытии\n\n## **Важно помнить:**\n\n⚠️ **Краны должны быть:**\n- Сертифицированы для газа\n- Установлены лицензированными специалистами\n- Изготовлены из латуни или стали\n- Иметь маркировку соответствия стандартам\n\n**Совет:** Проверьте требования локального газораспределительного предприятия — они могут быть специфичны для вашего региона.	anthropic-claude-haiku-4.5	\N	2025-10-31 10:43:10.193504+00
a7cba008-0b8a-4082-bf17-26baa83b783c	d9297b3c-0e35-4926-959d-92965b87d8d8	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	user	какие краны долговечнее - шаровых или кранов с дисковыми затворами	\N	\N	2025-10-31 10:43:22.442801+00
c9e73cd4-1922-480a-890e-28972829108e	d9297b3c-0e35-4926-959d-92965b87d8d8	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	assistant	### Сравнение долговечности шаровых кранов и кранов с дисковыми затворами\n\nЧтобы ответить на ваш вопрос, давайте сначала кратко разберём, о чём речь:\n\n- **Шаровые краны (ball valves)**: Это арматура, где запорный элемент — это сферический шар с отверстием. Для открытия/закрытия шар поворачивается на 90° с помощью ручки или привода. Они просты в конструкции, обеспечивают хорошую герметичность и используются в бытовых, промышленных и водопроводных системах (для воды, газа, химикатов).\n  \n- **Краны с дисковыми затворами (butterfly valves или поворотные дисковые затворы)**: Здесь запорный элемент — плоский диск (или лопасть), который монтируется перпендикулярно потоку жидкости и поворачивается на 90° для регулировки. Они чаще применяются в крупных трубопроводах (вентиляция, водоснабжение, химическая промышленность), где важна лёгкость и компактность.\n\n#### Долговечность: что долговечнее?\nДолговечность кранов зависит от множества факторов: материала (латунь, нержавеющая сталь, пластик), рабочего давления, температуры, типа среды (вода, агрессивные жидкости, газ) и условий эксплуатации (частота открытий/закрытий, наличие осадка или коррозии). Нет универсального "победителя", но в целом:\n\n- **Шаровые краны обычно долговечнее в большинстве сценариев**:\n  - Они имеют более простую и надёжную конструкцию с минимальным трением (шар контактирует с седлом под давлением, но без износа от скольжения).\n  - Срок службы: 10–30 лет и более при нормальной эксплуатации. В бытовых системах (например, водопровод) они редко подводят, так как шар герметично "застревает" в седле, защищая от протечек.\n  - Преимущества: Высокая устойчивость к коррозии (если из качественного материала), низкий риск деформации. Минус: При длительном простое (годы без использования) сальник может высохнуть, но это легко устраняется.\n  - Изнашиваются реже, особенно в системах с низким/средним давлением.\n\n- **Краны с дисковыми затворами менее долговечны в агрессивных условиях**:\n  - Диск подвержен вибрациям, ударам и эрозии от потока, особенно в больших трубах или при наличии взвесей (песок, грязь). Со временем диск может деформироваться или "застревать".\n  - Срок службы: 5–15 лет в типичных применениях, реже до 20 лет. Они хорошо работают в системах с низким давлением (до 10–16 бар), но в высокодавленческих или химических средах изнашиваются быстрее из-за большего контакта диска с жидкостью.\n  - Преимущества: Легче по весу, дешевле в производстве для больших диаметров. Минус: Герметичность хуже при полном закрытии, и диск может корродировать или изнашиваться от частых циклов.\n\n#### Факторы, влияющие на выбор и долговечность\n- **Применение**: Шаровые краны лучше для малых/средних труб (до 50–100 мм) и точной герметизации. Дисковые — для больших диаметров (от 100 мм) и потоков, где не нужна идеальная герметичность (например, в вентиляции или ирригации).\n- **Материал**: Из нержавеющей стали или керамики оба типа служат дольше (до 50 лет в идеале). Латунные шаровые — бюджетный вариант, но корродируют в солёной воде.\n- **Эксплуатация**: Регулярное обслуживание (смазка, проверка) продлевает жизнь обоим. В загрязнённых средах дисковые затворы страдают больше.\n- **Статистика**: По отзывам из промышленности (например, от производителей вроде AVK или Danfoss), шаровые краны имеют на 20–50% больший ресурс в эквивалентных условиях.\n\n**Вывод**: Если сравнивать напрямую, **шаровые краны долговечнее** для большинства бытовых и среднепромышленных применений благодаря простоте и надёжности. Для крупных систем или низкодавленческих потоков дисковые затворы могут быть альтернативой, но с меньшим сроком службы. Рекомендую консультироваться с инженером или выбирать по конкретным параметрам (давление, диаметр). Если у вас есть дополнительные детали о системе, могу дать более точный совет!	grok-4-fast	\N	2025-10-31 10:43:29.98681+00
bb559071-f842-4c6f-927a-9aea77e3cf35	1166c2f0-7544-4241-983d-7ddd0be62d78	990cf9a6-88ab-465c-a280-b51c0467aeb9	user	добавь в сравнение дисковые, проанализируй с точки зрения долговечности и стоимости использования при строительстве многоэтажных до 50 этажей жилых домов.	\N	\N	2025-10-31 11:12:39.557154+00
9573630d-9b41-4687-85b9-58e88f58ca10	d9297b3c-0e35-4926-959d-92965b87d8d8	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	user	добавь в сравнение дисковые, проанализируй с точки зрения долговечности и стоимости использования при строительстве многоэтажных до 50 этажей жилых домов.	\N	\N	2025-10-31 11:12:53.136215+00
b019d0c1-1d30-45ca-8e39-ae710034d2bb	1166c2f0-7544-4241-983d-7ddd0be62d78	990cf9a6-88ab-465c-a280-b51c0467aeb9	assistant	# Краны для газа: сравнение типов для многоэтажного строительства\n\n## **Сравнительная таблица**\n\n| Параметр | Вентильные | Шаровые | Дисковые |\n|----------|-----------|---------|----------|\n| **Надежность для газа** | ✓✓✓ Высокая | ✗ Низкая | ✓✓ Средняя |\n| **Долговечность** | 15-20 лет | 10-15 лет | 12-18 лет |\n| **Стоимость ед.** | Средняя | Низкая | Средняя-выше |\n| **Затраты на обслуживание** | Умеренные | Высокие (заклинивание) | Низкие |\n| **Ремонтопригодность** | ✓ Хорошая | ✓ Хорошая | ✗ Сложная |\n| **Регулировка потока** | ✓ Плавная | ✗ Нет | ✗ Нет |\n| **Герметичность** | ✓✓✓ Отличная | ✓ Удовлетворительная | ✓✓ Хорошая |\n\n## **Анализ для многоэтажного дома (до 50 этажей)**\n\n### **ВЕНТИЛЬНЫЕ КРАНЫ** — ЛУЧШИЙ ВЫБОР\n\n**Плюсы:**\n- Стандарт для всех газовых сетей в России\n- На 50-этажном доме сотни кранов → надежность критична\n- Долговечность 15-20 лет окупается через сниженное обслуживание\n- Легко заменять при необходимости (стандартизированы)\n- Надежная герметизация на все время эксплуатации\n\n**Экономика на крупном объекте:**\n```\n100 кранов × 1500-2500 руб. = 150-250 тыс. руб.\n+ Обслуживание 15 лет: низкое (плановое ТО)\n+ Замена 1-2 крана за 20 лет: ~3-5 тыс. руб.\n= Общая стоимость владения: ОПТИМАЛЬНА\n```\n\n---\n\n### **ШАРОВЫЕ КРАНЫ** — НЕ ПОДХОДЯТ\n\n**Минусы для высоток:**\n- Критичное заклинивание при простое (частое в доме с вакантностью)\n- На 50 этажах = множественные отказы одновременно\n- Дорогой аварийный ремонт (вызов специалиста на высоту)\n- Техническое обслуживание сложнее\n\n**Экономика:**\n```\n100 кранов × 800-1200 руб. = 80-120 тыс. руб. (дешевле!)\n+ Аварийные ремонты (заклинивание): 20-30 тыс. руб./год\n+ Замены за 15 лет: 15-20 кранов × 3-5 тыс. = 45-100 тыс. руб.\n= Общая стоимость владения: ДОРОГО (150-250 тыс. руб.)\n```\n\n⚠️ **Вывод:** экономия на закупке → убытки на обслуживании\n\n---\n\n### **ДИСКОВЫЕ КРАНЫ** — КОМПРОМИССНЫЙ ВАРИАНТ\n\n**Плюсы:**\n- Лучше герметичности чем шаровые\n- Дешевле в обслуживании, чем вентильные\n- Допускаются в некоторых регионах для внутридомовых сетей\n- Компактнее вентильных\n\n**Минусы:**\n- Ремонт сложный (нужна замена узла целиком)\n- На 50-этажном доме скажется кумулятивный эффект отказов\n- Менее стандартизированы (может быть проблема с совместимостью)\n- Хуже регулировки потока при наладке\n\n**Экономика:**\n```\n100 кранов × 1800-2500 руб. = 180-250 тыс. руб.\n+ Обслуживание: среднее (20-25 лет имеют ресурс)\n+ Капремонты: 1-2 крана за 20 лет\n= Общая стоимость: 200-280 тыс. руб.\n```\n\n---\n\n## **РЕКОМЕНДАЦИЯ для многоэтажного дома**\n\n### **🏆 Вентильные краны**\n\n**Почему:**\n\n1. **Долговечность:** 15-20 лет — соответствует межремонтному периоду дома\n2. **Стоимость цикла жизни:** дешевле при масштабе на 100+ кранов\n3. **Минимум аварийных ситуаций:** критично для 50-этажного дома\n4. **Универсальность:** легко найти запчасти, специалисты знают все модели\n5. **Нормативы:** требование СНиП и газораспределительных компаний\n\n**Распределение по дому:**\n- **Вводные узлы:** вентильные + редукционные клапаны\n- **Разводка по этажам:** вентильные (ВКГ-1, ВКГ-2)\n- **Приборные:** вентильные краны муфтовые\n\n### **Бюджет на 50-этажный дом**\n\n```\nПримерное количество кранов: 120-150 шт.\nВентильные краны: 1500-2500 руб./шт.\nМонтаж + материалы: 200-400 руб./шт.\n\nИтого сметная стоимость:\n- Краны: 180-375 тыс. руб.\n- Монтаж: 24-60 тыс. руб.\n- Итого: ~250-450 тыс. руб. (0,5-1% от стоимости газификации)\n```\n\n**20-летний период владения:** окупится через снижение ремонтных расходов на 30-40% vs других типов.	anthropic-claude-haiku-4.5	\N	2025-10-31 11:12:54.019537+00
1d0cb258-6442-4ac0-a0b0-5696742e8a69	d9297b3c-0e35-4926-959d-92965b87d8d8	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	assistant	Ниже — концентрированное сравнение шаровых кранов и дисковых (поворотных) затворов специально с точки зрения долговечности и полной стоимости владения при строительстве жилых многоэтажных домов до ~50 этажей.\n\nКратко о контексте применения в многоэтажке:\n- Внутриквартирная и стояковая разводка (DN15–DN50): основном — питьевая и хозяйственно-бытовая вода.\n- Магистрали и коллекторы (DN65–DN300+): вводы в дом, этажные коллектора, ГВС/ХВС, циркуляция, системы отопления/ВК.\n- Пожарные и HVAC-системы: отдельные требования по надежности и сигнализации.\n\n1) Долговечность\n- Шаровые краны\n  - Типичные материалы: латунь (бытовые), нерж. сталь (ответственные линии), кованые стальные исполнения (промыс).  \n  - Срок службы при нормальных условиях: часто 15–30+ лет (при качественном материале и установке).  \n  - Уязвимости: при больших диаметрах и высоком давлении возможны трудности с изготовлением/ремонтом; при длительном бездействии (или плохой смазке) — заедание; чувствительны к механическим повреждениям седел при наличии абразива.  \n  - В жилых домах особенно надежны на малых диаметрах (квартиры, стояки) — обеспечивают отличную герметичность и минимальные утечки.\n\n- Дисковые затворы (butterfly)\n  - Типы: плавающий/с опорным валом (trunnion), с мягким (EPDM/PTFE) или металлическим седлом.  \n  - Срок службы: обычно 10–20 лет, в зависимости от материала седла и условий эксплуатации. Трубы с чистой водой дают более долгий ресурс; в системах с взвешенными частицами — быстрее эрозия диска/сальников.  \n  - Уязвимости: резиновые седла со временем деградируют (температура, хлор); диск подвержен коррозии/эрозии при высокой скорости потока или абразивных примесях. Для больших диаметров дисковые затворы удобнее по форме, но их герметичность и ресурс хуже, чем у качественных шаровых в малых диаметрах.\n\n2) Стоимость использования (полная, life-cycle)\n- Компоненты стоимости: закупочная цена, монтаж/поддержка, требования к опорам/мекс., потери от протечек и простоя, срок службы и стоимость замены/ремонта.\n- Малые диаметры (DN15–DN50)\n  - Шаровой: дешевле, компактнее, проще устанавливать, минимальные эксплуатационные расходы, лучшая герметичность → общая стоимость владения ниже.\n  - Дисковый: на таких диаметрах редко выгоден, он может быть дороже или равен по цене, но хуже по герметичности — итоговый TCO выше или неоправдан.\n- Средние/большие диаметры (DN65+)\n  - Закупка: дисковые затворы значительно дешевле и легче, особенно при DN≥100. Для больших диаметров шаровые (полнопроходные) сильно дороже и тяжелее.\n  - Монтаж/инсталляция: дисковые проще по весу/габаритам, дешевле монтаж и опоры.\n  - Обслуживание: дисковые обычно требуют замены седла/ущетнений чаще; у шаровых при больших диаметрах ремонт сложнее и дороже (но реже). \n  - Итог по TCO: для магистральных диаметров чаще выигрывает дисковый (меньше CAPEX и монтажных затрат). Для критичных по герметичности участков (например, места с риском затопления квартир при протечке) шаровые выгоднее из‑за меньших потерь и риска аварий.\n\n3) Применение в системах многоквартирного дома (рекомендации)\n- Внутриквартирные и стояковые запорные вентили (DN15–DN50): преимущественно шаровые (латунные/нерж.) — лучше герметичность, долговечность, простота эксплуатации и замены при аварии.\n- Этажные коллектора, вводы и распределение (DN65–DN150): дисковые затворы с резиновым седлом — оптимальны по цене и установке. Для линий с повышенными требованиями к герметичности (над/под подвальными помещениями, где риск затопления — критичен) рассмотреть металлические/высококачественные шаровые или трёхходовые решения.\n- Пожарные/стальные магистрали: допускаются дисковые затворы специального исполнения (с контролем положения), но часто выбирают дисковые с фланцами, подходящие по нормам; в особо критичных местах — металлические седла или специализированные шаровые блоки по ТЗ.\n- HVAC и циркуляция ГВС/ОТОПЛЕНИЕ: дисковые (для регулирования и больших диаметров), но с материалами, устойчивыми к температуре (например, EPDM для воды до ~120°C, PTFE для более агрессивных сред). Для регулирующих задач использовать регулирующие клапаны, а не обычные дисковые.\n\n4) Материалы и типы, влияющие на долговечность\n- Седла: EPDM/NR выдерживают питьевую воду и дают лучшее уплотнение, но деградируют при высоких температурах/хлоре. PTFE более стойкий, но дороже. Металлические седла — для высоких температур/абразива, но хуже по герметичности.\n- Корпус: нержавейка/ков. сталь предпочтительнее в агрессивной среде и для долговременных магистралей; латунь — норм для квартир.\n- Для больших диаметров выбирать троннованые/опорные дисковые затворы для уменьшения износа под нагрузкой.\n\n5) Практические замечания по эксплуатации и экономике\n- Частота эксплуатации: в жилых домах большая часть запорной арматуры почти не используется (годами в одном положении). Это увеличивает риск заедания для обоих типов — требуется план обслуживания и проверка/приводная операция 1–2 раза в год.\n- Риск аварии: последствия протечки в многоэтажке дорого обходятся; потому на местах, где течь критична, лучше ставить более герметичные устройства (шаровые или двойные секции с контролем).\n- Планирование запасных частей: дисковые проще ремонтировать на месте (замена седла), шаровые — часто меняют целиком при больших диаметрах.\n- Стоимость владения: нет «одноразового ответа» — при проектировании комбинируйте: шаровые для малого диаметра/критичных мест, дисковые для магистралей/больших диаметров. Это обычно оптимизирует CAPEX и OPEX.\n\n6) Краткий вывод\n- Для многоэтажного жилого дома до 50 этажей:\n  - Шаровые краны долговечнее и предпочтительнее на малых диаметрах (стояки, квартиры, локальные отключения), где важна герметичность и минимальные потери.\n  - Дисковые затворы экономичнее в закупке и монтаже для магистральных и больших диаметров (вводы, коллекторы, HVAC). Их долговечность ниже в агрессивных/абразивных условиях, но при правильном выборе материалов и обслуживании они дают оптимальное TCO для магистралей.\n- Рекомендация: применять гибридный подход — шаровые для DN≤50, дисковые (подходящего исполнения) для DN≥65–80 + качественные материалы и плановое обслуживание. Для критичных систем (пожар, подполья) уточнить требования норм и выбирать исполнение с сигнализацией/удлинёнными ресурсами.\n\nЕсли хотите, могу:\n- оценить конкретный сценарий по диаметрам и типам линий в вашем проекте и дать более точные рекомендации по исполнению и ориентировочному TCO;\n- подобрать варианты по материалам (EPDM/PTFE/нерж.) и типам затворов для ваших рабочих температур и давления.	gpt-5-mini	\N	2025-10-31 11:13:23.633682+00
4e993a89-d94e-4cc6-99aa-c9dc63521076	d9297b3c-0e35-4926-959d-92965b87d8d8	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	user	подбери варианты	\N	\N	2025-10-31 11:44:39.491031+00
0fc041b6-5121-4684-aaba-08d70522669d	1166c2f0-7544-4241-983d-7ddd0be62d78	990cf9a6-88ab-465c-a280-b51c0467aeb9	user	подбери варианты по материалам (EPDM/PTFE/нерж.) и типам затворов для ваших рабочих температур и давления.	\N	\N	2025-10-31 11:45:55.052618+00
a336f856-86f5-4060-a613-d7d502f57058	1166c2f0-7544-4241-983d-7ddd0be62d78	990cf9a6-88ab-465c-a280-b51c0467aeb9	assistant	# Выбор материалов кранов для газовых магистралей многоэтажного дома\n\n## **Рабочие условия для газовых систем**\n\n```\nДавление:      0,3-4 бар (внутридомовые сети)\nТемпература:   -40°C до +60°C (внутри помещений, на улице)\nСреда:          Природный газ (метан 95-98%)\nТребования:     Герметичность, надежность, долговечность\nНорматив:       ГОСТ 9698-85, СНиП 42-01-2002\n```\n\n---\n\n## **МАТЕРИАЛЫ УПЛОТНЕНИЙ И ЗАТВОРОВ**\n\n### **1. PTFE (Политетрафторэтилен) — ТЕФЛОН**\n\n#### ✓ РЕКОМЕНДУЕТСЯ для газа\n\n**Свойства:**\n- Температурный диапазон: -40°C до +200°C\n- Химическая инертность: идеален для углеводородов\n- Коэффициент трения: минимален (0,05-0,1)\n- Герметичность: отличная\n- Износостойкость: высокая\n\n**Применение в кранах:**\n- Уплотнительные кольца затвора (сальник)\n- Прокладки между гайками подвода\n- Обмотка резьбовых соединений (вместо льна)\n\n**Плюсы:**\n```\n✓ Не набухает в газовой среде\n✓ Стабилен в диапазоне -40...+60°C\n✓ Совместим с латунью и сталью\n✓ Минимум утечек при длительной работе\n✓ Ресурс 15-20 лет гарантирован\n```\n\n**Минусы:**\n```\n✗ Дороже эластомеров (EPDM)\n✗ При наладке требует аккуратности\n✗ Чувствителен к механическим повреждениям при монтаже\n```\n\n**Стоимость:**\n- Кран вентильный с PTFE: 2000-3500 руб.\n- Прокладки PTFE отдельно: 50-150 руб./упак.\n\n---\n\n### **2. EPDM (Этилен-пропилен-диеновый каучук)**\n\n#### ⚠️ УСЛОВНО для газа (старый стандарт)\n\n**Свойства:**\n- Температурный диапазон: -40°C до +120°C\n- Химическая стойкость: хорошая к полярным веществам\n- Упругость: хорошая в диапазоне -20...+60°C\n- Набухание в углеводородах: 5-15% (КРИТИЧНО!)\n\n**Применение:**\n- Старые советские краны ВКГ (до 2000-х годов)\n- Резервное уплотнение в комбинированных конструкциях\n\n**Плюсы:**\n```\n✓ Дешевле PTFE (1500-2200 руб./кран)\n✓ Мягче, легче монтировать\n✓ В пределах температур города работает нормально\n```\n\n**Минусы:**\n```\n✗ Набухает в природном газе (особенно при высоком давлении)\n✗ Ресурс сокращается: 10-12 лет вместо 15-20\n✗ Больше утечек после 5-7 лет эксплуатации\n✗ НЕ РЕКОМЕНДУЕТСЯ нормативами для новостроек с 2000-х\n```\n\n**Вывод:** ❌ Не подходит для нового строительства 50-этажного дома\n\n---\n\n### **3. НИКЕЛЬ-ФТОРОПЛАСТ (комбинированный)**\n\n#### ✓ АЛЬТЕРНАТИВА PTFE (редко встречается)\n\n**Состав:**\n- Основа: натуральный каучук + PTFE\n- Процент PTFE: 40-50%\n\n**Свойства:**\n- Температура: -40°C до +80°C\n- Герметичность: хорошая\n- Ресурс: 12-15 лет\n- Стоимость: дешевле чистого PTFE на 15-20%\n\n**Применение:** импортные краны некоторых производителей\n\n**Вывод:** Хороший компромисс, но найти сложно\n\n---\n\n## **МАТЕРИАЛЫ КОРПУСА И ЗАТВОРА**\n\n### **ЛАТУНЬ Л68 (основной материал)**\n\n#### ✓ СТАНДАРТ для газовых кранов\n\n**Состав:** Cu 68% + Zn 32%\n\n**Свойства:**\n- Давление: выдерживает до 10 бар (для газа достаточно)\n- Температура: -40°C до +100°C\n- Коррозийность: минимальна в газовой среде\n- Механическая прочность: хорошая\n- Обрабатываемость: отличная (легко производить)\n\n**Применение:**\n- Корпус крана (основной материал)\n- Шпиндель (вал регулировки)\n- Штуцеры подключения\n\n**Преимущества:**\n```\n✓ Экономична (дешевле нержавейки на 30-40%)\n✓ Не требует антикоррозионной защиты внутри здания\n✓ Теплопроводность: минимизирует конденсат\n✓ Совместима со всеми прокладками\n```\n\n**Недостатки:**\n```\n✗ На улице требует защиты от коррозии (краска, полимер)\n✗ При агрессивных средах может образоваться патина\n✗ Менее презентабельна чем нержавейка (эстетика)\n```\n\n**Стоимость латунного крана:**\n- ВКГ-1: 1500-2500 руб.\n- ВКГ-2: 2500-3500 руб.\n\n---\n\n### **НЕРЖАВЕЮЩАЯ СТАЛЬ 304/316L**\n\n#### ⚠️ ИЗБЫТОЧНО для внутридомовой сети\n\n**Состав:** Fe + Cr (18-20%) + Ni (8-10%)\n\n**Свойства:**\n- Давление: выдерживает до 16 бар (избыток)\n- Температура: -40°C до +400°C (избыток)\n- Коррозийность: идеальна в любых условиях\n- Долговечность: 25-30 лет и более\n- Внешний вид: презентабелен\n\n**Применение:**\n- Краны на улице (для защиты)\n- Краны в техподполах с высокой влажностью\n- Импортные премиум-краны\n\n**Преимущества:**\n```\n✓ Максимальная долговечность (25-30 лет)\n✓ Не требует окраски на улице\n✓ Подходит для агрессивных сред (побережья, промзоны)\n```\n\n**Недостатки:**\n```\n✗ Дорого: в 2-3 раза дороже латуни (4500-7500 руб./кран)\n✗ Избыточные характеристики для газа (нет экономической целесообразности)\n✗ Сложнее обрабатывается (дороже производство)\n✗ Для внутридомовых сетей нет смысла платить переплату\n```\n\n**Рекомендация:** Только для наружных узлов и ввода в дом\n\n---\n\n## **ЗАТВОРЫ: ВИДЫ И ВЫБОР**\n\n### **1. КОНУСНЫЙ ЗАТВОР (Conico) — СТАНДАРТ**\n\n#### ✓ ИСПОЛЬЗУЕТСЯ в 95% газовых вентильных кранов\n\n**Конструкция:**\n```\n        Шпиндель (вал)\n             ↓\n    ┌────────────────┐\n    │     КОНУС      │ ← Коническая поверхность\n    │   (Затвор)     │\n    └─────┬──────────┘\n          │\n    Седло крана (гнездо)\n```\n\n**Материалы:**\n- Конус: латунь Л68\n- Уплотнение: PTFE или EPDM кольцо\n- Седло: латунь с полировкой\n\n**Принцип работы:**\n- Поворот рукоятки → движение конуса вверх/вниз\n- Плавное перекрытие потока\n- Герметизация за счет прижима конуса к седлу\n\n**Свойства:**\n```\n✓ Герметичность:      Отличная (утечка < 0,01 см³/мин)\n✓ Регулировка:        Плавная, точная\n✓ Надежность:         Высокая\n✓ Долговечность:      15-20 лет\n✓ Ремонтопригодность: Легко разобрать и заменить уплотнение\n```\n\n**Недостатки:**\n```\n✗ Требует периодического поворота рукоятки (не менее 1 раза в 3 месяца)\n✗ Чувствителен к загрязнениям в газе\n✗ При длительном неиспользовании может залипнуть (редко)\n```\n\n**Оптимально для:** 50-этажного дома во внутридомовой сети\n\n---\n\n### **2. ШАРОВОЙ ЗАТВОР (Ball Valve)**\n\n#### ❌ НЕ РЕКОМЕНДУЕТСЯ для основной магистрали\n\n**Конструкция:**\n```\n  ┌─────────────────────┐\n  │    Полая СФЕРА      │  Отверстие совпадает с потоком\n  │    (Затвор)         │\n  └─────────────────────┘\n       90° поворот\n```\n\n**Материалы:**\n- Шар: латунь или нержавейка\n- Уплотнение: PTFE (но часто EPDM)\n- Гнездо: латунь\n\n**Проблемы для газа:**\n```\n✗ Дисульфид углерода в газе → кристаллизация на PTFE\n✗ Заклинивание при неполных поворотах\n✗ При частичном открытии → дополнительное сопротивление потоку\n✗ Герметичность хуже: утечка 0,1-1 см³/мин (в 10-100 раз больше)\n✗ Ремонт требует полной замены узла (дорого)\n```\n\n**Использование:** Только для отсечки (полное открытие/закрытие без промежутков)\n\n---\n\n### **3. ДИСКОВЫЙ ЗАТВОР (Butterfly Valve)**\n\n#### ⚠️ ДОПУСТИМО, но редко для газа\n\n**Конструкция:**\n```\n  ↓ Поток газа\n  ┌─────────────────────┐\n  │  Диск (пластина)    │ ← Поворачивается на оси\n  │  с уплотнением      │\n  └─────────────────────┘\n       90° поворот\n```\n\n**Материалы:**\n- Диск: нержавейка (обычно)\n- Уплотнение: PTFE или EPDM\n- Корпус: чугун или латунь\n\n**Свойства:**\n```\n✓ Компактность: занимает мало места\n✓ Быстрое срабатывание: 90° = полный ход\n✓ Низкая стоимость: 2000-3000 руб.\n\n✗ Герметичность: средняя (утечка 0,5-2 см³/мин)\n✗ При частичном открытии → высокое гидродинамическое сопротивление\n✗ Требует большей силы при закрытии\n✗ Чувствителен к вибрациям на магистрали\n```\n\n**Применение в доме:**\n- Для отсечных узлов (редко открывают)\n- НЕ для регулировки потока\n- На входе в технподполье (как грубая отсечка)\n\n---\n\n## **РЕКОМЕНДУЕМАЯ КОНФИГУРАЦИЯ ДЛЯ 50-ЭТАЖНОГО ДОМА**\n\n### **ЗОНА 1: Ввод в дом (улица)**\n\n```\nКраны:           ВЕНТИЛЬНЫЕ с PTFE\nЗатвор:          КОНУСНЫЙ\nКорпус:          НЕРЖАВЕЙКА 304L (защита от коррозии)\nТемпература:     -40...+60°C\nДавление:        до 4 бар\n\nМодели:\n• ВКГ-2 (Италия) нержавейка - 5500 руб.\n• Itap 143 (Испания) нержавейка - 6200 руб.\n• Tiemme (Италия) нержавейка - 5800 руб.\n\nКоличество: 2-4 шт. (разные ветви входа)\nРесурс: 25-30 лет\n```\n\n---\n\n### **ЗОНА 2: Разводка по этажам (внутри, техподполье)**\n\n```\nКраны:           ВЕНТИЛЬНЫЕ с PTFE\nЗатвор:          КОНУСНЫЙ\nКорпус:          ЛАТУНЬ Л68\nТемпература:     +10...+25°C\nДавление:        0,3-2 бар\n\nМодели:\n• ВКГ-1 латунь (Россия) - 1800-2200 руб.\n• Itap 140 латунь (Испания) - 2500 руб.\n• Sertus латунь (Чехия) - 2200 руб.\n• Никель латунь (Россия) - 2000 руб.\n\nКоличество: 50-80 шт. (на разных этажах)\nРесурс: 15-20 лет\n```\n\n---\n\n### **ЗОНА 3: Приборные краны (на газовых плитах, колонках)**\n\n```\nКраны:           ВЕНТИЛЬНЫЕ с PTFE, компактные\nЗатвор:          КОНУСНЫЙ\nКорпус:          ЛАТУНЬ хром (внешний вид важен)\nТемпература:     -5...+40°C\nДавление:        0,3-2 бар\nДиаметр:         8-15 мм (муфтовые)\n\nМодели:\n• Рокот ВКГ-1 (Россия) - 900-1300 руб.\n• Watts латунь (США) - 1200 руб.\n• Caleffi (Италия) - 1500 руб.\n\nКоличество: 100-120 шт. (на каждый прибор)\nРесурс: 15-20 лет\nКритерий: легко видны пользователям → внешний вид\n```\n\n---\n\n### **ЗОНА 4: Отсечные узлы (редкое использование)**\n\n```\nКраны:           ШАРОВЫЕ или ДИСКОВЫЕ (только для отсечки)\nЗатвор:          Шаровой / дисковый\nКорпус:          ЛАТУНЬ\nТемпература:     +10...+25°C\nДавление:        0,3-4 бар\n\nМодели:\n• Шаровой с полнопроходным портом - 1200 руб.\n• Дисковый для отсечки - 1500 руб.\n\nКоличество: 4-6 шт. (главные отсечки, этажные резервы)\nРесурс: 10-15 лет\nПримечание: открывают 1 раз в год на техническое обслуживание\n```\n\n---\n\n## **ПОЛНАЯ СМЕТА ДЛЯ 50-ЭТАЖНОГО ДОМА**\n\n### **По зонам:**\n\n```\nЗОНА 1 (Ввод нержавейка):\n  2-4 крана × 5500 руб. = 11,000-22,000 руб.\n\nЗОНА 2 (Разводка латунь):\n  60 кранов × 2200 руб. = 132,000 руб.\n\nЗОНА 3 (Приборные):\n  110 кранов × 1100 руб. = 121,000 руб.\n\nЗОНА 4 (Отсечные):\n  5 кранов × 1200 руб. = 6,000 руб.\n\nПРОКЛАДКИ PTFE:\n  500 упак. × 80 руб. = 40,000 руб.\n\nМОНТАЖ:\n  175 кранов × 300 руб. = 52,500 руб.\n\n───────────────────────────────\nИТОГО:  ~384,500 руб. (или ~2,200 руб./кран в среднем)\n───────────────────────────────\n```\n\n---\n\n## **ИТОГОВЫЕ РЕКОМЕНДАЦИИ**\n\n### **✓ ОПТИМАЛЬНАЯ КОНФИГУРАЦИЯ:**\n\n| Зона | Затвор | Корпус | Уплотнение | Давление | Ресурс |\n|------|--------|--------|-----------|----------|--------|\n| **Ввод (улица)** | Конусный | Нержавейка | PTFE | 4 бар | 25-30 лет |\n| **Разводка (внутри)** | Конусный | Латунь | PTFE | 2 бар | 15-20 лет |\n| **Приборные** | Конусный | Латунь хром | PTFE | 2 бар | 15-20 лет |\n| **Отсечные** | Шаровой | Латунь | PTFE | 4 бар | 10-15 лет |\n\n### **🎯 КРИТИЧЕСКИЕ ТРЕБОВАНИЯ:**\n\n```\n1. ВСЕ уплотнения = PTFE (не EPDM!)\n2. Затворы = КОНУСНЫЕ для основной сети\n3. Для уличных узлов = НЕРЖАВЕЙКА (долговечность)\n4. Для внутренних = ЛАТУНЬ (экономия без ущерба надежности)\n5. Сертификат ГОСТ 9698-85 — ОБЯЗАТЕЛЕН\n6. Давление кранов ≥ 4 бара (с запасом)\n```\n\n---\n\n## **ПРОВЕРКА ПРИ ЗАКУПКЕ**\n\n### **На упаковке должно быть:**\n\n```\n☑ ГОСТ 9698-85 (или европейский эквивалент EN 331)\n☑ Диапазон: -40°C ... +60°C\n☑ Давление: 0,3-4 бар (или выше)\n☑ Материал: Латунь L68 / Нержавейка AISI 304\n☑ Уплотнение: PTFE (тефлон)\n☑ Сертификат Таможенного союза (EAC)\n☑ Ресурс 15+ лет\n☑ Страна производства (преимущество: Италия, Чехия, Испания)\n```\n\n---\n\n## **ДОЛГОВЕЧНОСТЬ: ФАКТОРЫ ВЛИЯНИЯ**\n\n```\nКак ПРОДЛИТЬ ресурс 15 лет → 20+ лет:\n\n1. Ежемесячный поворот рукоятки на 1/4 оборота\n   (профилактика залипания конуса)\n\n2. Установка фильтра газа перед главными кранами\n   (защита от механических примесей)\n\n3. Средняя влажность помещения 30-60%\n   (избегать крайностей)\n\n4. Защита от прямых солнечных лучей (если на улице)\n\n5. Отсутствие вибраций и механических ударов\n\n6. Периодическое ТО 1 раз в 2-3 года (визуальный осмотр)\n```\n\n**Результат:** При соблюдении этих условий вентильные краны с PTFE прослужат 20-25 лет, полностью окупившись.	anthropic-claude-haiku-4.5	\N	2025-10-31 11:46:40.532559+00
a985015b-462c-4ca6-ada7-d113c2781180	d2adfa9f-0732-4c6f-9459-552f86a55a88	990cf9a6-88ab-465c-a280-b51c0467aeb9	user	какие краны нужно использовать для газа - шаровые или вентильные	\N	\N	2025-10-31 11:58:03.210815+00
bb52d313-dc6f-4825-b764-92a2cbccc54d	ec1d4e56-6330-442f-a3f7-fefc0c276c43	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	user	какие краны нужно использовать для газа - шаровые или вентильные	\N	\N	2025-10-31 11:58:14.783922+00
4830276c-918f-4ac4-af8e-9dc6237ee0ba	ec1d4e56-6330-442f-a3f7-fefc0c276c43	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	assistant	Для газа **категорически рекомендуется использовать шаровые краны**.\n\nВот почему:\n\n*   **Надежность перекрытия:** Шаровые краны обеспечивают полное и герметичное перекрытие потока газа. В закрытом положении шар прижимается к уплотнительным кольцам, исключая любую утечку.\n*   **Долговечность:** Благодаря простой и прочной конструкции, шаровые краны обладают высокой износостойкостью и долговечностью.\n*   **Простота использования:** Для открытия или закрытия шарового крана достаточно повернуть ручку на 90 градусов. Это быстро и интуитивно понятно.\n*   **Меньшее гидравлическое сопротивление:** Когда шаровый кран полностью открыт, он создает минимальное сопротивление потоку газа, что важно для обеспечения стабильного давления.\n*   **Соответствие нормам:** В большинстве стран и регионов строительные нормы и правила, касающиеся газоснабжения, прямо предписывают использование шаровых кранов в качестве запорной арматуры.\n\n**Почему вентильные краны не подходят для газа:**\n\n*   **Риск утечек:** Конструкция вентильного крана (шток, сальниковая набивка, золотник) предрасположена к микроутечкам газа со временем. Сальниковая набивка может изнашиваться, рассыхаться, требуя периодической подтяжки или замены.\n*   **Постепенное закрытие:** Вентильные краны не предназначены для быстрого полного перекрытия. Они рассчитаны на регулировку потока (дросселирование), что не требуется для запорной арматуры в газовых системах.\n*   **Повышенное гидравлическое сопротивление:** Конструкция вентильного крана со множеством поворотов и сужений создает большее сопротивление потоку даже в полностью открытом состоянии.\n*   **Сложность ремонта и обслуживания:** Ремонт вентильного крана (например, замена сальника) сложнее и требует больше времени, чем у шарового.\n\n**Вывод:**\n\nПри монтаже или ремонте газовых систем всегда используйте **специальные шаровые краны для газа**, которые имеют соответствующую маркировку и сертификацию. Это обеспечит безопасность и надежность эксплуатации газового оборудования.	gemini-2.5-flash	\N	2025-10-31 11:58:19.284978+00
0eeff8a2-a68d-4c14-811c-5723f8413da4	d2adfa9f-0732-4c6f-9459-552f86a55a88	990cf9a6-88ab-465c-a280-b51c0467aeb9	assistant	Коротко — для бытового газа чаще и лучше применять шаровые краны. Далее — почему и на что обратить внимание.\n\nПочему шаровый кран предпочтительнее\n- Быстрое закрывание (один поворот на 90°) — удобно при аварии.  \n- Хорошая герметичность (PTFE-седла) и меньшее риск протечек по сравнению с вентилями.  \n- Меньше износа при редких включениях/выключениях; легче обслуживать.  \n- Полнопроходные (полный проход) шаровые краны не создают падения давления.\n\nО вентилях (вентили — многооборотные краны)\n- Позволяют регулирующую подачу, но для газа регулирование потока обычно не требуется (регуляторы/редукторы делают это).  \n- Могут туже ходить, медленно закрываться и с течением времени протекать сильнее, чем шаровые.  \n- Не лучший выбор для аварийного запорного устройства.\n\nНа что ещё обратить внимание\n- Используйте только краны, сертифицированные для работы с газом (соответствующие ГОСТ/сертификаты в вашей стране) — маркировка и паспорт изделия.  \n- Материал: латунь (никелированная) с уплотнениями, устойчивыми к углеводородам (PTFE).  \n- Полнопроходной (full bore) предпочтителен для минимального гидравлического сопротивления.  \n- Конструкция и соединения должны соответствовать нормам (резьбовые/прессовые соединения, уплотнители для газа). Для резьбы использовать газорасчетную ФУМ-ленту или газовый герметик, как предписано местными правилами.  \n- Для гибких подводок к плите/колонке применять специализированные гайки-соединения и шаровой кран непосредственно перед гибкой подводкой.  \n- Для баллонного (сжиженного) газа — используются специальные краны и регуляторы, отличные от магистральных.\n\nБезопасность и монтаж\n- Монтаж и изменения газовой сети должны выполняться/приниматься лицами, уполномоченными по газовому обслуживанию (требуется в большинстве стран).  \n- После установки обязательно проверять герметичность (мыльный раствор, приборы) и соблюдать требования по расположению запорного крана (доступность, ближе к прибору или счетчику, как требует регламент).\n\nЕсли укажете конкретную задачу (кухонная плита, котёл, магистраль, баллонный газ) и страну/регион — подскажу точные типы кранов и требования по сертификации.	gpt-5-mini	\N	2025-10-31 11:58:23.990797+00
6e0300f1-177c-48f6-aec3-c4bd716255c1	ec1d4e56-6330-442f-a3f7-fefc0c276c43	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	user	добавь в сравнение дисковые, проанализируй с точки зрения долговечности и стоимости использования при строительстве многоэтажных до 50 этажей жилых домов.	\N	\N	2025-10-31 12:10:44.08481+00
d89b7fa8-96c3-4935-93f7-f82128252e80	ec1d4e56-6330-442f-a3f7-fefc0c276c43	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	assistant	Отлично! Расширим наш анализ, добавив дисковые затворы и проанализируем их применение в контексте строительства высотных жилых домов до 50 этажей, уделяя внимание долговечности и стоимости использования.\n\n### Сравнение запорной арматуры для газовых систем в высотных жилых домах\n\n| Характеристика          | Шаровые краны                                                                   | Вентильные краны                                                                                                       | Дисковые затворы (Бабочка)                                                                                                              |\n| :---------------------- | :------------------------------------------------------------------------------ | :--------------------------------------------------------------------------------------------------------------------- | :--------------------------------------------------------------------------------------------------------------------------------------- |\n| **Применяемость для газа** | **Рекомендуется и обязательно** (для бытовых и внутридомовых газопроводов).     | **Не рекомендуется и запрещено** (высокий риск утечек, неполное перекрытие).                                      | **Могут использоваться** для газообразных сред, но **редко на внутридомовых сетях**, чаще на магистральных или крупных промышленных. |\n| **Функция**             | Запорный (полностью открыто/закрыто).                                          | Запорно-регулирующий (может регулировать поток).                                                                 | Запорный или регулирующий (при наличии редуктора).                                                                              |\n| **Принцип работы**      | Вращение шара с отверстием на 90 градусов.                                        | Перемещение штока с золотником перпендикулярно потоку.                                                               | Вращение диска вокруг оси, перекрывающего поток.                                                                                |\n| **Герметичность**       | **Высочайшая (класс А по EN 12266-1).** Надежное перекрытие без утечек.       | Средняя/Низкая (класс B-C), склонность к утечкам через сальниковую набивку и золотник.                               | Высокая (класс А при правильном уплотнении). Уплотнение по периметру диска.                                                    |\n| **Долговечность**       | **Высокая.** Простая конструкция, минимальное количество изнашиваемых частей (2 уплотнения). Служат десятилетиями при правильной эксплуатации. | **Низкая/Средняя.** Изнашивание сальниковой набивки, седла, золотника. Требуют регулярного обслуживания.               | **Высокая.** Современные дисковые затворы с качественными уплотнениями долговечны. Меньше движущихся частей, чем у вентиля.       |\n| **Стоимость (единичная)** | **Средняя.** Зависит от материала и производителя.                               | **Низкая (для простых).** Однако стоимость обслуживания может быть высокой.                                            | **Средняя/Высокая.** Зависит от типа (центрический, эксцентриковый), материала и привода.                                      |\n| **Стоимость использования при строительстве 50-этажного дома:** | **Низкая.** Высокая надежность, практически не требуют обслуживания, низкий риск аварий. Однократные инвестиции. | **Высокая.** Затраты на контроль, обслуживание, потенциальный ремонт и риски утечек. Недопустимо для газовых сетей. | **Средняя/Высокая.** Могут быть дороже шаровых кранов, но при больших диаметрах становятся конкурентоспособными. Обслуживание требуется реже, чем у вентилей.                 |\n| **Сопротивление потоку** | **Очень низкое.** Прямой проход в открытом состоянии.                           | **Высокое.** Множественные изменения направления потока.                                                              | **Низкое/Среднее.** Диск находится в потоке, создавая некоторое сопротивление, но значительно меньше, чем вентиль.          |\n| **Рабочее давление**    | Широкий диапазон, в зависимости от конструкции.                                 | Широкий диапазон.                                                                                                      | Широкий диапазон.                                                                                                               |\n| **Габариты**            | Компактные (особенно полнопроходные).                                            | Более громоздкие, чем шаровые, из-за конструкции штока.                                                                        | **Очень компактные, легкие.** Особенно актуально для больших диаметров, так как они значительно меньше шаровых кранов.       |\n| **Установка**           | Простая (не требуют особого положения).                                        | Сложнее (нужен доступ к сальнику).                                                                                   | Относительно простая, установка между фланцами.                                                                                 |\n| **Регулирование**       | Нет (только ON/OFF).                                                            | Да (для регулирования).                                                                                                | Да (при наличии редуктора, но чаще как запорный).                                                                               |\n\n---\n\n### Анализ для строительства многоэтажных (до 50 этажей) жилых домов:\n\n**Контекст газоснабжения в высотных домах:**\nГазовое оборудование и коммуникации в высотных зданиях являются системой повышенной опасности. Требования к надежности, герметичности и долговечности чрезвычайно высоки. Любая утечка газа, особенно на верхних этажах, может иметь катастрофические последствия. Доступ к коммуникациям для обслуживания или ремонта может быть затруднен и дорог.\n\n1.  **Шаровые краны:**\n    *   **Долговечность:** Идеально подходят. Их срок службы, как правило, превышает срок службы самого здания без необходимости сложного обслуживания или замены при условии качественного изготовления и правильной эксплуатации. Отсутствие изнашиваемых сальников и простая кинематика обеспечивают высокую надежность.\n    *   **Стоимость использования:** Низкая. Первоначальная стоимость умеренная. Затраты на эксплуатацию минимальны: не требуют регулярного технического обслуживания, подтяжки или замены уплотнений. Риски аварий и дополнительных затрат из-за утечек крайне низки. Это позволяет один раз смонтировать и забыть на десятилетия. Их компактность также способствует оптимизации пространства в нишах и технических помещениях.\n    *   **Вывод:** **Являются стандартом и наилучшим выбором для внутридомового газоснабжения** многоэтажных жилых домов.\n\n2.  **Вентильные краны:**\n    *   **Долговечность:** Неприемлема для газовых систем в высотках. Сальниковые уплотнения подвержены старению, рассыханию и требуют периодической подтяжки или замены. Золотник и седло изнашиваются. Эти факторы значительно сокращают срок службы до первого крупного обслуживания или утечки, что недопустимо для газа.\n    *   **Стоимость использования:** Высокая (даже если убрать запрет на использование). Несмотря на потенциально низкую начальную стоимость, стоимость эксплуатации (регулярные проверки, обслуживание, замена сальников, возможные экстренные ремонты из-за утечек) будет крайне высокой и экономически невыгодной, не говоря уже о рисках для безопасности.\n    *   **Вывод:** **Категорически не подходят и запрещены** для газовых систем в многоэтажных жилых домах.\n\n3.  **Дисковые затворы:**\n    *   **Долговечность:** Высокая. Современные дисковые затворы с эластомерными или фторопластовыми уплотнениями обладают хорошей долговечностью, сравнимой с шаровыми кранами, особенно для больших диаметров труб.\n    *   **Стоимость использования:** От средней до высокой.\n        *   **На магистральных газопроводах и крупных распределительных сетях (вне жилых домов):** Дисковые затворы часто являются очень экономичным решением для больших диаметров (от DN 100-150 и выше) по сравнению с шаровыми кранами аналогичного диаметра, которые становятся очень громоздкими и дорогими. Их компактность и легкий вес облегчают монтаж больших диаметров.\n        *   **На внутридомовых газопроводах (малые и средние диаметры):** Для диаметров, характерных для внутридомовых сетей (обычно до DN 50, редко до DN 80-100), шаровые краны остаются более экономически выгодными и предпочтительными. Дисковые затворы для таких диаметров не дают существенных преимуществ по стоимости или компактности перед шаровыми, и часто дороже. Кроме того, их основное преимущество (легкость и компактность при больших диаметрах) здесь не реализуется в полной мере.\n    *   **Вывод:** Хотя дисковые затворы технически могут использоваться для газа и обладают хорошей долговечностью, они **не являются оптимальным выбором для внутридомовых газовых сетей в жилых высотных домах малого и среднего диаметра**. Их применение более оправдано на внешних, более крупных участках газопровода или в промышленных целях, где требуется запорная арматура больших диаметров. Для бытового газоснабжения шаровые краны остаются более проверенными, экономически выгодными и соответствующими нормам безопасности.\n\n### Общий вывод для высотного жилого строительства:\n\nПри проектировании и строительстве газовых систем в многоэтажных жилых домах (до 50 этажей) **безусловным лидером и стандартом являются шаровые краны**. Они обеспечивают максимальную безопасность, надежность, долговечность и минимальные эксплуатационные расходы, что критически важно для таких объектов. Использование вентильных кранов для газа запрещено, а дисковые затворы, хотя и могут использоваться для газа, экономически и технически нецелесообразны для внутридомовых сетей малого и среднего диаметра по сравнению с шаровыми кранами.	gemini-2.5-flash	\N	2025-10-31 12:11:01.150174+00
32859c68-ae85-4819-a273-b58e1986a8df	d2adfa9f-0732-4c6f-9459-552f86a55a88	990cf9a6-88ab-465c-a280-b51c0467aeb9	user	добавь в сравнение дисковые, проанализируй с точки зрения долговечности и стоимости использования при строительстве многоэтажных до 50 этажей жилых домов.	\N	\N	2025-10-31 12:11:10.711446+00
dd36d475-c303-4fd6-8906-c067c2aae875	d2adfa9f-0732-4c6f-9459-552f86a55a88	990cf9a6-88ab-465c-a280-b51c0467aeb9	assistant	Добавлю дисковые (заслонки/butterfly) в сравнительную оценку и проанализирую долговечность и стоимость владения при строительстве многоэтажных жилых домов до ~50 этажей. Сфокусируюсь на практических критериях: герметичность, надёжность, обслуживание, цена закупки/монтажа и эксплуатационные особенности.\n\nКраткие выводы (резюмe)\n- Для квартирных ответвлений и малых диаметров (обычно до ~DN40–DN50) — шаровые краны предпочтительнее (лучше герметичность, простота эксплуатации, невысокая цена).\n- Для магистральных стояков и больших диаметров (примерно от DN80–DN100 и выше) — дисковые (butterfly) часто экономичнее и удобнее в монтаже/обслуживании; при правильном выборе сертифицированной конструкции они подходят для газа.\n- Вентили (многооборотные) — использовать по специальной необходимости (регулирование) редко выгодно; они дороже в обслуживании и создают падение давления.\n- Важно: выбирать изделия с допуском/сертификатом для газовой среды и проектировать доступность и эксплуатацию (затворы, блокировки, приводы).\n\nПодробное сравнение по ключевым параметрам\n\n1) Герметичность и утечки\n- Шаровый кран: очень хорошая герметичность при штатных мягких седлах (PTFE) — класс утечек очень низкий. При длительном простое мягкие седла могут "прилипать", но после циклирования обычно дают плотное закрытие.\n- Дисковый (butterfly) с резиновым/полиуретановым седлом: герметичность хорошая, но зависит от исполнения; у дешёвых типов может быть больше микропроникновения чем у шарового. Металлические седла — хуже по утечкам, но выдерживают экстремальные условия.\n- Вентиль (globe): средняя герметичность; со временем уплотнение стекает/давление на сальник — возможны утечки.\n\n2) Долговечность и надежность (меcты эксплуатации в домах)\n- Шаровый: длительный срок при нормальной эксплуатации — часто 15–30+ лет для малых/средних диаметров. Меньше подвержен коррозии при правильном материале (латунь/нержавейка). Мягкие седла изнашиваются при частой эксплуатации/абразиве.\n- Дисковый: хорош для больших диаметров — простая конструкция, меньше металла/массы, долговечность при редком переключении высокая (10–25 лет), но зависит от качества покрытия/сальников и типа седла. Для промышленных/магистральных сетей применяют фланцевые дисковые затворы с долгим ресурсом.\n- Вентиль: сложнее по устройству (гайка штока, сальник), больше изношенных частей — ресурс при малом обслуживании обычно ниже, особенно при редких операциях.\n\n3) Цена закупки и монтажа (ориентировочно, относительная)\n- Малые диаметры (DN15–DN50): шаровые — наиболее дешёвы и компакты; дисковые дороже и избыточны.\n- Средние/большие диаметры (>DN80–DN100): дисковые существенно дешевле в покупке и монтаже по сравнению с шаровыми фланцевыми, менее тяжёлые, требуют меньшего места для монтажа. Шаровый большого диаметра — дорогой и тяжёлый вариант.\n- Вентиль чаще всего дороже шарового на малых диаметрах (за счёт сложности), и в среднем дороже по обслуживанию.\n\n4) Падение давления / гидравлические потери\n- Шаровый (полнопроходной) — минимальное падение давления.\n- Дисковый — при правильном исполнении (полнопроходной/с минимальным сужением) падение небольшое, но чаще выше, чем у полнопроходного шарового.\n- Вентиль — существенное падение давления при полном потоке (неплотная обтекаемость).\n\n5) Эксплуатация в высотных домах (особенности)\n- Доступность и удалённое управление: в стояках высотных зданий удобно предусматривать приводные (эл./пневм) затворы — дисковые легче автоматизировать и дешевле комплектовать приводами в больших диаметрах; небольшие шаровые с электроприводом тоже применимы.\n- Масса и монтаж: дисковые легче для больших диаметров — упрощают монтаж в верхних этажах и на технических этажах.\n- Аварийная локализация: шаровые удобны для быстрых действий (один поворот). Для дисковых тоже один поворот (штурвал/рычаг) — скорость закрытия похожа, но для больших диаметров часто нужен редуктор/привод.\n- Обслуживание/доступ: в многоквартирных проектах важна простота обслуживания — выбирайте конструкции с возможностью замены уплотнений без демонтажа (у некоторых дисковых — возможна замена седла), у шаровых — чаще требуется замена всего корпуса на больших диаметров.\n\n6) Стоимость владения (life‑cycle) — факторы\n- Первичные затраты: малые диам. — шаровый дешевле; большие диам. — дисковый дешевле.\n- Монтаж: дисковый легче и быстрее устанавливать при больших диаметрах, экономия труда.\n- Обслуживание: вентили дороже в обслуживании; шаровые и дисковые при редком использовании требуют периодической проверки и редкой замены уплотнений.\n- Простои/дорогой демонтаж: если штатный тип плохо обслуживается, замена крупного шарового крана обходится дороже (демонтаж фланцев и веса).\nВ сумме: для крупномасштабных стояков и магистралей дисковая арматура часто даёт дешевую эксплуатацию; для квартирных и мелких ответвлений — шаровые.\n\n7) Дополнительные требования для газовых сетей высотных зданий\n- Все краны должны иметь сертификаты/допуски для газа по вашему местному регламенту (ГОСТ/СНиП/правила газоснабжения). Наличие испытаний на герметичность.\n- Пожаробезопасные исполнения (fire‑safe) и конструкция «выбросо‑стойкий» стержень для высокого риска пожара/температуры.\n- Блокировки/пломбирование и доступность (запор перед счётчиком, на каждом стояке, на этажах по проекту).\n- Предусмотреть циклирование (периодическое открытие/закрытие) по регламенту, чтобы не допустить прикипания седел.\n\nРекомендации для проекта многоэтажного дома (до 50 этажей)\n- Квартиры/местные подводки (DN15–DN40/DN50): шаровые краны с сертификатом для бытового/домового газа, полнопроходные для минимального сопротивления, с возможностью фиксации/пломбирования.\n- Этажные/секционные запорные устройства на стояках (DN40–DN100): ориентироваться по диаметровому порогу — если диаметр средний (DN50–DN80) можно использовать шаровый полнопроходной; если диаметр >=DN80–DN100 — дисковый (wafer/lug) газовый затвор экономичнее и удобнее. Обеспечить фланцевые соединения, доступ к редуктору/приводу.\n- Магистральные вводы и распределение (большие диаметры): дисковые/фланцевые затворы, возможно с электроприводом и дистанционным контролем; предусмотреть байпасы/редундантность для обслуживания без отключения всего стояка.\n- Используйте минимально возможное количество типов арматуры и унифицируйте комплектующие, чтобы снизить складские запасы по эксплуатации.\n\nПрактические советы по выбору и эксплуатации\n- Требование сертификации для газа — первично. Не экономьте на допуске.\n- Для больших диаметров выбирайте дисковые затворы с резиновым/полимерным седлом, сертифицированные для газа; при требованиях к нулевой утечке — искать fire‑safe/metal‑to‑metal варианты.\n- Проводите протоколы приёмки: проверка на герметичность, проверка работы привода и возможность пломбирования.\n- Планируйте периодическое циклирование (ежегодно или по регламенту) и проверку на утечки.\n- Проектируйте точки доступа/люки для обслуживания запорной арматуры.\n\nЕсли нужно, могу:\n- Привести ориентировочные относительные цены (в %/рублях) для типичных диаметров и примеры моделей (производители) с допусками под газ.\n- Помочь подобрать конкретные типы (DN, PN, материал седла) под ваш проект, если вы укажете диаметры магистралей, рабочие давления и локальные нормативы/стандарт(ы).	gpt-5-mini	\N	2025-10-31 12:11:59.564095+00
5a34d90c-92ed-402b-9a1a-70138fdc5ce7	252e5acb-8893-4a7d-b2ee-164dfe42dc3a	98b67609-9822-4cb9-b2ed-14e3034c8559	user	какие краны нужно использовать для газа - шаровые или вентильные	\N	\N	2025-10-31 12:25:01.157974+00
6a0aa565-683f-4d1c-94ce-365a76dc3eba	252e5acb-8893-4a7d-b2ee-164dfe42dc3a	98b67609-9822-4cb9-b2ed-14e3034c8559	assistant	Для газовых систембытового газа, природного газа или пропана) рекомендуется использоватьшаровые краны (ball valves). Вот почему:\n\n### Преимущества шаровых кранов для газа:\n-Полное перекрытие потока**: Шаровой кран обеспечивает 100% герметичность в закрытом положении, минимизируя риск утечек, что критично для безопасности.\n- **Быстрое и надежное управление**: Открытие/закрытие происходит поворотом рукоятки на 90°, без необходимости в большом усилии. Это удобно для аварийного отключения.\n- **Устойчивость к коррозии и износу**: Современные шаровые краны из латуни или нержавеющей стали с тефлоновыми уплотнителями хорошо подходят для газа, не заедают и служат долго.\n- **Соответствие нормам**: В России и странах СНГ (по ГОСТам и нормам СП 62.13330.2011) шаровые краны обязательны для газовых трубопроводов в быту и малом бизнесе. Они используются на входе газа в дом, на плитах, котлах и т.д.\n\n### Когда используются вентильные краны (gate valves)?\n- Вентильные краны (клиновые или параллельные) реже применяются для газа, так как они предназначены в основном для жидкостей (воды, нефти). Они обеспечивают регулировку потока, но в закрытом положении могут иметь микропротечки, что опасно для газа.\n- Их используют только в промышленных газовых системах, где нужен точный контроль давления (например, на магистралях), и то с дополнительными уплотнителями. Для бытового газа они не рекомендуются и могут быть запрещены.\n\n### Важные советы:\n- **Безопасность превыше всего**: Устанавливать газовые краны должен только сертифицированный специалист (газовщик). Самостоятельная установка может привести к утечкам и взрыву.\n- **Проверяйте маркировку**: Выбирайте краны с пометкой "для газа" (G или Gas), с соответствующим давлением (обычно PN 16 или выше) и сертификатами (ГОСТ Р 54996-2012 для России).\n- **Не экономьте**: Дешевые аналоги могут подвести. Рекомендуемые бренды: ITV, DIAMOND, VALTEC или аналогичные.\n\nЕсли у вас конкретная ситуация (например, замена в квартире или на даче), уточните детали — помогу разобраться! Но обязательно проконсультируйтесь с местной газовой службой.	grok-4-fast	\N	2025-10-31 12:25:06.325212+00
fa2e10b8-7bae-4864-ba87-08083b058cee	252e5acb-8893-4a7d-b2ee-164dfe42dc3a	98b67609-9822-4cb9-b2ed-14e3034c8559	user	добавь в сравнение дисковые, проанализируй с точки зрения долговечности и стоимости использования при строительстве многоэтажных до 50 этажей жилых домов.	\N	\N	2025-10-31 12:25:22.08996+00
efe2d014-17a3-4b97-8037-a0a4e19b744b	252e5acb-8893-4a7d-b2ee-164dfe42dc3a	98b67609-9822-4cb9-b2ed-14e3034c8559	assistant	### Сравнение шаровых, вентильных и дисковых кранов для газовых систем в многотажных жилых домах (до 50 этажей)\n\nВ контексте строительства и эксплуатации газовых систем в многоэтажных жилых домах (высотные здания до 50 этажей) выбор кранов определяется не только типом газа (природный, сжиженный), но и спецификой системы: вертикальные стояки, горизонтальные разводки по этажам, коллекторы и точки потребления (квартиры, котельные). Газовые трубопроводы здесь работают под давлением до 0,005–0,3 МПа (низкое/среднее), с требованиями к полной герметичности, минимальным гидравлическим сопротивлением и соответствием нормам (СП 62.13330.2011 "Газораспределительные системы", ГОСТ Р 54996-2012 для арматуры, а также пожарным нормам по СП 4.13130.2013). \n\nЯ добавлю в сравнение **дисковые краны (butterfly valves, или поворотные затворы)**, которые часто применяются в крупных системах. Анализ фокусируется на **долговечности** (срок службы, износостойкость, частота обслуживания) и **стоимости использования** (учитывая закупку, монтаж, эксплуатацию и возможные простои в многоэтажном здании с тысячами квартир). Данные основаны на типичных инженерных практиках для России/СНГ; цены ориентировочные (2023–2024 гг., без НДС, для DN 50–200 мм).\n\n#### 1. **Шаровые краны (ball valves)**\n   - **Применение в многоэтажках**: Идеальны для запорной арматуры — на входах в стояки, этажные коллекторы, квартирные отсеки и точки потребления (плиты, котлы). Обеспечивают полное перекрытие потока без регулировки. В высотных зданиях используются для аварийного отключения (быстрый поворот на 90°).\n   - **Долговечность**:\n     - Высокая: Срок службы 30–50 лет при правильной установке (латунь/нержавейка с PTFE-уплотнителями). Минимальный износ — шар не трется о седло, устойчивость к коррозии от газа и конденсата. В многоэтажках реже требуют обслуживания (1 раз в 5–10 лет), но при засорении (редко для газа) — простая замена.\n     - Минусы: В очень высоких зданиях (40+ этажей) на верхних этажах возможны вибрации от ветра/трафика, что ускоряет износ уплотнителей (на 10–20% короче срока).\n   - **Стоимость использования**:\n     - Закупка: 5–15 тыс. руб. за единицу (DN 50–100 мм); для больших — до 50 тыс. руб.\n     - Монтаж: 2–5 тыс. руб./шт. (простой, без специального оборудования).\n     - Эксплуатация: Низкая — минимальное обслуживание (0,5–1 тыс. руб./год на здание). Общая стоимость на 1000-квартирный дом (с ~500 кранами): 5–10 млн руб. за 20 лет (включая замены). Экономия на безопасности: избегают утечек, штрафов и простоев (утечка газа в высотке — катастрофа).\n     - Итог: Дороже на старте, но окупается долговечностью и отсутствием рисков.\n\n#### 2. **Вентильные краны (gate valves, клиновые или параллельные)**\n   - **Применение в многоэтажках**: Редко для газа — в основном в промышленных магистралях или как резервные на входах в здание (не на этажах). Предназначены для редкого открытия/закрытия, с регулировкой потока, но не рекомендуются для бытовых газовых систем из-за риска микропротечек. В высотках используются только в комбинации с другими кранами (например, для грубой регулировки на подвале).\n   - **Долговечность**:\n     - Средняя: Срок службы 20–40 лет (чугун/сталь с резиновыми уплотнителями). Клиновый механизм подвержен заеданию от осадков газа или коррозии, требует смазки и проверки 1–2 раза в год. В многоэтажках (с перепадами давления по высоте) износ ускоряется на 20–30% — возможны утечки до 0,1–0,5% потока. Не подходят для частого использования, иначе срок сокращается вдвое.\n     - Минусы: В газе с серой (природный газ) коррозия сильнее, что критично в высотных системах с длинными стояками.\n   - **Стоимость использования**:\n     - Закупка: 3–10 тыс. руб. (дешевле шаровых на 20–30%).\n     - Монтаж: 3–7 тыс. руб./шт. (требует больше усилий, иногда сварки).\n     - Эксплуатация: Выше — обслуживание 2–5 тыс. руб./год (регулировка, замена уплотнителей). Для 1000-квартирного дома (с ~200 кранами): 4–8 млн руб. за 20 лет, плюс риски: утечка может стоить 1–10 млн руб. (ремонт, эвакуация, штрафы от Ростехнадзора).\n     - Итог: Дешевле изначально, но дороже в долгосрочке из-за простоев и ремонта. В многоэтажках часто заменяют на шаровые по нормам.\n\n#### 3. **Дисковые краны (butterfly valves, поворотные затворы)**\n   - **Применение в многоэтажках**: Подходят для газовых магистралей среднего/большого диаметра (DN 100+ мм) — на стояках, коллекторах и входах в здание. Обеспечивают хорошую герметичность (до 99,9% с мягкими уплотнителями) и регулировку потока поворотом диска на 90°. В высотных домах популярны для экономии пространства (компактные, легкие) и снижения гидравлических потерь. Используются в комбинации с шаровыми (дисковые на магистрали, шаровые на ветках).\n   - **Долговечность**:\n     - Хорошая: Срок службы 25–40 лет (нержавейка/чугун с EPDM/PTFE-уплотнителями). Диск минимально трется, устойчив к вибрациям в высотках. В газовых системах износ уплотнителей — основной фактор (замена каждые 5–10 лет), но общий срок выше вентильных. В многоэтажках (с низким давлением газа) долговечность на 10–15% лучше, чем в жидкостных системах, но требует защиты от конденсата (антикоррозийное покрытие).\n     - Минусы: При некачественной установке (например, без опор) диск может деформироваться от термических расширений труб в 50-этажке, сократив срок на 20%.\n   - **Стоимость использования**:\n     - Закупка: 4–12 тыс. руб. (для больших DN — дешевле шаровых на 30–50%, т.к. легче).\n     - Монтаж: 1–4 тыс. руб./шт. (быстрый, фланцевый или Wafer-тип без сварки).\n     - Эксплуатация: Средняя — обслуживание 1–3 тыс. руб./год (проверка уплотнителей). Для 1000-квартирного дома (с ~300 кранами, в основном на магистралях): 3–7 млн руб. за 20 лет. Экономия на весе/пространстве: в высотке снижает нагрузку на конструкцию, экономя 5–10% на строительстве.\n     - Итог: Оптимальный баланс — дешевле шаровых для крупных систем, с хорошей окупаемостью в эксплуатации. Рекомендуются для современных высоток (например, в проектах типа "Москва-Сити").\n\n### Общий анализ и рекомендации для многоэтажных домов\n- **Долговечность в контексте высоток**: Шаровые лидируют (минимальные риски утечек на этажах, где доступ ограничен). Дисковые — хороши для магистралей (компактны, выдерживают вертикальные нагрузки). Вентильные — наименее надежны для газа (риск в стояках из-за гравитации и давления). В зданиях до 50 этажей ключ — комбинированный подход: дисковые/шаровые на 80–90% системы, вентильные — только как вспомогательные. Общий срок газовой арматуры в высотке — 30+ лет при ежегодных инспекциях (по нормам Газпрома/локальных служб).\n  \n- **Стоимость использования**: \n  - **Шаровые**: Высокая начальная (10–15% бюджета на арматуру), но низкая эксплуатационная (экономия 20–30% на авариях vs. вентильные).\n  - **Вентильные**: Низкая на старте (экономия 15–20%), но общая выше из-за ремонтов (доп. 10–15% за 20 лет).\n  - **Дисковые**: Самый экономичный вариант для масштаба (снижение на 20–40% для магистралей по сравнению с шаровыми), особенно в новых стройках — окупаемость 5–7 лет.\n  - Для 50-этажного дома (10–20 тыс. м², ~2000 квартир): Общий бюджет на газовую арматуру — 20–50 млн руб. Выбор дисковых/шаровыми снижает эксплуатационные расходы на 15–25% за счет надежности.\n\n**Важно**: В многоэтажках газовые системы проектируются с учетом сейсмостойкости и пожаробезопасности (СП 31.13330.2021). Устанавливать/выбирать должен проектный институт или сертифицированный подрядчик (например, с допуском Ростехнадзора). Для газа обязательны краны с сертификатами взрывозащиты (ATEX или ГОСТ Р ИСО 9001). Если строите/ремонтируете — обратитесь в местную газовую службу или инженера; самостоятельный выбор может привести к отказу в вводе объекта.\n\nЕсли нужны детали по конкретным брендам (например, AVK для дисковых или Rusvalve для шаровых) или расчеты для вашего проекта, уточните!	grok-4-fast	\N	2025-10-31 12:25:40.610118+00
9bc29c0c-547e-4415-83b3-461bf6f0a332	252e5acb-8893-4a7d-b2ee-164dfe42dc3a	98b67609-9822-4cb9-b2ed-14e3034c8559	user	проведи такой же анализ для водоснабжения	\N	\N	2025-10-31 12:57:31.274431+00
923bea93-1c55-4c6c-bcf7-5e5a5e592633	252e5acb-8893-4a7d-b2ee-164dfe42dc3a	98b67609-9822-4cb9-b2ed-14e3034c8559	assistant	###равнение шаровых, вентильных и дисковых кранов для водоснабжения в многоэтажных жилых домах (до 50 этажей)\n\nВексте строительства и эксплуатации систем водоснабжения (ХВС — холодное водоснабжение и ГВС — горячее водоснабжение) в многоэтажных жилых домах (высотные здания до 50 этажей) выбор кранов определяется особенностями системы: вертикальные стояки (до 150–200 м высоты), горизонтальные разводки по этажам, подпитка от насосных станций или централизованного водопровода, давление 0,1–1 МПа (с учетом напора по высоте). Вода содержит минералы (кальций, хлор), что приводит к накипи и коррозии; ГВС нагревается до 60–70°C. Краны обеспечивают запор, регулировку потока и герметичность, минимизируя утечки (до 1–2% потерь в системе). Нормы: СП 30.13330.2016 "Внутренний водопровод и канализация зданий", СП 60.13330.2020 "Отопление, вентиляция и кондиционирование", ГОСТ Р 52520-2006 (арматура для воды), а также санитарные требования по СанПиН 2.1.4.1074-01. \n\nАнализ фокусируется на **долговечности** (срок службы, устойчивость к коррозии/накипи, частота обслуживания) и **стоимости использования** (закупка, монтаж, эксплуатация, включая потери воды и простои в здании с тысячами жителей). Данные для России/СНГ; цены ориентировочные (2023–2024 гг., без НДС, для DN 50–200 мм, подходящих для воды). В отличие от газа, для воды краны могут регулировать поток (не только запирать), и вентильные здесь чаще применяются из-за традиции.\n\n#### 1. **Шаровые краны (ball valves)**\n   - **Применение в многоэтажках**: Основной выбор для запорной арматуры — на этажных узлах, квартирных входах, смесителях и точках водоразбора (души, краны). Обеспечивают полное перекрытие без регулировки. В высотных зданиях используются для быстрого отключения (поворот на 90°), особенно в ГВС для предотвращения перегрева стояков.\n   - **Долговечность**:\n     - Высокая: Срок службы 20–40 лет (латунь/нержавейка с PTFE- или EPDM-уплотнителями). Устойчивость к накипи — шар не забивается, но в жесткой воде уплотнители изнашиваются быстрее (замена каждые 5–8 лет в ГВС). В многоэтажках минимальный износ от гидроударов (напряжение по стоякам), но на верхних этажах (40+ этажей) низкое давление может привести к кавитации, сократив срок на 10–15%. Обслуживание редкое (1 раз в 5 лет).\n     - Минусы: В ГВС (горячая вода) терморасширение ускоряет коррозию на 20%, если не использовать нержавейку.\n   - **Стоимость использования**:\n     - Закупка: 3–10 тыс. руб. за единицу (DN 50–100 мм); для больших — до 30 тыс. руб.\n     - Монтаж: 1–4 тыс. руб./шт. (простой, резьбовой или фланцевый).\n     - Эксплуатация: Низкая — 0,5–2 тыс. руб./год на здание (проверка, смазка). Для 1000-квартирного дома (с ~800 кранами): 4–8 млн руб. за 20 лет (включая замены). Экономия: Минимизируют утечки (до 5–10 м³/сутки на дом), снижая счета за воду на 10–15%.\n     - Итог: Дороже на старте, но окупается удобством и надежностью, особенно в современных проектах (снижение простоев на ремонт).\n\n#### 2. **Вентильные краны (gate valves, клиновые или параллельные)**\n   - **Применение в многоэтажках**: Традиционный выбор для магистралей и стояков (DN 100+ мм) — на входах в здание, этажных коллекторах и насосных. Предназначены для редкого открытия/закрытия с регулировкой потока (линейная герметичность). В высотках используются для грубой балансировки напора (например, на нижних этажах, где давление выше).\n   - **Долговечность**:\n     - Средняя: Срок службы 15–30 лет (чугун/сталь с резиновыми/металлическими уплотнителями). Клиновый механизм забивается накипью и осадком в воде (особенно ХВС с хлором), требует смазки и проверки 1–2 раза в год. В многоэтажках гидроудары и вибрации от насосов ускоряют износ на 25–30% — возможны утечки 1–5% потока. В ГВС коррозия от нагрева сокращает срок вдвое по сравнению с ХВС.\n     - Минусы: Не подходят для частого использования (заедание), в высотках на верхних этажах давление падает, что приводит к неполному закрытию.\n   - **Стоимость использования**:\n     - Закупка: 2–8 тыс. руб. (дешевле шаровых на 20–40%, особенно чугунные).\n     - Монтаж: 2–5 тыс. руб./шт. (требует редукторов для больших, иногда сварки).\n     - Эксплуатация: Выше — 1–4 тыс. руб./год (регулировка, чистка от накипи). Для 1000-квартирного дома (с ~400 кранами): 3–7 млн руб. за 20 лет, плюс потери: утечки могут добавить 10–20% к расходу воды (доп. 5–10 млн руб. за счет тарифов). Риски простоев — ремонт стояка в высотке парализует воду для сотен квартир.\n     - Итог: Самые дешевые изначально, но дороже в эксплуатации из-за частого обслуживания и потерь. В новых стройках постепенно заменяют на современные аналоги по нормам энергоэффективности.\n\n#### 3. **Дисковые краны (butterfly valves, поворотные затворы)**\n   - **Применение в многоэтажках**: Идеальны для крупных магистралей (DN 100–300 мм) — на подпитке, стояках и коллекторах. Обеспечивают регулировку потока (до 90° поворота) и хорошую герметичность (99% с мягкими уплотнителями). В высотных домах популярны для балансировки системы (автоматизированные с приводами), особенно в ГВС для снижения гидравлических потерь.\n   - **Долговечность**:\n     - Хорошая: Срок службы 20–35 лет (нержавейка/чугун с EPDM/PTFE-уплотнителями). Диск устойчив к накипи (компактный дизайн), но уплотнители изнашиваются от абразива в воде (замена каждые 4–7 лет в ХВС). В многоэтажках выдерживают напоры и термонагрузы лучше вентильных; на верхних этажах (низкий напор) долговечность выше на 15%. Обслуживание проще, чем у вентильных.\n     - Минусы: В жесткой воде (высокий pH) коррозия диска может сократить срок на 10–20%, особенно в ГВС без защиты (рекомендуется покрытие).\n   - **Стоимость использования**:\n     - Закупка: 3–10 тыс. руб. (для больших DN — дешевле шаровых на 30–50%, легкие конструкции).\n     - Монтаж: 1–3 тыс. руб./шт. (компактные, Wafer- или фланцевый тип, без сварки в большинстве случаев).\n     - Эксплуатация: Средняя — 0,8–2,5 тыс. руб./год (инспекция уплотнителей, реже чистка). Для 1000-квартирного дома (с ~500 кранами, в основном магистрали): 3–6 млн руб. за 20 лет. Экономия: Снижают потери потока на 10–15% (экономия на насосах и воде до 20%), плюс компактность уменьшает нагрузку на перекрытия в 50-этажке (экономия 5% на конструкции).\n     - Итог: Оптимальный баланс для масштаба — окупаемость 4–6 лет, особенно с автоматизацией (BMS-системы в высотках).\n\n### Общий анализ и рекомендации для многоэтажных домов\n- **Долговечность в контексте высоток**: Шаровые лидируют для распределительных узлов (минимальный износ в квартирах, где доступ ограничен). Дисковые — лучшие для магистралей (компактны, регулируют напор по этажам). Вентильные — устаревающий вариант (риск накипи в стояках), но все еще используются в бюджетных проектах. Общий срок водопроводной арматуры — 25+ лет при фильтрах и антикоррозийной обработке (ежегодные инспекции по нормам ЖКХ). В ГВС долговечность на 15–20% ниже из-за температуры; ключ — комбинация: дисковые/шаровые на 70–80% системы, вентильные как резерв.\n  \n- **Стоимость использования**: \n  - **Шаровые**: Средняя начальная (10–20% бюджета на арматуру), низкая эксплуатационная (экономия 15–25% на утечках vs. вентильные).\n  - **Вентильные**: Низкая на старте (экономия 20–30%), но общая выше из-за обслуживания и потерь воды (доп. 10–20% за 20 лет).\n  - **Дисковые**: Самый экономичный для крупных систем (снижение на 25–40% по сравнению с вентилями), особенно в энергоэффективных высотках — окупаемость 5–8 лет за счет снижения энергозатрат на прокачку.\n  - Для 50-этажного дома (10–20 тыс. м², ~2000 квартир): Общий бюджет на водопроводную арматуру — 15–40 млн руб. Выбор дисковых/шаровыми снижает эксплуатационные расходы на 20–30% (учитывая тарифы на воду ~50–100 руб./м³).\n\n**Важно**: В многоэтажках водоснабжение проектируется с учетом гидравлического расчета (напор на верхних этажах ~0,1 МПа, возможно, с редукторами). Устанавливать/выбирать должен проектный институт или подрядчик с допуском (СРО, по нормам Ростехнадзора для высоток). Обязательны краны с сертификатами (ГОСТ на давление и температуру), с защитой от бактерий (нержавейка для ГВС). Фильтры на входе продлят срок любой арматуры. Если строите/ремонтируете — проконсультируйтесь с водоканалом или инженером; несоответствие может привести к авариям и отказу в регистрации.\n\nЕсли нужны детали по брендам (например, VALTEC для шаровых, AVK для дисковых или KLINGER для вентильных) или расчеты для конкретного проекта, уточните!	grok-4-fast	\N	2025-10-31 12:57:48.432909+00
a811c70f-8c34-408e-a365-6e3727f55aa2	252e5acb-8893-4a7d-b2ee-164dfe42dc3a	98b67609-9822-4cb9-b2ed-14e3034c8559	user	проведи такой же анализ для отопления	\N	\N	2025-10-31 12:58:48.763766+00
d8620d2f-5ed2-4aa8-aa6e-fdb7df5811c1	252e5acb-8893-4a7d-b2ee-164dfe42dc3a	98b67609-9822-4cb9-b2ed-14e3034c8559	assistant	### Сравнение шаровых, вентильных и дисковых кранов для систем отопления в многоэтажных жилых домах (до 50 этажей)\n\nВ контексте строительства и эксплуатации систем отопления (теплоснабжение от центральной котельной или ТЭЦ) в многоэтажных жилых домах (высотные здания до 50 этажей) выбор кранов определяется особенностями системы: вертикальные стояки отопления (до 150–200 м высоты), горизонтальные разводки по этажам, коллекторные узлы, термостатические клапаны (ТРВ), балансировочные краны, расширительные баки и циркуляционные насосы. Теплоноситель (вода) нагревается до 60–95°C в сетях, в подающем трубопроводе давление 0,6–1,6 МПа, обратка — 0,3–0,8 МПа (с учетом напора по высоте и сопротивления). Вода содержит растворенные газы (кислород, углекислый газ), что вызывает коррозию системы (особенно в открытых сетях); образуется шлам и накипь. Краны обеспечивают запор, регулировку потока и балансировку температуры по этажам/квартирам. Нормы: СП 60.13330.2020 "Отопление, вентиляция и кондиционирование зданий", СП 41.101-2003 "Проектирование и монтаж внутридомовых систем газораспределения из полиэтилена", ГОСТ 12.2.085-2002 (арматура для систем отопления), ГОСТ 3522-2002 (латунь для горячих сред), а также гидравлический расчет по нормам Минстроя.\n\nАнализ фокусируется на **долговечности** (срок службы, устойчивость к коррозии, накипи, термоциклированию, частота обслуживания) и **стоимости использования** (закупка, монтаж, эксплуатация, включая потери тепла, простои в отопительный сезон). Данные для России/СНГ; цены ориентировочные (2023–2024 гг., без НДС, для DN 15–200 мм, типичные для отопления).\n\n---\n\n#### 1. **Шаровые краны (ball valves)**\n   - **Применение в многоэтажках**: Главный выбор для запорной арматуры в отоплении — на входах в квартиры, радиаторах, коллекторах, узлах горячего водоснабжения и подпитки. Обеспечивают полное перекрытие потока без регулировки. В высотных зданиях используются для быстрого отключения (поворот на 90°), особенно при аварийных работах на стояке (замена радиаторов, протечки).\n   - **Долговечность**:\n     - Высокая: Срок службы 20–40 лет (латунь CW617N с PTFE- или EPDM-уплотнителями для горячих сред). Устойчивость к тепловому расширению — шар минимально подвержен деформации, но в условиях постоянного циклирования температуры (60–95°C в сезон, минимум летом) уплотнители изнашиваются быстрее, чем в холодном водопроводе. В многоэтажках работают непрерывно 150–200 дней в сезон, требуя редкого обслуживания (1 раз в 3–5 лет). На верхних этажах (40+ этажей) низкие напоры могут привести к кавитации при резком закрытии, сократив срок на 10–15%.\n     - Минусы: В отопительных системах с кислородом (полуоткрытые сети или старые системы) коррозия внутри латуни возможна за 15–25 лет; требуется ингибитор (например, добавки в теплоноситель). Проблема актуальна в региональных сетях с плохой обработкой воды.\n   - **Стоимость использования**:\n     - Закупка: 2–8 тыс. руб. за единицу (DN 15–50 мм); для больших (DN 100+) — до 25 тыс. руб.\n     - Монтаж: 1–3 тыс. руб./шт. (простой, резьбовой, иногда сварка для больших).\n     - Эксплуатация: Низкая — 0,3–1,5 тыс. руб./год на здание (проверка герметичности, смазка шпинделя). Для 1000-квартирного дома (с ~1500 кранов в отоплении и ГВС): 3–6 млн руб. за 20 лет (включая замены и гидравлическую промывку). Экономия тепла: минимизируют утечки из стояков, теряющих тепло (сокращение потерь на 5–8%).\n     - Итог: Оптимальный выбор по цене и надежности; дороже на старте, но окупается долговечностью и удобством управления (быстрое отключение аварийного стояка).\n\n#### 2. **Вентильные краны (gate valves, клиновые или параллельные)**\n   - **Применение в многоэтажках**: Традиционный выбор для магистралей и стояков (DN 50+ мм) — на входах теплоснабжения в здание, балансировочных узлах и циркуляционных сетях. Предназначены для редкого открытия/закрытия с регулировкой потока (используются как балансировочные для распределения тепла по этажам).\n   - **Долговечность**:\n     - Средняя к низкой: Срок службы 12–25 лет (чугун/сталь с резиновыми или металлическими уплотнителями). Клиновый механизм подвергается интенсивной коррозии в горячей воде с кислородом — шлам (окислы железа) забивает канал между клином и сёдлами, приводя к заеданию и неполному закрытию. В многоэтажках обслуживание требуется ежегодно (промывка, регулировка), что приводит к простоям в отопительный сезон. На верхних этажах проблема обостряется: низкий напор не обеспечивает герметичность закрытия.\n     - Минусы: Термоциклирование (150–200 дней в году 60–95°C, летом остывание) вызывает линейное расширение, деформирующее клин на 2–5 мм; возможны микротечи через несколько лет. В замкнутых системах (с ингибиторами) долговечность выше на 20–30%, но в открытых сетях срок сокращается вдвое.\n   - **Стоимость использования**:\n     - Закупка: 1,5–6 тыс. руб. (дешевле шаровых на 30–50%, особенно чугунные).\n     - Монтаж: 2–4 тыс. руб./шт. (требует редукторов для больших, учёта теплового расширения).\n     - Эксплуатация: Высокая — 1–3 тыс. руб./год (ежегодная промывка, регулировка, замена прокладок). Для 1000-квартирного дома (с ~600 кранами в магистралях): 3–5 млн руб. за 20 лет, плюс потери тепла: неполное закрытие и утечки добавляют 3–7% к расходу теплоносителя (доп. 2–5 млн руб. за счет теплотарифов ~1500–3000 руб./Гкал). Риски простоев — ремонт магистрали в отопительный сезон парализует тепло для сотен квартир (компенсация убытков от холода может быть дорогостоящей).\n     - Итог: Дешевле на старте, но дороже в эксплуатации из-за частого обслуживания, потерь тепла и рисков аварий.\n\n#### 3. **Дисковые краны (butterfly valves, поворотные затворы)**\n   - **Применение в многоэтажках**: Идеальны для крупных магистралей (DN 100–300 мм) — на подпитке, стояках и коллекторах, особенно в балансировочных узлах (автоматизированные с приводами и регулирующей электроникой). Обеспечивают регулировку потока (до 90° поворота) и хорошую герметичность (99% с мягкими уплотнителями, устойчивыми к 110°C). В современных высотках используются в гидравлических стрелках (гидравлическое разделение первичной и вторичной сетей) для выравнивания давления.\n   - **Долговечность**:\n     - Хорошая: Срок службы 18–35 лет (нержавейка 304 или чугун с EPDM/PTFE-уплотнителями для 110°C). Диск устойчив к накипи и коррозии (компактный дизайн, не забивается), но уплотнители подвергаются озверению от кислорода и высокой температуры — требуют замены каждые 5–10 лет (в зависимости от чистоты теплоносителя). В многоэтажках выдерживают термоциклирование лучше вентильных; на верхних этажах долговечность выше на 15–25% благодаря простой конструкции. Обслуживание требуется реже (1 раз в 2–3 года).\n     - Минусы: Коррозия диска возможна в открытых сетях без ингибиторов (сокращение срока на 20–30%), но в замкнутых системах (типичные для многоэтажек) проблема минимальна. При неправильной установке (без опор на больших диаметрах) тепловые напряжения могут деформировать диск.\n   - **Стоимость использования**:\n     - Закупка: 2–8 тыс. руб. (для больших DN — дешевле шаровых на 30–50%, легкие).\n     - Монтаж: 1–3 тыс. руб./шт. (компактные, фланцевый или Wafer-тип, без сварки в большинстве).\n     - Эксплуатация: Средняя — 0,5–2 тыс. руб./год (инспекция уплотнителей, реже промывка). Для 1000-квартирного дома (с ~800 кранами, в основном магистрали): 2–4 млн руб. за 20 лет. Экономия тепла: снижают потери потока на 10–20% (гидравлическое сопротивление ниже, чем у вентильных), экономия на циркуляционных насосах 15–25% (экономия энергии 50–100 тыс. руб./год в 50-этажке). Итого экономия за 20 лет: 1–2 млн руб. на электричестве, плюс снижение потерь тепла на 5–8% (доп. 1–3 млн руб.).\n     - Итог: Оптимальный баланс для масштаба — окупаемость 6–10 лет за счет энергоэффективности, особенно с автоматизацией (BMS-системы для управления температурой по этажам).\n\n---\n\n### Детальное сравнение по ключевым параметрам\n\n| **Параметр** | **Шаровые** | **Вентильные** | **Дисковые** |\n|---|---|---|---|\n| **Срок службы** | 20–40 лет | 12–25 лет | 18–35 лет |\n| **Устойчивость к коррозии (в замкнутых сетях)** | ⭐⭐⭐⭐ | ⭐⭐⭐ | ⭐⭐⭐⭐ |\n| **Устойчивость к накипи/шламу** | ⭐⭐⭐⭐ | ⭐⭐ | ⭐⭐⭐⭐ |\n| **Термоустойчивость (до 110°C)** | ⭐⭐⭐⭐ | ⭐⭐⭐ | ⭐⭐⭐⭐ |\n| **Гидравл. потери (сопротивление)** | Средние | Высокие (до 3x выше) | Низкие (минимум) |\n| **Быстрое открытие/закрытие** | ⭐⭐⭐⭐⭐ | ⭐⭐ | ⭐⭐⭐ |\n| **Регулировка потока** | Ограничено | ⭐⭐⭐⭐ | ⭐⭐⭐⭐ |\n| **Обслуживание** | 1 раз в 3–5 лет | 1 раз в год | 1 раз в 2–3 года |\n| **Закупка (DN 50–100)** | 4–10 тыс. | 2–6 тыс. | 3–8 тыс. |\n| **Монтаж (DN 50–100)** | 1,5–3 тыс. | 2–4 тыс. | 1–2,5 тыс. |\n| **Эксплуатация (20 лет, 1000-кв. дом)** | 3–6 млн | 5–10 млн | 2–4 млн |\n| **Общая стоимость (20 лет)** | **7–16 млн** | **7–16 млн** | **5–12 млн** |\n\n---\n\n### Общий анализ и рекомендации для многоэтажных домов с отоплением\n\n**Комбинированный подход — оптимальная стратегия**:\n- **Магистрали (подающая/обратная от котельной до дома)**: Дисковые краны с автоматизацией (приводы, датчики давления/температуры) для балансировки напора и температуры по высоте. Экономия энергии 15–25%, снижение потерь тепла на 5–8%.\n- **Стояки (вертикальные разводки)**: Шаровые краны на входах в стояки и на узлах между квартирами. Надежны при аварийных отключениях, не требуют обслуживания.\n- **Квартирные входы и радиаторы**: Шаровые краны для запора, плюс термостатические клапаны (ТРВ, как регулирующие элементы). ТРВ — специализированные устройства для автоматической регулировки, существенно улучшающие комфорт и экономию (на 10–15%).\n- **Вентильные краны**: Только в открытых сетях (редко в многоэтажках) или как балансировочные в нижних частях стояков, где напор высок.\n\n**Долговечность в контексте 50-этажных высоток**:\n- Общий срок отопительной арматуры — 25–35 лет при ежегодной инспекции (по нормам управляющих компаний).\n- Шаровые лидируют по надежности в квартирных узлах (минимальный износ, простота замены).\n- Дисковые превосходят по гидравлической эффективности и долговечности в магистралях (редкие отказы, низкие потери).\n- Вентильные устаревают в новых проектах, но все еще встречаются в бюджетных объектах (риск аварий в сезон).\n- Ключ к долгим срокам: качественная фильтрация теплоносителя (сетки 100–300 мкм на входе) и использование замкнутых систем с ингибиторами коррозии (добавки вроде nitrite-based).\n\n**Стоимость использования (полный жизненный цикл 20 лет)**:\n- **Шаровые**: 7–16 млн руб. на 1000-квартирный дом (оптимально для квартирных узлов).\n- **Вентильные**: 7–16 млн руб., но с риском доп. расходов на ремонты (до +30% в открытых сетях).\n- **Дисковые**: 5–12 млн руб., с экономией энергии 1–3 млн руб. за счет снижения сопротивления и циркуляционных потерь (лучший выбор для магистралей).\n\nИтоговая рекомендация для 50-этажного дома (10–20 тыс. м², ~2000 квартир):\n- **Бюджет на арматуру**: 30–60 млн руб.\n- **Оптимальный микс**: 50% дисковые (магистрали), 40% шаровые (стояки/квартиры), 10% вентильные (если требуют нормы, резерв).\n- **Результат**: снижение эксплуатационных расходов на 20–30%, снижение потерь тепла на 5–10% (экономия 2–5 млн руб. за 20 лет на теплотарифах), минимизация простоев в отопительный сезон.\n\n**Важно**: В многоэтажках отопительные системы проектируются с учетом гидравлического расчета и теплового баланса (разница давлений по высоте ~10 кПа на этаж). Устанавливать/выбирать должен проектный институт или подрядчик с допуском (СРО, по нормам Ростехнадзора). Обязательны краны с сертификатами (ГОСТ на давление, температуру и материалы — латунь CW617N для горячих сред, нержавейка 304 для коррозионных). Первичная очистка теплоносителя (фильтры 100 мкм) и использование замкнутых систем с добавками продлят срок любой арматуры на 20–30%. Если строите/ремонтируете — проконсультируйтесь с теплоснабжающей организацией и инженером; несоответствие может привести к авариям, разрегулировкам системы (неравномерное отопление по этажам) и отказу в вводе объекта.\n\n---\n\n### Рекомендуемые бренды и модели для отопления\n\n- **Шаровые**: VALTEC (Россия, серия VT.211/VT.212), Caleffi (Италия, серия 2-ходовые), Braukmann (Германия, CPC).\n- **Дисковые**: AVK (Дания, серия BF-33), AMTROL (США, с приводами), Belimo (Швейцария, для автоматизации).\n- **Вентильные**: HERZ (Австрия, классические модели), Danfoss (Дания, балансировочные серии).\n- **Термостатические клапаны (ТРВ)**: Danfoss (RTL, классика), HEIMEIER (K, V и другие серии), CALEFFI (серии для различных схем).\n\nЕсли нужны детали по конкретным схемам (двухтрубная, однотрубная, с гидравлической стрелкой, с ТРВ) или расчеты для вашего проекта, уточните!	anthropic-claude-haiku-4.5	\N	2025-10-31 12:59:42.898675+00
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
db615f99-fd74-48a9-92fd-a8fa3851fb5a	deepseek-chat	t	deepseek/deepseek-chat-v3.1	2025-10-28 08:42:30.821422+00	2025-10-31 09:13:34.621286+00
b8013833-1a66-4a4e-814b-22f1eaad7f5b	anthropic-claude-haiku-4.5	t	anthropic/claude-haiku-4.5	2025-10-31 10:40:59.479871+00	2025-10-31 10:40:59.479871+00
\.


--
-- Data for Name: models; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.models (id, model_id, display_name, provider, temperature, is_default_access, created_at, description, approximate_cost) FROM stdin;
e4460b2c-1a82-4ee9-9ea9-5be42dbbfcee	gpt-5-mini	GPT-5 Mini	openai	0.7	t	2025-10-27 06:56:40.569305+00	Быстрые ответы и общие консультации для всех пользователей	5р
c6d7edb7-9be9-4781-8aba-f438c80d2000	gpt-5	GPT-5	openai	0.7	f	2025-10-27 06:56:40.569305+00	Для решения сложных аналитических задач, разработки и автоматизации	25р
9a8995fc-5c17-4ef9-b716-dcc76869da75	gemini-2.5-pro	Google Gemini 2.5 Pro	gemini	0.7	f	2025-10-27 06:56:40.569305+00	Для финансового и управленческого анализа	25р
7adfa70e-0f5b-412f-99c3-2bc17db3b562	anthropic-claude-haiku-4.5	Claude Haiku 4.5	openrouter	0.7	f	2025-10-31 10:40:59.355052+00	Для умных, быстрых агентских задач и эффективного планирования\n	10р
2cb9ae31-6c99-4b5c-af42-efb210ecabce	grok-4-fast	Grok 4 Fast	grok	0.7	t	2025-10-27 06:56:40.569305+00	Для быстрого анализа технических задач и поиска в интернете\t	1,5р
0d845b93-4c24-4147-a285-4334c07e1a50	deepseek-chat	DeepSeek Chat	deepseek	0.7	f	2025-10-27 06:56:40.569305+00	Для анализа больших данных и прогнозирования ресурсов\n	2р
44db19dd-0380-4648-b7da-8befb6031073	gemini-2.5-flash	Google Gemini 2.5 Flash	gemini	0.7	f	2025-10-27 06:56:40.569305+00	Для мониторинга процессов и оперативной поддержки задач\n	4р
\.


--
-- Data for Name: prompts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.prompts (id, role_name, system_prompt, temperature, top_p, created_by, by_default, created_at, updated_at) FROM stdin;
09de6a83-1d0e-4f67-adf3-ca6ec21df36c	Инженер	Ты - опытный инженер-строитель с глубокими знаниями в области проектирования, технического надзора и управления строительными процессами. Твоя задача - предоставлять точные, технически обоснованные ответы, основанные на нормативных документах (СНиП, ГОСТ, СП), строительных стандартах и лучших практиках отрасли.\n\nОсновные области компетенции:\n- Анализ и интерпретация проектной и рабочей документации (чертежи, спецификации, технические решения)\n- Расчет конструкций, материалов и нагрузок\n- Контроль качества выполнения строительно-монтажных работ\n- Координация между проектировщиками, подрядчиками и субподрядчиками\n- Выявление технических проблем и предложение решений\n- Соблюдение требований безопасности и норм строительства\n\nСтиль ответа: Технический, структурированный, с конкретными ссылками на нормативы. Используй профессиональную терминологию. Предоставляй количественные данные и расчеты там, где это необходимо. Если вопрос требует детального анализа документации, уточни дополнительные детали перед ответом.	0.30	0.88	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	f	2025-10-31 14:20:29.715293	2025-10-31 14:20:29.715293
c7fb15f2-4fb4-4865-96cd-6f06fe45027a	Экономист	Ты - ведущий экономист строительной компании с экспертизой в области сметного дела, ценообразования и финансового планирования строительных проектов. Твоя задача - предоставлять точные расчеты и финансовый анализ.\n\nОсновные области компетенции:\n- Составление и проверка смет на строительные работы\n- Расчет стоимости материалов, работ и накладных расходов\n- Анализ отклонений фактических затрат от плановых\n- Оценка рентабельности проектов\n- Прогнозирование бюджета с учетом инфляции и изменения цен\n- Анализ предложений подрядчиков и поставщиков\n- Контроль за расходованием средств\n- Подготовка финансовых отчетов по проектам\n\nСтиль ответа: Точный, основанный на расчетах. Всегда указывай единицы измерения и валюту. Структурируй финансовую информацию в виде таблиц. При расчетах показывай методику и формулы. Учитывай актуальные рыночные цены и экономические условия.\n	0.30	0.86	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	f	2025-10-31 14:23:18.425074	2025-10-31 14:23:18.425074
1c16e4b2-bc6f-458b-ad9c-8256374a1a6d	Инженер по гарантии	Ты - ведущий инженер по гарантийному обслуживанию в строительной компании с опытом работы с дефектами, претензиями и гарантийными обязательствами. Твоя основная задача - анализировать гарантийные случаи, определять причины дефектов и координировать их устранение.\n\nОсновные области компетенции:\n- Прием и анализ гарантийных претензий от клиентов\n- Техническая экспертиза дефектов и определение причин их возникновения (брак материалов, нарушение технологии, неправильная эксплуатация)\n- Оценка соответствия претензий условиям гарантийных обязательств\n- Координация работ по устранению дефектов с подрядчиками и поставщиками\n- Ведение документации по гарантийным случаям\n- Взаимодействие с производителями материалов по вопросам рекламаций\n- Анализ статистики дефектов для выявления системных проблем\n\nСтиль ответа: Аналитический и объективный. Четко разграничивай гарантийные и негарантийные случаи. Предоставляй пошаговые инструкции по документированию и устранению дефектов. Указывай на необходимость фотофиксации и сбора доказательств.	0.40	0.88	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	f	2025-10-31 14:20:58.770253	2025-10-31 14:20:58.770253
22fda6db-ea87-4cbc-a9ac-fe576d05082e	Менеджер снабжения	Ты - ведущий менеджер по снабжению и закупкам в строительной компании с опытом управления поставками, взаимодействия с поставщиками и оптимизации логистики. Твоя задача - обеспечивать своевременную поставку качественных материалов по оптимальной цене.\n\nОсновные области компетенции:\n- Планирование потребностей в материалах и оборудовании для проектов\n- Поиск и оценка поставщиков (цена, качество, сроки, надежность)\n- Ведение переговоров о ценах и условиях поставки\n- Контроль сроков поставки и координация с графиком строительства\n- Управление запасами и предотвращение дефицита/переизбытка материалов\n- Обработка заявок от объектов и согласование спецификаций\n- Контроль качества поставляемых материалов\n- Работа с договорами поставки и рекламациями\n\nСтиль ответа: Практичный, ориентированный на результат. Предоставляй информацию о рыночных ценах, альтернативных поставщиках и сроках поставки. Учитывай логистические факторы. Предлагай варианты оптимизации закупок и снижения затрат.\n	0.50	0.90	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	f	2025-10-31 14:22:49.114972	2025-10-31 14:22:49.114972
2828c60a-701a-4f7c-ba31-4198d1406180	Юрист	Ты - юрист, специализирующийся на строительном праве, договорной работе и урегулировании споров в строительной сфере. Твоя задача - предоставлять юридически обоснованные рекомендации в соответствии с действующим законодательством.\n\nОсновные области компетенции:\n- Анализ и проверка строительных договоров (генподряд, субподряд, поставки)\n- Консультации по вопросам договорных обязательств и ответственности\n- Правовая оценка рисков в проектах\n- Подготовка претензий и ответов на претензии\n- Консультации по вопросам гарантийных обязательств\n- Разрешение споров и досудебное урегулирование конфликтов\n- Соблюдение требований градостроительного и земельного законодательства\n- Оформление разрешительной документации\n\nСтиль ответа: Формальный, юридически выверенный. Ссылайся на конкретные статьи законов и нормативные акты (ГК РФ, Градостроительный кодекс и т.д.). Четко разграничивай права и обязанности сторон. При необходимости предупреждай о юридических рисках. Избегай категоричных утверждений в спорных ситуациях.\n	0.30	0.88	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	f	2025-10-31 14:25:45.81475	2025-10-31 14:25:45.81475
f6690699-eaf5-4cc0-be19-6d9bf9bb78e3	Бизнес-аналитик	Ты - ведущий бизнес-аналитик в строительной компании, специализирующийся на анализе данных, оптимизации процессов и поддержке принятия управленческих решений. Твоя задача - превращать сложные данные в понятные инсайты и практические рекомендации.\n\nОсновные области компетенции:\n- Сбор и анализ бизнес-требований от различных отделов\n- Анализ эффективности строительных проектов (сроки, бюджет, ресурсы)\n- Выявление узких мест и возможностей для улучшения процессов\n- Подготовка аналитических отчетов и презентаций для руководства\n- Работа с KPI и метриками проектов\n- Прогнозирование затрат и рисков\n- Разработка рекомендаций по оптимизации операционной деятельности\n- Анализ рыночных трендов в строительной отрасли\n\nСтиль ответа: Структурированный, с акцентом на данные и метрики. Представляй информацию в виде четких выводов с количественными показателями. Используй визуализацию данных там, где это уместно (таблицы, списки). Предлагай практические рекомендации с обоснованием.\n	0.50	0.90	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	t	2025-10-31 14:24:33.766226	2025-10-31 14:24:33.766226
b404d035-a781-4a02-a788-a66a17ca3ddd	Без роли	Ты - универсальный AI-ассистент для сотрудников строительной компании. Твоя задача - предоставлять полезную информацию и помогать решать разнообразные задачи, связанные со строительной отраслью.\n\nОсновные области компетенции:\n- Общие вопросы по строительству и строительным технологиям\n- Базовая информация о материалах, процессах и стандартах\n- Помощь в поиске информации и составлении документов\n- Разъяснение терминологии и понятий\n- Общее консультирование по рабочим вопросам\n\nСтиль ответа: Дружелюбный и понятный. Адаптируй уровень детализации к запросу пользователя. Если вопрос требует экспертизы в конкретной области (юридической, технической, финансовой), рекомендуй обратиться к профильному специалисту или выбрать соответствующую роль. Предоставляй сбалансированные ответы с разумной степенью детализации.	0.70	0.93	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	f	2025-10-31 14:26:19.132985	2025-10-31 14:26:19.132985
\.


--
-- Data for Name: settings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.settings (id, key, value, created_at, updated_at, enable_prompt_preprocessing) FROM stdin;
e649d4e4-ccfd-4d80-ac5a-5db2a2ca6d69	show_cost_in_selector	t	2025-10-31 11:46:31.480565	2025-10-31 11:56:02.344	f
c8e311c6-972f-48f9-8b29-97f325c72b1b	enable_prompt_preprocessing	t	2025-10-31 14:31:19.41902	2025-10-31 14:32:44.625	f
\.


--
-- Data for Name: test_table; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.test_table (id, content) FROM stdin;
\.


--
-- Data for Name: usage_logs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usage_logs (id, user_id, model, prompt_tokens, completion_tokens, total_tokens, status, created_at, error_details, message_id, cost) FROM stdin;
f61ac557-b730-478a-b8e6-9a2f9fc7b787	990cf9a6-88ab-465c-a280-b51c0467aeb9	grok-4-fast	175	1720	1895	success	2025-10-29 13:05:33.397833+00	\N	5a88d7ef-97e0-43ba-bd54-49ed9acf74b0	\N
2e387145-0c43-4ffe-81e6-7dfb5d1a4370	f8d1b0bb-75b7-4c50-b431-a6c8ae17fe19	grok-4-fast	226	1824	2050	success	2025-10-29 13:21:38.612316+00	\N	f53737b7-3bc2-4141-aef6-07a6dd90586f	\N
a00c60df-0354-4f9c-92a7-3a4500a36ed0	f8d1b0bb-75b7-4c50-b431-a6c8ae17fe19	gpt-5-mini	1365	538	1903	success	2025-10-29 13:23:03.211262+00	\N	cb62403c-5566-4230-ba90-49e2f1814bc7	\N
e3efae34-8176-4d93-80a6-59727b4d7bd9	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	grok-4-fast	193	1890	2083	success	2025-10-29 14:25:22.383297+00	\N	978adf0d-c796-4b3b-8395-975a8d0777e3	\N
09fb8ecb-8300-43b8-b8ab-7b042e61c5e2	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	gpt-5-mini	44	2342	2386	success	2025-10-29 14:26:20.83935+00	\N	7f604069-ba2b-4bcb-91d7-e6c625ff9049	\N
00bbf6a9-0907-418a-ba37-5e4963eabe0e	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	gpt-5	44	2506	2550	success	2025-10-29 14:27:47.735446+00	\N	867dd54b-8680-4c8a-a204-38828faef3f4	\N
7ca13c2f-779e-4bba-b3af-558340c660b3	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	gemini-2.5-pro	36	3536	3572	success	2025-10-30 06:26:19.666114+00	\N	7d882d8a-3f95-4a0c-b864-86352d8bf1d1	\N
e0cba05f-8a0e-4adb-8624-2cf560b8cb76	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	gemini-2.5-pro	1231	3494	4725	success	2025-10-30 07:13:00.239185+00	\N	14dfde33-402a-4328-a5a9-fee4e8826054	\N
f69d31a0-5346-4fe6-991e-e2e3304adf43	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	gpt-5	2101	3238	5339	success	2025-10-30 07:14:54.757388+00	\N	f0463ed0-a61d-448b-8b3e-40c37176593e	\N
b03a8593-640a-4c94-b443-689733967e73	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	gpt-5-mini	1653	2975	4628	success	2025-10-30 07:15:25.375483+00	\N	d450e49a-2123-475c-af9e-ace9c75fdd6f	\N
5e144f6b-635e-4b28-8874-c64a65c53673	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	grok-4-fast	1729	2952	4681	success	2025-10-30 07:15:53.41633+00	\N	d1b5ef5e-1bca-49d2-84ff-34c3c785003d	\N
a2347900-7cc5-4774-805f-a242d5e5cb5d	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	grok-4-fast	163	429	592	success	2025-10-30 08:58:39.49687+00	\N	fc499454-8746-4aff-8a98-66b67574261a	\N
efccf2cf-c89e-42da-8324-0a15e8502726	dde5c3c7-8368-4df9-b12b-160ff2cc02ab	grok-4-fast	166	1110	1276	success	2025-10-30 10:33:35.161572+00	\N	e6a9b1b9-8e24-4649-9985-a649f5e0582c	\N
8d79dbab-9c5c-431d-a8ea-197b0231906a	f8e5ca55-75fd-419d-a30c-42ffa125d9d9	grok-4-fast	157	229	386	success	2025-10-30 10:45:09.590883+00	\N	ee112f04-8119-4161-b940-dfed5bb00d86	\N
7f1bc96d-cc38-418a-ad35-ad0c8583cc55	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	grok-4-fast	46606	2625	49231	success	2025-10-30 12:06:15.098654+00	\N	e53b7bce-99cc-4653-bf18-b4d1cedbd88a	\N
757312bc-ac7e-440e-9376-320b8d314d8b	d8c1330a-ae1a-407a-ad2c-897ab85102dd	gemini-2.5-pro	27	5808	5835	success	2025-10-30 12:42:07.637706+00	\N	22632c3d-f647-4112-82e1-942247d33ece	\N
e8404bb2-ec28-4086-a7a9-6e7e69535e3e	adea9c9c-2d73-45b4-a801-e576e0b57f74	grok-4-fast	175	1501	1676	success	2025-10-30 12:48:42.13571+00	\N	69c27bc9-82ab-4c30-96d3-6d1ce1e0fd53	\N
30562a85-2072-4f95-855a-dd09a31abb1d	adea9c9c-2d73-45b4-a801-e576e0b57f74	gpt-5-mini	27	1354	1381	success	2025-10-30 12:51:22.680396+00	\N	f75e0f9d-44fd-470b-8bee-17aa66ed39be	\N
928b1c24-8910-41d9-9450-565baa9dc9bd	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	gemini-2.5-pro	47603	3650	51253	success	2025-10-30 18:05:37.870226+00	\N	facb73f3-49f2-4795-82d4-749bd8e05896	\N
e00f6723-7171-4f33-8784-b8495557dced	310087c1-ef51-4c13-9f65-e581845313fe	grok-4-fast	176	1015	1191	success	2025-10-31 04:46:26.174321+00	\N	3f064b99-f728-483d-a303-d5957bf30f99	\N
7abc4d97-bb38-4a37-aa62-2d70a339c8bb	310087c1-ef51-4c13-9f65-e581845313fe	grok-4-fast	617	1138	1755	success	2025-10-31 04:47:16.954251+00	\N	670e747a-eac0-4860-bf69-6a6242065246	\N
2fc758dc-7f89-41db-a88c-c8b09fd97a1b	310087c1-ef51-4c13-9f65-e581845313fe	grok-4-fast	1464	2927	4391	success	2025-10-31 05:43:29.817622+00	\N	345c59ca-86fb-4d18-b2db-d8b0f6d08af4	\N
77da1194-b000-4e05-9f29-8f71910844c3	310087c1-ef51-4c13-9f65-e581845313fe	grok-4-fast	2836	1924	4760	success	2025-10-31 05:48:01.845113+00	\N	3e5a7103-8627-42c5-bcb6-4aa51fb703f9	\N
a08ab839-8a1d-49b6-8bf1-73e3c3546c91	310087c1-ef51-4c13-9f65-e581845313fe	grok-4-fast	4482	1388	5870	success	2025-10-31 05:48:37.141659+00	\N	d8322093-1462-4fbd-833f-4e8e4837e2ed	\N
00705e95-0ab7-4544-873b-9e5f7fe8d254	310087c1-ef51-4c13-9f65-e581845313fe	grok-4-fast	5624	2049	7673	success	2025-10-31 05:49:14.016893+00	\N	520a1ef7-a932-46b0-9d6f-36aaffbbc5c8	\N
f1445ea1-810d-4d24-9e3e-b80679365be0	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	grok-4-fast	47695	2390	50085	success	2025-10-31 07:52:42.996085+00	\N	a70f4ce0-e350-4533-ae43-3c1871a18a35	\N
f4362579-0b5f-4cfe-afeb-54d435c386ae	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	grok-4-fast	162	1418	1580	success	2025-10-31 07:57:54.832766+00	\N	3c918514-f8cc-4f42-8ed1-18a4b09f3c07	\N
2f197700-6806-473d-8efc-8f17de2dd652	990cf9a6-88ab-465c-a280-b51c0467aeb9	grok-4-fast	164	1356	1520	success	2025-10-31 07:59:52.626136+00	\N	235682e7-9474-41ce-813b-edf20839ce9c	\N
3e576bd1-279f-4e7e-b991-3d05e7701c62	990cf9a6-88ab-465c-a280-b51c0467aeb9	grok-4-fast	1233	1627	2860	success	2025-10-31 08:00:21.948841+00	\N	c952a918-a2a2-4154-a311-01cb3b893da3	\N
ff940f61-bab8-4b70-8c07-7c83871bc180	990cf9a6-88ab-465c-a280-b51c0467aeb9	grok-4-fast	2552	1436	3988	success	2025-10-31 09:15:38.784086+00	\N	ab0293a1-f915-40d4-a5b2-87dfe515644a	\N
b5f87da3-004f-4afe-a546-2f9f597fd85a	990cf9a6-88ab-465c-a280-b51c0467aeb9	gpt-5-mini	9904	1982	11886	success	2025-10-31 10:18:56.261785+00	\N	23baf020-edef-46cd-aab9-af3455a7f82f	\N
55411ad6-e9c7-431f-91ae-089c6358b122	990cf9a6-88ab-465c-a280-b51c0467aeb9	anthropic-claude-haiku-4.5	30	411	441	success	2025-10-31 10:43:10.319097+00	\N	ffafc397-5f21-4f94-a8b4-50bbb7826d67	\N
8752db04-75c6-4af5-83d4-3110d2bdac94	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	grok-4-fast	174	1501	1675	success	2025-10-31 10:43:30.096558+00	\N	c9e73cd4-1922-480a-890e-28972829108e	\N
3d95126f-2d49-4bb5-a3e3-1e544c3cefda	990cf9a6-88ab-465c-a280-b51c0467aeb9	anthropic-claude-haiku-4.5	503	1728	2231	success	2025-10-31 11:12:54.122772+00	\N	b019d0c1-1d30-45ca-8e39-ae710034d2bb	\N
aff66ac0-4d7b-4a98-baa7-a9c0bb643d2e	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	gpt-5-mini	1152	2639	3791	success	2025-10-31 11:13:23.746432+00	\N	1d0cb258-6442-4ac0-a0b0-5696742e8a69	\N
0c9b3c34-21a4-4f0a-a2e5-55808adcd29b	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	gemini-2.5-flash	3013	2165	5178	success	2025-10-31 11:45:01.268495+00	\N	24bd7f6f-f4d3-4d9c-87fd-6ee358acde40	\N
fb65f1af-0144-4be0-af0d-994699bbada3	990cf9a6-88ab-465c-a280-b51c0467aeb9	anthropic-claude-haiku-4.5	2278	5598	7876	success	2025-10-31 11:46:40.647829+00	\N	a336f856-86f5-4060-a613-d7d502f57058	\N
9c2c8e87-3e53-44f3-a8a6-359c7e1f3704	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	gemini-2.5-flash	15	510	525	success	2025-10-31 11:58:19.386032+00	\N	4830276c-918f-4ac4-af8e-9dc6237ee0ba	\N
d1df9309-b87d-4b0a-9aa5-17b9dd8d5ba4	990cf9a6-88ab-465c-a280-b51c0467aeb9	gpt-5-mini	21	1375	1396	success	2025-10-31 11:58:24.095329+00	\N	0eeff8a2-a68d-4c14-811c-5723f8413da4	\N
c601d2a6-3416-4a4f-925e-67ea84d6dee2	8537c87c-44d7-450e-b1b0-498ae7ddd3f6	gemini-2.5-flash	561	2177	2738	success	2025-10-31 12:11:01.271356+00	\N	d89b7fa8-96c3-4935-93f7-f82128252e80	\N
d224b1a2-baf8-455d-b2d9-79e0fabf4073	990cf9a6-88ab-465c-a280-b51c0467aeb9	gpt-5-mini	671	3162	3833	success	2025-10-31 12:11:59.843059+00	\N	dd36d475-c303-4fd6-8906-c067c2aae875	\N
ef44176e-7d93-438d-9559-9c6ef5dc27b2	98b67609-9822-4cb9-b2ed-14e3034c8559	grok-4-fast	170	916	1086	success	2025-10-31 12:25:06.571639+00	\N	6a0aa565-683f-4d1c-94ce-365a76dc3eba	\N
10d4a554-0ddf-4264-9ec1-a19ed417cfa7	98b67609-9822-4cb9-b2ed-14e3034c8559	grok-4-fast	790	3086	3876	success	2025-10-31 12:25:40.756157+00	\N	efe2d014-17a3-4b97-8037-a0a4e19b744b	\N
365d57da-88cc-4dc5-b997-d378bd598dbf	98b67609-9822-4cb9-b2ed-14e3034c8559	grok-4-fast	3272	3312	6584	success	2025-10-31 12:57:48.680654+00	\N	923bea93-1c55-4c6c-bcf7-5e5a5e592633	0.002310
27333cc8-deed-4eb1-9350-d932ac47a347	98b67609-9822-4cb9-b2ed-14e3034c8559	anthropic-claude-haiku-4.5	8102	5760	13862	success	2025-10-31 12:59:43.002563+00	\N	d8620d2f-5ed2-4aa8-aa6e-fdb7df5811c1	0.036902
\.


--
-- Data for Name: user_model_access; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_model_access (user_id, model_id, created_at) FROM stdin;
8537c87c-44d7-450e-b1b0-498ae7ddd3f6	e4460b2c-1a82-4ee9-9ea9-5be42dbbfcee	2025-10-27 08:39:34.094917+00
8537c87c-44d7-450e-b1b0-498ae7ddd3f6	2cb9ae31-6c99-4b5c-af42-efb210ecabce	2025-10-27 08:39:34.094917+00
8537c87c-44d7-450e-b1b0-498ae7ddd3f6	44db19dd-0380-4648-b7da-8befb6031073	2025-10-27 08:59:13.499777+00
8537c87c-44d7-450e-b1b0-498ae7ddd3f6	9a8995fc-5c17-4ef9-b716-dcc76869da75	2025-10-27 08:59:14.195336+00
8537c87c-44d7-450e-b1b0-498ae7ddd3f6	c6d7edb7-9be9-4781-8aba-f438c80d2000	2025-10-27 08:59:15.083302+00
f8e5ca55-75fd-419d-a30c-42ffa125d9d9	e4460b2c-1a82-4ee9-9ea9-5be42dbbfcee	2025-10-29 07:23:48.914599+00
f8e5ca55-75fd-419d-a30c-42ffa125d9d9	2cb9ae31-6c99-4b5c-af42-efb210ecabce	2025-10-29 07:23:48.914599+00
f8e5ca55-75fd-419d-a30c-42ffa125d9d9	c6d7edb7-9be9-4781-8aba-f438c80d2000	2025-10-29 07:24:24.619963+00
f8e5ca55-75fd-419d-a30c-42ffa125d9d9	9a8995fc-5c17-4ef9-b716-dcc76869da75	2025-10-29 07:24:25.264563+00
f8e5ca55-75fd-419d-a30c-42ffa125d9d9	44db19dd-0380-4648-b7da-8befb6031073	2025-10-29 07:24:25.774335+00
990cf9a6-88ab-465c-a280-b51c0467aeb9	e4460b2c-1a82-4ee9-9ea9-5be42dbbfcee	2025-10-29 12:23:00.188155+00
990cf9a6-88ab-465c-a280-b51c0467aeb9	2cb9ae31-6c99-4b5c-af42-efb210ecabce	2025-10-29 12:23:00.188155+00
310087c1-ef51-4c13-9f65-e581845313fe	e4460b2c-1a82-4ee9-9ea9-5be42dbbfcee	2025-10-29 13:13:36.973443+00
310087c1-ef51-4c13-9f65-e581845313fe	2cb9ae31-6c99-4b5c-af42-efb210ecabce	2025-10-29 13:13:36.973443+00
7d3d3502-7204-4aee-87da-1fdcbdbba8ad	e4460b2c-1a82-4ee9-9ea9-5be42dbbfcee	2025-10-29 13:13:51.048592+00
7d3d3502-7204-4aee-87da-1fdcbdbba8ad	2cb9ae31-6c99-4b5c-af42-efb210ecabce	2025-10-29 13:13:51.048592+00
f8d1b0bb-75b7-4c50-b431-a6c8ae17fe19	e4460b2c-1a82-4ee9-9ea9-5be42dbbfcee	2025-10-29 13:16:04.388218+00
f8d1b0bb-75b7-4c50-b431-a6c8ae17fe19	2cb9ae31-6c99-4b5c-af42-efb210ecabce	2025-10-29 13:16:04.388218+00
112fd71d-fef9-4b4b-ad91-74f2fe211947	e4460b2c-1a82-4ee9-9ea9-5be42dbbfcee	2025-10-29 13:16:22.332272+00
112fd71d-fef9-4b4b-ad91-74f2fe211947	2cb9ae31-6c99-4b5c-af42-efb210ecabce	2025-10-29 13:16:22.332272+00
e4da2eb1-4729-41ec-978a-07a5d01a9fff	e4460b2c-1a82-4ee9-9ea9-5be42dbbfcee	2025-10-29 13:49:47.051054+00
e4da2eb1-4729-41ec-978a-07a5d01a9fff	2cb9ae31-6c99-4b5c-af42-efb210ecabce	2025-10-29 13:49:47.051054+00
f051acbc-190a-4ea5-bf1c-90bb1cd7a58c	e4460b2c-1a82-4ee9-9ea9-5be42dbbfcee	2025-10-29 13:50:13.253384+00
f051acbc-190a-4ea5-bf1c-90bb1cd7a58c	2cb9ae31-6c99-4b5c-af42-efb210ecabce	2025-10-29 13:50:13.253384+00
3c0bc697-412f-42ef-8a9e-3c2a96286072	e4460b2c-1a82-4ee9-9ea9-5be42dbbfcee	2025-10-29 13:52:27.305543+00
3c0bc697-412f-42ef-8a9e-3c2a96286072	2cb9ae31-6c99-4b5c-af42-efb210ecabce	2025-10-29 13:52:27.305543+00
c3065a1d-0422-4c95-af57-580eab0c970f	e4460b2c-1a82-4ee9-9ea9-5be42dbbfcee	2025-10-29 13:54:54.190881+00
c3065a1d-0422-4c95-af57-580eab0c970f	2cb9ae31-6c99-4b5c-af42-efb210ecabce	2025-10-29 13:54:54.190881+00
9a28b6d7-e5e3-4141-92c8-ec9da0dd7b3d	e4460b2c-1a82-4ee9-9ea9-5be42dbbfcee	2025-10-29 14:00:52.091802+00
9a28b6d7-e5e3-4141-92c8-ec9da0dd7b3d	2cb9ae31-6c99-4b5c-af42-efb210ecabce	2025-10-29 14:00:52.091802+00
32265ce5-8681-4ae5-99b1-2b81210e9522	e4460b2c-1a82-4ee9-9ea9-5be42dbbfcee	2025-10-30 06:09:46.095187+00
32265ce5-8681-4ae5-99b1-2b81210e9522	2cb9ae31-6c99-4b5c-af42-efb210ecabce	2025-10-30 06:09:46.095187+00
dde5c3c7-8368-4df9-b12b-160ff2cc02ab	e4460b2c-1a82-4ee9-9ea9-5be42dbbfcee	2025-10-30 09:12:43.681059+00
dde5c3c7-8368-4df9-b12b-160ff2cc02ab	2cb9ae31-6c99-4b5c-af42-efb210ecabce	2025-10-30 09:12:43.681059+00
dde5c3c7-8368-4df9-b12b-160ff2cc02ab	44db19dd-0380-4648-b7da-8befb6031073	2025-10-30 09:25:53.094448+00
dde5c3c7-8368-4df9-b12b-160ff2cc02ab	9a8995fc-5c17-4ef9-b716-dcc76869da75	2025-10-30 09:25:53.528926+00
dde5c3c7-8368-4df9-b12b-160ff2cc02ab	c6d7edb7-9be9-4781-8aba-f438c80d2000	2025-10-30 09:25:54.516646+00
756adb06-f2d7-4113-9739-779afbd69643	e4460b2c-1a82-4ee9-9ea9-5be42dbbfcee	2025-10-30 11:27:43.506406+00
756adb06-f2d7-4113-9739-779afbd69643	2cb9ae31-6c99-4b5c-af42-efb210ecabce	2025-10-30 11:27:43.506406+00
adea9c9c-2d73-45b4-a801-e576e0b57f74	e4460b2c-1a82-4ee9-9ea9-5be42dbbfcee	2025-10-30 12:27:37.829372+00
adea9c9c-2d73-45b4-a801-e576e0b57f74	2cb9ae31-6c99-4b5c-af42-efb210ecabce	2025-10-30 12:27:37.829372+00
d8c1330a-ae1a-407a-ad2c-897ab85102dd	e4460b2c-1a82-4ee9-9ea9-5be42dbbfcee	2025-10-30 12:36:05.099781+00
d8c1330a-ae1a-407a-ad2c-897ab85102dd	2cb9ae31-6c99-4b5c-af42-efb210ecabce	2025-10-30 12:36:05.099781+00
d8c1330a-ae1a-407a-ad2c-897ab85102dd	44db19dd-0380-4648-b7da-8befb6031073	2025-10-30 12:37:02.345389+00
d8c1330a-ae1a-407a-ad2c-897ab85102dd	9a8995fc-5c17-4ef9-b716-dcc76869da75	2025-10-30 12:37:02.719559+00
d8c1330a-ae1a-407a-ad2c-897ab85102dd	c6d7edb7-9be9-4781-8aba-f438c80d2000	2025-10-30 12:37:03.31447+00
98b67609-9822-4cb9-b2ed-14e3034c8559	e4460b2c-1a82-4ee9-9ea9-5be42dbbfcee	2025-10-30 15:28:32.601069+00
98b67609-9822-4cb9-b2ed-14e3034c8559	2cb9ae31-6c99-4b5c-af42-efb210ecabce	2025-10-30 15:28:32.601069+00
e96e699e-647d-4132-b8b5-e10db8e01021	e4460b2c-1a82-4ee9-9ea9-5be42dbbfcee	2025-10-31 06:26:19.38554+00
e96e699e-647d-4132-b8b5-e10db8e01021	2cb9ae31-6c99-4b5c-af42-efb210ecabce	2025-10-31 06:26:19.38554+00
f31006f1-ab3e-44e9-a0ae-27d0bfa53ac4	e4460b2c-1a82-4ee9-9ea9-5be42dbbfcee	2025-10-31 06:42:32.054389+00
f31006f1-ab3e-44e9-a0ae-27d0bfa53ac4	2cb9ae31-6c99-4b5c-af42-efb210ecabce	2025-10-31 06:42:32.054389+00
990cf9a6-88ab-465c-a280-b51c0467aeb9	7adfa70e-0f5b-412f-99c3-2bc17db3b562	2025-10-31 10:42:01.839438+00
adea9c9c-2d73-45b4-a801-e576e0b57f74	7adfa70e-0f5b-412f-99c3-2bc17db3b562	2025-10-31 11:10:26.474551+00
c3065a1d-0422-4c95-af57-580eab0c970f	7adfa70e-0f5b-412f-99c3-2bc17db3b562	2025-10-31 11:10:27.491293+00
d8c1330a-ae1a-407a-ad2c-897ab85102dd	7adfa70e-0f5b-412f-99c3-2bc17db3b562	2025-10-31 11:10:27.999573+00
3c0bc697-412f-42ef-8a9e-3c2a96286072	7adfa70e-0f5b-412f-99c3-2bc17db3b562	2025-10-31 11:10:28.422657+00
310087c1-ef51-4c13-9f65-e581845313fe	7adfa70e-0f5b-412f-99c3-2bc17db3b562	2025-10-31 11:59:21.49862+00
756adb06-f2d7-4113-9739-779afbd69643	7adfa70e-0f5b-412f-99c3-2bc17db3b562	2025-10-31 11:59:21.848487+00
7d3d3502-7204-4aee-87da-1fdcbdbba8ad	7adfa70e-0f5b-412f-99c3-2bc17db3b562	2025-10-31 11:59:22.393339+00
f8d1b0bb-75b7-4c50-b431-a6c8ae17fe19	7adfa70e-0f5b-412f-99c3-2bc17db3b562	2025-10-31 11:59:22.923219+00
e96e699e-647d-4132-b8b5-e10db8e01021	7adfa70e-0f5b-412f-99c3-2bc17db3b562	2025-10-31 11:59:23.508431+00
f8e5ca55-75fd-419d-a30c-42ffa125d9d9	7adfa70e-0f5b-412f-99c3-2bc17db3b562	2025-10-31 11:59:24.046292+00
32265ce5-8681-4ae5-99b1-2b81210e9522	7adfa70e-0f5b-412f-99c3-2bc17db3b562	2025-10-31 11:59:24.520044+00
dde5c3c7-8368-4df9-b12b-160ff2cc02ab	7adfa70e-0f5b-412f-99c3-2bc17db3b562	2025-10-31 11:59:25.00829+00
9a28b6d7-e5e3-4141-92c8-ec9da0dd7b3d	7adfa70e-0f5b-412f-99c3-2bc17db3b562	2025-10-31 11:59:26.490197+00
f31006f1-ab3e-44e9-a0ae-27d0bfa53ac4	7adfa70e-0f5b-412f-99c3-2bc17db3b562	2025-10-31 11:59:27.070429+00
8537c87c-44d7-450e-b1b0-498ae7ddd3f6	7adfa70e-0f5b-412f-99c3-2bc17db3b562	2025-10-31 11:59:27.679801+00
112fd71d-fef9-4b4b-ad91-74f2fe211947	7adfa70e-0f5b-412f-99c3-2bc17db3b562	2025-10-31 11:59:28.171534+00
f051acbc-190a-4ea5-bf1c-90bb1cd7a58c	7adfa70e-0f5b-412f-99c3-2bc17db3b562	2025-10-31 11:59:28.63632+00
98b67609-9822-4cb9-b2ed-14e3034c8559	7adfa70e-0f5b-412f-99c3-2bc17db3b562	2025-10-31 11:59:29.106489+00
e4da2eb1-4729-41ec-978a-07a5d01a9fff	7adfa70e-0f5b-412f-99c3-2bc17db3b562	2025-10-31 11:59:30.598725+00
cde324d4-4ab5-448f-9544-45dbf515d12d	e4460b2c-1a82-4ee9-9ea9-5be42dbbfcee	2025-10-31 12:25:53.260936+00
cde324d4-4ab5-448f-9544-45dbf515d12d	2cb9ae31-6c99-4b5c-af42-efb210ecabce	2025-10-31 12:25:53.260936+00
cde324d4-4ab5-448f-9544-45dbf515d12d	44db19dd-0380-4648-b7da-8befb6031073	2025-10-31 12:52:36.450543+00
cde324d4-4ab5-448f-9544-45dbf515d12d	9a8995fc-5c17-4ef9-b716-dcc76869da75	2025-10-31 12:52:37.086732+00
cde324d4-4ab5-448f-9544-45dbf515d12d	c6d7edb7-9be9-4781-8aba-f438c80d2000	2025-10-31 12:52:41.328503+00
cde324d4-4ab5-448f-9544-45dbf515d12d	7adfa70e-0f5b-412f-99c3-2bc17db3b562	2025-10-31 12:52:42.546624+00
0236a1d5-3f29-449e-9e60-bf908e5e7cf6	e4460b2c-1a82-4ee9-9ea9-5be42dbbfcee	2025-10-31 14:05:00.34403+00
0236a1d5-3f29-449e-9e60-bf908e5e7cf6	2cb9ae31-6c99-4b5c-af42-efb210ecabce	2025-10-31 14:05:00.34403+00
\.


--
-- Data for Name: user_profiles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_profiles (id, email, daily_request_limit, created_at, updated_at, role, display_name) FROM stdin;
e96e699e-647d-4132-b8b5-e10db8e01021	kuzmin.a.a@su10.ru	50	2025-10-31 06:26:19.38554+00	2025-10-31 07:44:30.164552+00	user	Кузьмин 
f31006f1-ab3e-44e9-a0ae-27d0bfa53ac4	popov.a.n@su10.ru	50	2025-10-31 06:42:32.054389+00	2025-10-31 07:44:34.526874+00	user	Попов
98b67609-9822-4cb9-b2ed-14e3034c8559	admin@test.com	50	2025-10-30 15:28:32.601069+00	2025-10-31 09:13:18.747595+00	user	admin@test.com
990cf9a6-88ab-465c-a280-b51c0467aeb9	postoev.e.v@su10.ru	50	2025-10-29 12:23:00.188155+00	2025-10-31 11:45:34.759731+00	user	Постоев
cde324d4-4ab5-448f-9544-45dbf515d12d	levimper@gmail.com	100	2025-10-31 12:25:53.260936+00	2025-10-31 12:52:39.787672+00	user	Некрасов
0236a1d5-3f29-449e-9e60-bf908e5e7cf6	sadovnikov.d.y@su10.ru	0	2025-10-31 14:05:00.34403+00	2025-10-31 14:05:00.34403+00	user	Садовников
8537c87c-44d7-450e-b1b0-498ae7ddd3f6	eugsu10@gmail.com	100	2025-10-24 13:09:54.861618+00	2025-10-29 12:22:24.627051+00	admin	Постоев
310087c1-ef51-4c13-9f65-e581845313fe	kazubov.a.a@su10.ru	50	2025-10-29 13:13:36.973443+00	2025-10-29 13:15:29.554404+00	user	Казубов
7d3d3502-7204-4aee-87da-1fdcbdbba8ad	korneichik.k.a@su10.ru	50	2025-10-29 13:13:51.048592+00	2025-10-29 13:15:35.190525+00	user	Корнейчик
f8e5ca55-75fd-419d-a30c-42ffa125d9d9	alexeymoguev@gmail.com	100	2025-10-29 07:23:48.914599+00	2025-10-29 13:15:42.805988+00	user	Могуев
f8d1b0bb-75b7-4c50-b431-a6c8ae17fe19	korotkov.a.d@mstroy.pro	50	2025-10-29 13:16:04.388218+00	2025-10-29 13:16:30.027561+00	user	Коротков
112fd71d-fef9-4b4b-ad91-74f2fe211947	semina.a.v@su10.ru	50	2025-10-29 13:16:22.332272+00	2025-10-29 13:16:35.312803+00	user	Сёмина
e4da2eb1-4729-41ec-978a-07a5d01a9fff	andrew_uzun3@mail.ru	50	2025-10-29 13:49:47.051054+00	2025-10-29 13:55:00.09372+00	user	Uzun
f051acbc-190a-4ea5-bf1c-90bb1cd7a58c	shanin.r.a@su10.ru	50	2025-10-29 13:50:13.253384+00	2025-10-29 13:55:06.259227+00	user	Шанин
3c0bc697-412f-42ef-8a9e-3c2a96286072	repnikov.i.a@su10.ru	50	2025-10-29 13:52:27.305543+00	2025-10-29 13:55:20.082732+00	user	Игорь Репников 
c3065a1d-0422-4c95-af57-580eab0c970f	olenina.e.y@su10.ru	50	2025-10-29 13:54:54.190881+00	2025-10-29 13:55:25.410602+00	user	Гаева
9a28b6d7-e5e3-4141-92c8-ec9da0dd7b3d	pivovarova.a.v@zakupka.pro	50	2025-10-29 14:00:52.091802+00	2025-10-29 14:05:48.205595+00	user	Пивоварова
32265ce5-8681-4ae5-99b1-2b81210e9522	muha.m.u@su10.ru	50	2025-10-30 06:09:46.095187+00	2025-10-30 06:21:29.99748+00	user	Муха Мария
dde5c3c7-8368-4df9-b12b-160ff2cc02ab	odintsov.su10@gmail.com	100	2025-10-30 09:12:43.681059+00	2025-10-30 09:25:58.827946+00	user	Одинцов Артем
756adb06-f2d7-4113-9739-779afbd69643	karaseni.n.d@zakupka.pro	50	2025-10-30 11:27:43.506406+00	2025-10-30 12:06:46.148962+00	user	Карасени Николай Демьянович
adea9c9c-2d73-45b4-a801-e576e0b57f74	bondaruk.g.a@mstroy.pro	50	2025-10-30 12:27:37.829372+00	2025-10-30 12:28:15.633248+00	user	Бондарук Геннадий
d8c1330a-ae1a-407a-ad2c-897ab85102dd	999@mail.ru	100	2025-10-30 12:36:05.099781+00	2025-10-30 12:37:04.87995+00	admin	Иванов
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

SELECT pg_catalog.setval('auth.refresh_tokens_id_seq', 214, true);


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
-- Name: prompts prompts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prompts
    ADD CONSTRAINT prompts_pkey PRIMARY KEY (id);


--
-- Name: prompts prompts_role_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prompts
    ADD CONSTRAINT prompts_role_name_key UNIQUE (role_name);


--
-- Name: settings settings_key_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.settings
    ADD CONSTRAINT settings_key_key UNIQUE (key);


--
-- Name: settings settings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.settings
    ADD CONSTRAINT settings_pkey PRIMARY KEY (id);


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
-- Name: idx_prompts_by_default; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_prompts_by_default ON public.prompts USING btree (by_default) WHERE (by_default = true);


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
-- Name: prompts prompts_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prompts
    ADD CONSTRAINT prompts_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.user_profiles(id) ON DELETE SET NULL;


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
-- Name: TABLE prompts; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.prompts TO service_role;
GRANT SELECT ON TABLE public.prompts TO anon;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.prompts TO authenticated;


--
-- Name: TABLE settings; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.settings TO service_role;


--
-- Name: TABLE usage_logs; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT ON TABLE public.usage_logs TO authenticated;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.usage_logs TO service_role;


--
-- Name: TABLE user_model_access; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,DELETE ON TABLE public.user_model_access TO service_role;
GRANT SELECT ON TABLE public.user_model_access TO authenticated;


--
-- Name: TABLE user_profiles; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.user_profiles TO authenticated;
GRANT SELECT,UPDATE ON TABLE public.user_profiles TO service_role;


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

\unrestrict JkobQEfw9aa35avXqHg9vwHDKzHU8SBju8AcdzXl22u5eXx12hLnMjWCECDyeiM

