<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** MySQL database username */
define( 'DB_USER', 'wordpress' );

/** MySQL database password */
define( 'DB_PASSWORD', 'moonwalk' );

/** MySQL hostname */
define( 'DB_HOST', 'localhost' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8mb4' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         'O#PxXrzq(:34jc/lFf$8hKS1s]NO/g*R@A+snk*S2n6[yEJKNGNL-ss4h)fwJ=SN' );
define( 'SECURE_AUTH_KEY',  'QCs}zgg^>GDiq~BQ)%Ef3(}s[|ld?o,->DUkHB6#D$B0ZEX5yutbv6N48*J|acWg' );
define( 'LOGGED_IN_KEY',    'bR8RPK(1]4&@U@E7:fkqH,82{[]~|oZUao|!!ty2G#;X@^qu$8K%)9);4Bn@}Q3P' );
define( 'NONCE_KEY',        '33) /T2>zZ}6_G%j|b&k7UA/G@CDt^T<Ai.b,IYEgc,RbXK&w.0A)Cmu_D{h$|e:' );
define( 'AUTH_SALT',        'fEw&aCptJt1;G=s9tFy%Yyrs{?PDzOD `lmv1!c+fgB(WXTu+@S@8f+vE%kv&i=E' );
define( 'SECURE_AUTH_SALT', '8at>xw~G9YPX=|tFOGqzEcMGg{4tlSGdVj? jnV?;^|x[%fXjn+zn5I4Ks}On{Jz' );
define( 'LOGGED_IN_SALT',   'PskFML$yU!!U_A}bH,nZFI}F,I)VJ?p,A#:u:Tbo-#W@S]0Gt =[mC?3x0&VO{gE' );
define( 'NONCE_SALT',       '|u*>g?86mrB1&)t7KK^Aub3k-CNGO~&1D.>b{Tv?Rt9[v,~nYe[!c3UXbt&+RiDF' );

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';