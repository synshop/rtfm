# This file is directly sourced by all the build scripts.  Syntax is bash.
# It is sourced to load the PRE scripts, and then sourced again before the CMD
#
# Default available variables are (you can override with environment or here):
# $CRAYON_ARCHITECT_DIR = the directory of the crayon-architect tools
# $CRAYON_PROJECT_DIR = the directory to run the build tools in - uses pwd if undefined, this will be the working directory
# Any other environment variables you set in an included file in a PRE step.
#
DEPLOY_BUILD_OUTPUT_DIR=./site
# Any of the following parts can be skipped (or skip the next item in line) by setting ${OPTION}_SKIP=true in the included files or environment
#
# These are 'sourced' before the build command
CRAYON_PRE_BUILD=("${CRAYON_ARCHITECT_DIR}/build_helpers/git-info-pre.inc.sh")
# Build tool command
CRAYON_CMD_BUILD="mkdocs build -d ${DEPLOY_BUILD_OUTPUT_DIR}"
# These are 'sourced' after a successful build command
CRAYON_POST_BUILD=()
#
# These are 'sourced' before the clean command
CRAYON_PRE_CLEAN=()
# Clean tool command
CRAYON_CMD_CLEAN="rm -rf ${DEPLOY_BUILD_OUTPUT_DIR}"
# These are 'sourced' after a successful clean command
CRAYON_POST_CLEAN=()
# 
# These are 'sourced' before the serve command
CRAYON_PRE_SERVE=()
# Serve tool command
CRAYON_CMD_SERVE="mkdocs serve"
# These are 'sourced' after a successful serve command
CRAYON_POST_SERVE=()
#
# These are 'sourced' before the deploy command
CRAYON_PRE_DEPLOY=("${CRAYON_ARCHITECT_DIR}/deploy_helpers/travis-pre.inc.sh")
# Deploy tool command
CRAYON_CMD_DEPLOY="${CRAYON_ARCHITECT_DIR}/deploy_helpers/git-deploy.cmd.sh"
# These are 'sourced' after a successful deploy command
CRAYON_POST_DEPLOY=()

