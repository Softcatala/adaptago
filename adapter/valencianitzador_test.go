package adapter

import (
	powrapper "github.com/softcatala/adaptago/po"
	"github.com/softcatala/adaptago/projectpath"
	"path/filepath"
	"testing"
)

func TestValencianitzador_AdaptPo(t *testing.T) {

	sed2valencia := filepath.Join(projectpath.Root, "./tests/src2valencia.sed")
	templatePoFile := filepath.Join(projectpath.Root, "./res/template.po")

	v, _ := NewValencianitzador(sed2valencia)

	tests := []struct {
		name    string
		input   string
		want    string
		wantErr bool
	}{{
		"No canvia textos invariants",
		"Taula",
		"Taula",
		false,
	},
		{
			"Canvia textos invariants",
			"Surt",
			"Ix",
			false,
		}}
	for _, tt := range tests {

		po, _ := powrapper.NewWrapper(templatePoFile)

		t.Run(tt.name, func(t *testing.T) {
			got, err := po.Execute(tt.input, v.AdaptPo)
			if (err != nil) != tt.wantErr {
				t.Errorf("AdaptPo() error = %v, wantErr %v", err, tt.wantErr)
				return
			}
			if got != tt.want {
				t.Errorf("AdaptPo() got = %v, want %v", got, tt.want)
			}
		})
	}
}
