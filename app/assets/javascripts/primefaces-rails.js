String.prototype.format = function(args) {
    var newStr = this;
    for (var key in args) {
        newStr = newStr.replace(new RegExp('{' + key + '}', "g"), args[key]);
    }
    return newStr;
}

/**
 * PrimeFaces InputText Widget
 */
PrimeFaces.widget.InputText = PrimeFaces.widget.BaseWidget.extend({
    init: function(cfg) {
        this._super(cfg);
        if (cfg.spinner) {
            this.jq.puispinner(cfg);
        } else {
            this.jq.puiinputtext(cfg);
        }
    }
});

/**
 * PrimeFaces InputText Widget
 */
PrimeFaces.widget.InputTextarea = PrimeFaces.widget.BaseWidget.extend({
    init: function(cfg) {
        this._super(cfg);
        if (this.cfg.counter) {
            this.cfg.counter = $(PrimeFaces.escapeClientId(this.cfg.counter))
        }
        this.jq.puiinputtextarea(this.cfg);
    }
});

/**
 * PrimeFaces TabView Widget
 */
PrimeFaces.widget.TabView = PrimeFaces.widget.BaseWidget.extend({
    init: function(cfg) {
        this._super(cfg);
        this.jq.puitabview(cfg);
    }
});


/**
 * PrimeFaces Button Widget
 */
PrimeFaces.widget.Button = PrimeFaces.widget.BaseWidget.extend({
    init: function(cfg) {
        this._super(cfg);
        this.jq.puibutton(cfg);
    }
});

/**
 * PrimeFaces Button Widget
 */
PrimeFaces.widget.Dialog = PrimeFaces.widget.BaseWidget.extend({
    init: function(cfg) {
        this._super(cfg);
        this.jq.puidialog(cfg);
    }
});

/**
 * PrimeFaces Checkbox Widget
 */
PrimeFaces.widget.CheckBox = PrimeFaces.widget.BaseWidget.extend({
    init: function(cfg) {
        this._super(cfg);
        this.jq.puicheckbox(cfg);
    }
});

/**
 * PrimeFaces Fieldset Widget
 */
PrimeFaces.widget.Fieldset = PrimeFaces.widget.BaseWidget.extend({
    init: function(cfg) {
        this._super(cfg);
        this.jq.puifieldset(cfg);
    }
});

/**
 * PrimeFaces Breadcrumb Widget
 */
PrimeFaces.widget.Breadcrumb = PrimeFaces.widget.BaseWidget.extend({
    init: function(cfg) {
        this._super(cfg);
        this.jq.puibreadcrumb(cfg);
    }
});

/**
 * PrimeFaces Panel Widget
 */
PrimeFaces.widget.Panel = PrimeFaces.widget.BaseWidget.extend({
    init: function(cfg) {
        this._super(cfg);
        this.jq.puipanel(cfg);
    }
});

/**
 * PrimeFaces Password Widget
 */
PrimeFaces.widget.Password = PrimeFaces.widget.BaseWidget.extend({
    init: function(cfg) {
        this._super(cfg);
        this.jq.puipassword(cfg);
    }
});

/**
 * PrimeFaces Progressbar Widget
 */
PrimeFaces.widget.Progressbar = PrimeFaces.widget.BaseWidget.extend({
    init: function(cfg) {
        this._super(cfg);
        this.jq.puiprogressbar(cfg);
    }
});


/**
 * PrimeFaces Tooltip Widget
 */
PrimeFaces.widget.Tooltip = PrimeFaces.widget.BaseWidget.extend({
    init: function(cfg) {
        this._super(cfg);

        if (cfg.global) {
            $(document).puitooltip(cfg);
        } else {
            forId = PrimeFaces.escapeClientId(cfg.for);
            $(forId).puitooltip(cfg);
        }
    }
});

/**
 * PrimeFaces Dropdown Widget
 */
PrimeFaces.widget.Dropdown = PrimeFaces.widget.BaseWidget.extend({
    init: function(cfg) {
        this._super(cfg);
        if (cfg.content) {
            contentFunc = cfg.content;
            cfg.content = function(opt) { return contentFunc.format({ option: opt });};            
        }
        if (cfg.listbox) {
            this.jq.puilistbox(cfg);
        } else {
            this.jq.puidropdown(cfg);
        }
    }
});


/**
 * PrimeFaces Accordion Widget
 */
PrimeFaces.widget.Accordion = PrimeFaces.widget.BaseWidget.extend({
    init: function(cfg) {
        this._super(cfg);
        this.jq.puiaccordion(cfg);
    }
});


/**
 * PrimeFaces Accordion Widget
 */
PrimeFaces.widget.RadioButton = PrimeFaces.widget.BaseWidget.extend({
    init: function(cfg) {
        this._super(cfg);
        this.jq.find(':radio').puiradiobutton(cfg);
    }
});

/**
 * PrimeFaces Growl Widget
 */
PrimeFaces.widget.Growl = PrimeFaces.widget.BaseWidget.extend({
    init: function(cfg) {
        this._super(cfg);
        _self = this;

        this.jq.puigrowl(cfg);

        addMessage = function(msg) {
            _self.jq.puigrowl('show', msg)
        }

        if (cfg.messages) {
            addMessage(cfg.messages);
        }
    }
});

/**
 * PrimeFaces Menu Widget
 */
PrimeFaces.widget.Menu = PrimeFaces.widget.BaseWidget.extend({
    init: function(cfg) {
        this._super(cfg);
        _self = this;

        if (this.cfg.trigger) {
            this.cfg.trigger = $(PrimeFaces.escapeClientId(this.cfg.trigger))
        }

        this.jq.puimenu(cfg);
    }
});

/**
 * PrimeFaces Menubar Widget
 */
PrimeFaces.widget.Menubar = PrimeFaces.widget.BaseWidget.extend({
    init: function(cfg) {
        this._super(cfg);
        _self = this;

        this.jq.puimenubar(cfg);
    }
});

/**
 * PrimeFaces ContextMenu Widget
 */
PrimeFaces.widget.ContextMenu = PrimeFaces.widget.BaseWidget.extend({
    init: function(cfg) {
        this._super(cfg);
        _self = this;

        if (this.cfg.target) {
            this.cfg.target = $(PrimeFaces.escapeClientId(this.cfg.target))
        }

        this.jq.puicontextmenu(cfg);
    }
});

/**
 * PrimeFaces SlideMenu Widget
 */
PrimeFaces.widget.SlideMenu = PrimeFaces.widget.BaseWidget.extend({
    init: function(cfg) {
        this._super(cfg);
        _self = this;

        if (this.cfg.trigger) {
            this.cfg.trigger = $(PrimeFaces.escapeClientId(this.cfg.trigger))
        }

        this.jq.puislidemenu(cfg);
    }
});


/**
 * PrimeFaces TieredMenu Widget
 */
PrimeFaces.widget.TieredMenu = PrimeFaces.widget.BaseWidget.extend({
    init: function(cfg) {
        this._super(cfg);
        _self = this;

        if (this.cfg.trigger) {
            this.cfg.trigger = $(PrimeFaces.escapeClientId(this.cfg.trigger))
        }

        this.jq.puitieredmenu(cfg);
    }
});