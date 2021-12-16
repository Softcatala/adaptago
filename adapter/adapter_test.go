package adapter

import (
	"github.com/softcatala/adaptago/projectpath"
	"path/filepath"
	"testing"
)

func Test_adapter_Adapt(t *testing.T) {

	sed2valencia := filepath.Join(projectpath.Root, "./tests/src2valencia.sed")
	templatePoFile := filepath.Join(projectpath.Root, "./res/template.po")

	tests := []struct {
		name      string
		sedString string
		sedFile   string
		input     string
		output    string
		wantErr   bool
	}{{
		"Empty input errors",
		"",
		"",
		"",
		"",
		true,
	}, {
		"Non empty input succeeds",
		"s/abc/xyz/g",
		"",
		"Hola",
		"Hola",
		false,
	}, {
		"Replace works",
		"s/abc/xyz/g",
		"",
		"foo abc bar",
		"foo xyz bar",
		false,
	}, {
		"Replace works",
		"",
		sed2valencia,
		"Surt",
		"Ix",
		false,
	}, {
		"Non replace works",
		"",
		sed2valencia,
		"Taula",
		"Taula",
		false,
	}}
	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {

			var a *adapter
			var err error
			var got *Result

			if tt.sedString != "" {
				a, err = NewString(tt.sedString)
			} else if tt.sedFile != "" {
				a, err = NewFile(tt.sedFile, templatePoFile)
			}

			if err == nil {
				got, err = a.Adapt(tt.input)
			}

			if (err != nil) != tt.wantErr {
				t.Errorf("Adapt() error = %v, wantErr %v", err, tt.wantErr)
				return
			}
			if tt.output != got.Adapted {
				t.Errorf("Adapt() got = %v, want %v", got.Adapted, tt.output)
			}
		})
	}
}
