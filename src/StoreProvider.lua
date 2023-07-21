local React = require(script.Parent.Parent.React)

local StoreContext = require(script.Parent.StoreContext)

local StoreProvider = React.Component:extend("StoreProvider")

function StoreProvider.validateProps(props)
	local store = props.store
	if store == nil then
		return false, "Error initializing StoreProvider. Expected a `store` prop to be a Rodux store."
	end
	return true
end

function StoreProvider:init(props)
	self.store = props.store
end

function StoreProvider:render()
	return React.createElement(StoreContext.Provider, {
		value = self.store
	}, self.props.children)
end

return StoreProvider
