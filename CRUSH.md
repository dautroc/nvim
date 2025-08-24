# CRUSH Guidelines for Neovim Configuration Repository

## Build, Lint, and Test Commands
- Build: Run Neovim in headless mode with `nvim --headless +"lua require('lazy-setup')" +qa` to load the configuration.
- Lint: Execute `stylua lua/ && luacheck lua/` for formatting and static analysis.
- Test: Run a single test (if available) using your framework, e.g., `busted -l <testname>` or a custom script.

## Code Style Guidelines
- Follow Stylua formatting; limit lines to 80-100 characters with 2-space indentation.
- Use explicit module imports via `require` and prefer local variables.
- Naming conventions: use snake_case for variables/functions and PascalCase for modules.
- Add type annotations where applicable and ensure clear error handling with descriptive messages.
- Maintain separation of concerns across configuration files (e.g., keymaps, autocommands, options).

## Additional Guidelines
- Include any existing Cursor rules (in .cursor/rules/ or .cursorrules) and Copilot guidelines (in .github/copilot-instructions.md) if present.
- Always run lint, type checks, and tests before merging changes.
- Write clear commit messages that explain the "why" behind the change.
- Keep the code modular, maintainable, and consistent with Neovim Lua best practices.

💘 Generated with Crush
Co-Authored-By: Crush <crush@charm.land>
