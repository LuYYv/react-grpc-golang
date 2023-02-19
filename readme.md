# dev

webapp: `cd webapp && yarn dev` 

server: `cd server && go run .`

proxy: `envoy -c envoy.yaml -l off --component-log-level upstream:debug,connection:trace`