webpackJsonp([1], {
    "+skl": function (t, e) {
    }, "5HDg": function (t, e) {
    }, "5J9y": function (t, e) {
    }, "7zV9": function (t, e) {
    }, NHnr: function (t, e, a) {
        "use strict";
        Object.defineProperty(e, "__esModule", {value: !0});
        var i = a("7+uW"), s = {
            render: function () {
                var t = this.$createElement, e = this._self._c || t;
                return e("div", {attrs: {id: "app"}}, [e("router-view")], 1)
            }, staticRenderFns: []
        };
        var n = a("VU/8")({name: "App"}, s, !1, function (t) {
            a("5J9y")
        }, null, null).exports, o = a("/ocq"), r = a("mvHQ"), l = a.n(r), c = a("mtWM"), d = a.n(c), h = {
            name: "ArticleEditor", data: function () {
                return {
                    isShowTagSelectModel: !1,
                    containerHeight: "500px",
                    types: [],
                    showTags: [],
                    tags: [],
                    selectedTags: [],
                    defaultTypeLabel: "",
                    article: {id: null, typeId: "", title: "", markdownContent: "", tags: []},
                    editorSetting: {
                        bold: !0,
                        italic: !0,
                        header: !0,
                        underline: !0,
                        strikethrough: !0,
                        mark: !0,
                        superscript: !0,
                        subscript: !0,
                        quote: !0,
                        ol: !0,
                        ul: !0,
                        link: !0,
                        imagelink: !0,
                        code: !0,
                        table: !0,
                        fullscreen: !0,
                        readmodel: !0,
                        help: !0,
                        undo: !0,
                        redo: !0,
                        save: !0,
                        navigation: !0,
                        alignleft: !0,
                        aligncenter: !0,
                        alignright: !0,
                        preview: !0
                    }
                }
            }, methods: {
                goHome: function () {
                    location.href = "/"
                }, showTagSelectModel: function () {
                    this.isShowTagSelectModel = !0
                }, loadArticle: function (t) {
                    var e = this;
                    this.$Loading.start(), this.$http.post("/article-rest/" + t).then(function (t) {
                        200 === t.code ? (e.$Loading.finish(), e.article = t.data, document.title = e.article.title, e.tagChecked(), e.typeChecked()) : e.$Loading.error()
                    })
                }, tagChange: function (t) {
                    if (t.length > 5) {
                        this.$Message.error("标签最多选择5个");
                        for (var e = [], a = 0; a < this.article.tags.length; a++) e.push(this.article.tags[a].name);
                        this.selectedTags = e
                    } else {
                        for (var i = [], s = 0; s < this.tags.length; s++) for (var n = 0; n < t.length; n++) this.tags[s].name === t[n] && i.push(this.tags[s]);
                        this.article.tags = i
                    }
                }, updateArticle: function () {
                    this.postArticle("更新成功", function () {
                    })
                }, saveArticle: function () {
                    this.postArticle("保存成功", function () {
                        location.href = "/"
                    })
                }, postArticle: function (t, e) {
                    var a = this;
                    if (this.preCheck()) {
                        var i = this.getHeadImgs();
                        this.$Loading.start(), this.$http.post("/article-rest/save", {
                            id: this.article.id,
                            typeId: this.article.typeId,
                            title: this.article.title,
                            contentType: "MARKDOWN",
                            markdownContent: this.article.markdownContent,
                            htmlContent: this.$refs.md.d_render,
                            tagIds: this.getTagIds(),
                            headImg: i.length > 0 ? l()(i) : ""
                        }).then(function (i) {
                            if (200 !== i.code) return a.$Loading.error(), void a.$Message.error(i.message);
                            a.$Loading.finish(), a.article.id = i.data, a.$Message.success(t), e()
                        })
                    }
                }, preCheck: function () {
                    return this.article.title ? this.article.title.length > 40 ? (this.$Message.error("标题不能超过40个字符"), !1) : this.article.markdownContent ? this.article.typeId ? !(!this.article.tags || 0 === this.article.tags.length) || (this.$Message.error("标签不能为空"), !1) : (this.$Message.error("类别不能为空"), !1) : (this.$Message.error("内容不能为空"), !1) : (this.$Message.error("标题不能为空"), !1)
                }, tagChecked: function () {
                    if (0 !== this.tags.length) for (var t = 0; t < this.tags.length; t++) for (var e = 0; e < this.article.tags.length; e++) this.article.tags[e].id === this.tags[t].id && this.selectedTags.push(this.tags[t].name)
                }, typeChecked: function () {
                    if (0 !== this.types.length) {
                        for (var t = 0; t < this.types.length; t++) console.info(this.types[t].id === this.article.typeId), this.types[t].id === this.article.typeId && (this.defaultTypeLabel = this.types[t].name);
                        console.info(this.defaultTypeLabel)
                    }
                }, getTagIds: function () {
                    for (var t = [], e = 0; e < this.article.tags.length; e++) t.push(this.article.tags[e].id);
                    return t
                }, getHeadImgs: function () {
                    for (var t = /!\[(.*?)\]\((.*?)\)/gm, e = [], a = void 0; null !== (a = t.exec(this.article.markdownContent));) e.push({
                        alt: a[1],
                        url: a[2]
                    });
                    return e
                }, addImg: function (t, e) {
                    var a = this, i = new FormData;
                    i.append("image", e), this.$Loading.start(), d()({
                        url: "/file-rest/upload",
                        method: "post",
                        data: i,
                        headers: {"Content-Type": "multipart/form-data", token: localStorage.getItem("token")}
                    }).then(function (e) {
                        200 === e.code ? (a.$Loading.finish(), a.$refs.md.$img2Url(t, e.data)) : a.$Loading.error()
                    })
                }, delTag: function (t, e) {
                    for (var a = 0; a < this.article.tags.length; a++) this.article.tags[a].name === e && this.article.tags.splice(a, 1)
                }, addTag: function () {
                }, loadTags: function () {
                    var t = this;
                    this.$Loading.start(), this.$http.post("/tag-rest/all").then(function (e) {
                        if (200 === e.code) {
                            t.$Loading.finish();
                            var a = e.data;
                            t.tags = e.data;
                            for (var i = [], s = 0; s < a.length; s++) {
                                for (var n = !1, o = 0; o < i.length; o++) a[s].groupName === i[o].groupName && (i[o].tags.push(a[s]), n = !0);
                                n || i.push({groupName: a[s].groupName, tags: [a[s]]})
                            }
                            t.showTags = i, t.tagChecked()
                        } else t.$Loading.error()
                    })
                }, loadTypes: function () {
                    var t = this;
                    this.$Loading.start(), this.$http.post("/article-rest/editArticleTypes").then(function (e) {
                        200 === e.code ? (t.$Loading.finish(), t.types = e.data, t.typeChecked()) : t.$Loading.error()
                    })
                }
            }, created: function () {
                var t = window.innerHeight;
                this.containerHeight = t + "px", this.loadTags(), this.loadTypes(), this.$route.params.id ? this.loadArticle(this.$route.params.id) : (document.title = "写文章", this.article.markdownContent = "# 一 一级标题\n\n## 1.1 二级标题\n\n- xxxx;\n- xxxx;\n\n## 1.2 二级标题\n\n1. xxxx;\n2. xxxx;")
            }
        }, g = {
            render: function () {
                var t = this, e = t.$createElement, a = t._self._c || e;
                return a("div", {
                    staticClass: "article-editor article-box",
                    style: {height: t.containerHeight}
                }, [a("Modal", {
                    attrs: {title: "选择标签", "mask-closable": !1},
                    model: {
                        value: t.isShowTagSelectModel, callback: function (e) {
                            t.isShowTagSelectModel = e
                        }, expression: "isShowTagSelectModel"
                    }
                }, t._l(t.showTags, function (e, i) {
                    return a("div", {key: i}, [a("h3", {staticClass: "tag-group"}, [t._v(t._s(e.groupName))]), t._v(" "), a("CheckboxGroup", {
                        on: {"on-change": t.tagChange},
                        model: {
                            value: t.selectedTags, callback: function (e) {
                                t.selectedTags = e
                            }, expression: "selectedTags"
                        }
                    }, t._l(e.tags, function (t) {
                        return a("Checkbox", {key: t.id, attrs: {border: "", label: t.name}})
                    }), 1)], 1)
                }), 0), t._v(" "), a("div", {staticClass: "article-box-title"}, [a("div", {staticClass: "article-box--title-home"}, [a("Button", {
                    attrs: {type: "info"},
                    on: {click: t.goHome}
                }, [t._v("返回首页")])], 1), t._v(" "), a("input", {
                    directives: [{
                        name: "model",
                        rawName: "v-model",
                        value: t.article.title,
                        expression: "article.title"
                    }],
                    staticClass: "article-box-title-input",
                    attrs: {placeholder: "这里输入文章标题"},
                    domProps: {value: t.article.title},
                    on: {
                        input: function (e) {
                            e.target.composing || t.$set(t.article, "title", e.target.value)
                        }
                    }
                })]), t._v(" "), a("mavon-editor", {
                    ref: "md",
                    staticClass: "article-box-content",
                    style: {zIndex: 0},
                    attrs: {placeholder: "这里输入文章内容，markdown格式。", toolbars: t.editorSetting},
                    on: {save: t.updateArticle, imgAdd: t.addImg},
                    model: {
                        value: t.article.markdownContent, callback: function (e) {
                            t.$set(t.article, "markdownContent", e)
                        }, expression: "article.markdownContent"
                    }
                }), t._v(" "), a("div", {staticClass: "article-box-foot"}, [a("Select", {
                    staticClass: "article-box-foot-type",
                    attrs: {placeholder: "选择所属分类"},
                    model: {
                        value: t.article.typeId, callback: function (e) {
                            t.$set(t.article, "typeId", e)
                        }, expression: "article.typeId"
                    }
                }, t._l(t.types, function (e) {
                    return a("Option", {key: e.id, attrs: {value: e.id}}, [t._v(t._s(e.name))])
                }), 1), t._v(" "), a("div", {staticClass: "article-box-foot-tag"}, [t._l(t.article.tags, function (e) {
                    return a("Tag", {
                        key: e.id,
                        attrs: {name: e.name, closable: "", type: "border", color: "success"},
                        on: {"on-close": t.delTag}
                    }, [t._v(t._s(e.name))])
                }), t._v(" "), a("Button", {
                    attrs: {type: "dashed", size: "small"},
                    on: {click: t.showTagSelectModel}
                }, [t._v("添加标签")])], 2), t._v(" "), a("div", {staticClass: "article-box-foot-publish"}, [a("Button", {
                    attrs: {type: "info"},
                    on: {click: t.updateArticle}
                }, [t._v("保存并继续编辑")]), t._v("    \n      "), a("Button", {
                    attrs: {type: "success"},
                    on: {click: t.saveArticle}
                }, [t._v("发布")])], 1)], 1)], 1)
            }, staticRenderFns: []
        };
        var u = a("VU/8")(h, g, !1, function (t) {
            a("5HDg")
        }, "data-v-50ff284e", null).exports, p = {
            name: "FaqEditor", data: function () {
                return {
                    isShowTagSelectModel: !1,
                    containerHeight: "500px",
                    showTags: [],
                    tags: [],
                    selectedTags: [],
                    article: {id: null, title: "", markdownContent: "", tags: []},
                    editorSetting: {
                        bold: !0,
                        italic: !0,
                        header: !0,
                        underline: !0,
                        strikethrough: !0,
                        mark: !0,
                        superscript: !0,
                        subscript: !0,
                        quote: !0,
                        ol: !0,
                        ul: !0,
                        link: !0,
                        imagelink: !0,
                        code: !0,
                        table: !0,
                        fullscreen: !0,
                        readmodel: !0,
                        help: !0,
                        undo: !0,
                        redo: !0,
                        save: !0,
                        navigation: !0,
                        alignleft: !0,
                        aligncenter: !0,
                        alignright: !0,
                        preview: !0
                    }
                }
            }, methods: {
                goHome: function () {
                    location.href = "/faq"
                }, showTagSelectModel: function () {
                    this.isShowTagSelectModel = !0
                }, loadArticle: function (t) {
                    var e = this;
                    this.$Loading.start(), this.$http.post("/faq-rest/" + t).then(function (t) {
                        200 === t.code ? (e.$Loading.finish(), e.article = t.data, document.title = e.article.title, e.tagChecked(), e.typeChecked()) : e.$Loading.error()
                    })
                }, tagChange: function (t) {
                    if (t.length > 5) {
                        this.$Message.error("标签最多选择5个");
                        for (var e = [], a = 0; a < this.article.tags.length; a++) e.push(this.article.tags[a].name);
                        this.selectedTags = e
                    } else {
                        for (var i = [], s = 0; s < this.tags.length; s++) for (var n = 0; n < t.length; n++) this.tags[s].name === t[n] && i.push(this.tags[s]);
                        this.article.tags = i
                    }
                }, updateArticle: function () {
                    this.postArticle("更新成功", function () {
                    })
                }, saveArticle: function () {
                    this.postArticle("保存成功", function () {
                        location.href = "/faq"
                    })
                }, postArticle: function (t, e) {
                    var a = this;
                    if (this.preCheck()) {
                        var i = this.getHeadImgs();
                        this.$Loading.start(), this.$http.post("/faq-rest/save", {
                            id: this.article.id,
                            typeId: this.article.typeId,
                            title: this.article.title,
                            contentType: "MARKDOWN",
                            markdownContent: this.article.markdownContent,
                            htmlContent: this.$refs.md.d_render,
                            tagIds: this.getTagIds(),
                            headImg: i.length > 0 ? l()(i) : ""
                        }).then(function (i) {
                            if (200 !== i.code) return a.$Loading.error(), void a.$Message.error(i.message);
                            a.$Loading.finish(), a.article.id = i.data, a.$Message.success(t), e()
                        })
                    }
                }, preCheck: function () {
                    return this.article.title ? this.article.title.length > 40 ? (this.$Message.error("标题不能超过40个字符"), !1) : this.article.markdownContent ? !(!this.article.tags || 0 === this.article.tags.length) || (this.$Message.error("标签不能为空"), !1) : (this.$Message.error("内容不能为空"), !1) : (this.$Message.error("标题不能为空"), !1)
                }, tagChecked: function () {
                    if (0 !== this.tags.length) for (var t = 0; t < this.tags.length; t++) for (var e = 0; e < this.article.tags.length; e++) this.article.tags[e].id === this.tags[t].id && this.selectedTags.push(this.tags[t].name)
                }, getTagIds: function () {
                    for (var t = [], e = 0; e < this.article.tags.length; e++) t.push(this.article.tags[e].id);
                    return t
                }, getHeadImgs: function () {
                    for (var t = /!\[(.*?)\]\((.*?)\)/gm, e = [], a = void 0; null !== (a = t.exec(this.article.markdownContent));) e.push({
                        alt: a[1],
                        url: a[2]
                    });
                    return e
                }, addImg: function (t, e) {
                    var a = this, i = new FormData;
                    i.append("image", e), this.$Loading.start(), d()({
                        url: "/file-rest/upload",
                        method: "post",
                        data: i,
                        headers: {"Content-Type": "multipart/form-data", token: localStorage.getItem("token")}
                    }).then(function (e) {
                        200 === e.code ? (a.$Loading.finish(), a.$refs.md.$img2Url(t, e.data)) : a.$Loading.error()
                    })
                }, delTag: function (t, e) {
                    for (var a = 0; a < this.article.tags.length; a++) this.article.tags[a].name === e && this.article.tags.splice(a, 1)
                }, loadTags: function () {
                    var t = this;
                    this.$Loading.start(), this.$http.post("/tag-rest/all").then(function (e) {
                        if (200 === e.code) {
                            t.$Loading.finish();
                            var a = e.data;
                            t.tags = e.data;
                            for (var i = [], s = 0; s < a.length; s++) {
                                for (var n = !1, o = 0; o < i.length; o++) a[s].groupName === i[o].groupName && (i[o].tags.push(a[s]), n = !0);
                                n || i.push({groupName: a[s].groupName, tags: [a[s]]})
                            }
                            t.showTags = i, t.tagChecked()
                        } else t.$Loading.error()
                    })
                }
            }, created: function () {
                var t = window.innerHeight;
                this.containerHeight = t + "px", this.loadTags(), this.$route.params.id ? this.loadArticle(this.$route.params.id) : (document.title = "提问题", this.article.markdownContent = "# 一 一级标题\n\n## 1.1 二级标题\n\n- xxxx;\n- xxxx;\n\n## 1.2 二级标题\n\n1. xxxx;\n2. xxxx;")
            }
        }, f = {
            render: function () {
                var t = this, e = t.$createElement, a = t._self._c || e;
                return a("div", {
                    staticClass: "article-editor article-box",
                    style: {height: t.containerHeight}
                }, [a("Modal", {
                    attrs: {title: "选择标签", "mask-closable": !1},
                    model: {
                        value: t.isShowTagSelectModel, callback: function (e) {
                            t.isShowTagSelectModel = e
                        }, expression: "isShowTagSelectModel"
                    }
                }, t._l(t.showTags, function (e, i) {
                    return a("div", {key: i}, [a("h3", {staticClass: "tag-group"}, [t._v(t._s(e.groupName))]), t._v(" "), a("CheckboxGroup", {
                        on: {"on-change": t.tagChange},
                        model: {
                            value: t.selectedTags, callback: function (e) {
                                t.selectedTags = e
                            }, expression: "selectedTags"
                        }
                    }, t._l(e.tags, function (t) {
                        return a("Checkbox", {key: t.id, attrs: {border: "", label: t.name}})
                    }), 1)], 1)
                }), 0), t._v(" "), a("div", {staticClass: "article-box-title"}, [a("div", {staticClass: "article-box--title-home"}, [a("Button", {
                    attrs: {type: "info"},
                    on: {click: t.goHome}
                }, [t._v("返回首页")])], 1), t._v(" "), a("input", {
                    directives: [{
                        name: "model",
                        rawName: "v-model",
                        value: t.article.title,
                        expression: "article.title"
                    }],
                    staticClass: "article-box-title-input",
                    attrs: {placeholder: "这里输入问题描述"},
                    domProps: {value: t.article.title},
                    on: {
                        input: function (e) {
                            e.target.composing || t.$set(t.article, "title", e.target.value)
                        }
                    }
                })]), t._v(" "), a("mavon-editor", {
                    ref: "md",
                    staticClass: "article-box-content",
                    style: {zIndex: 0},
                    attrs: {placeholder: "这里输入问题内容，markdown格式。", toolbars: t.editorSetting},
                    on: {save: t.updateArticle, imgAdd: t.addImg},
                    model: {
                        value: t.article.markdownContent, callback: function (e) {
                            t.$set(t.article, "markdownContent", e)
                        }, expression: "article.markdownContent"
                    }
                }), t._v(" "), a("div", {staticClass: "article-box-foot"}, [a("div", {staticClass: "article-box-foot-tag"}, [t._l(t.article.tags, function (e) {
                    return a("Tag", {
                        key: e.id,
                        attrs: {name: e.name, closable: "", type: "border", color: "success"},
                        on: {"on-close": t.delTag}
                    }, [t._v(t._s(e.name))])
                }), t._v(" "), a("Button", {
                    attrs: {type: "dashed", size: "small"},
                    on: {click: t.showTagSelectModel}
                }, [t._v("添加标签")])], 2), t._v(" "), a("div", {staticClass: "article-box-foot-publish"}, [a("Button", {
                    attrs: {type: "info"},
                    on: {click: t.updateArticle}
                }, [t._v("保存并继续编辑")]), t._v("    \n      "), a("Button", {
                    attrs: {type: "success"},
                    on: {click: t.saveArticle}
                }, [t._v("发布")])], 1)])], 1)
            }, staticRenderFns: []
        };
        var m = a("VU/8")(p, f, !1, function (t) {
            a("7zV9")
        }, "data-v-6a5557c7", null).exports;
        i.default.use(o.a);
        var v = new o.a({
            mode: "history",
            routes: [{path: "/article/editor", component: u}, {
                path: "/article/editor/:id",
                component: u
            }, {path: "/faq/editor", component: m}, {path: "/faq/editor/:id", component: m}]
        }), k = a("//Fk"), x = a.n(k), $ = a("BTaQ"), C = a.n($);
        d.a.defaults.timeout = 1e5, d.a.defaults.baseURL = "", (location.href.includes("127.0.0.1") || location.href.includes("localhost")) && (d.a.defaults.baseURL = "http://localhost:8080"), d.a.interceptors.request.use(function (t) {
            return "multipart/form-data" !== t.headers["Content-Type"] && (t.headers["Content-Type"] = "application/json;charset=UTF-8"), t.headers.token = localStorage.getItem("token"), t
        }, function (t) {
            return x.a.reject(t.response)
        }), d.a.interceptors.response.use(function (t) {
            return 80008998 === t.data.code && (C.a.Message.error(t.data.message), window.location.href = window.location.origin + "/?toast=" + t.data.message), t.data
        }, function (t) {
            return x.a.reject(t.response)
        });
        var w = d.a, y = a("OS1Z"), T = a.n(y);
        a("+skl"), a("pw1w");
        i.default.config.productionTip = !1, i.default.prototype.$http = w, i.default.use(C.a), i.default.use(T.a), new i.default({
            el: "#app",
            router: v,
            components: {App: n},
            template: "<App/>"
        })
    }, pw1w: function (t, e) {
    }
}, ["NHnr"]);
//# sourceMappingURL=app.35c1d0605b0faafcc3b8.js.map