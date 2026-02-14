if vim.g.jdtls_started then
    return
end

local workspace_dir = vim.fn.expand('~/.cache/jdtls/workspace/' .. vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t'))
vim.fn.mkdir(workspace_dir, 'p')

local mason_path = vim.fn.stdpath('data') .. '/mason'
local jdtls_path = mason_path .. '/packages/jdtls'

local lombok_path = jdtls_path .. '/lombok.jar'

if vim.fn.filereadable(lombok_path) ~= 1 then
    vim.notify('Lombok not found at: ' .. lombok_path, vim.log.levels.WARN)
    lombok_path = nil
else
    vim.notify('Lombok found: ' .. lombok_path, vim.log.levels.INFO)
end

local launcher = vim.fn.glob(jdtls_path .. '/plugins/org.eclipse.equinox.launcher_*.jar')
if launcher == '' then
    vim.notify('JDTLS launcher not found! Run :MasonInstall jdtls', vim.log.levels.ERROR)
    return
end

local function find_root_dir()
    local root_files = { '.git', 'pom.xml', 'build.gradle', 'mvnw', 'gradlew' }
    local found_files = vim.fs.find(root_files, { upward = true })

    if found_files and #found_files > 0 then
        return vim.fs.dirname(found_files[1])
    else
        return vim.fn.getcwd()
    end
end

local cmd_args = {
    'java',
    '--add-opens', 'java.base/java.util=ALL-UNNAMED',
    '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
    '-jar', launcher,
    '-configuration', jdtls_path .. '/config_mac',
    '-data', workspace_dir
}

if lombok_path then
    table.insert(cmd_args, 4, '-javaagent:' .. lombok_path)
    table.insert(cmd_args, 5, '-noverify')
end

local config = {
    cmd = cmd_args,
    root_dir = find_root_dir,
    settings = {
        java = {
            configuration = {
                runtimes = {
                    {
                        name = "JavaSE-21",
                        path = "/Library/Java/JavaVirtualMachines/jdk-21.jdk/Contents/Home",
                        default = true
                    }
                }
            },
            maven = {
                downloadSources = true
            }
        }
    },
    init_options = {
        extendedClientCapabilities = {
            classFileContentsSupport = true
        }
    }
}

require('lspconfig').jdtls.setup(config)

vim.g.jdtls_started = true
